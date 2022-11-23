<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoOrderLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderArrive;
use App\Http\Controllers\Library\Cainiao\OrderQuery;
use App\Http\Controllers\Library\Cainiao\OrderSign;



class OrderArriveSign extends Controller
{
    //快件到达签收

    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request) {

        $adminInfo = $request->get('adminInfo');
        if(!$request->filled(['mailNo', 'type'])) return $this->ReturnJson();
        if(!in_array($request->type,[1,2])) return $this->ReturnJson(400403, '参数类型错误');
        if($request->type == 2){
            if(!isset($request->text)) return $this->ReturnJson();
        }
        if(Cache::get($request->mailNo.'wzj'))   return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        if(Cache::get($request->mailNo.'ok'))    return $this->ReturnJson(200201,'该订单已到达签收');
        if(Cache::get($request->mailNo.'no'))    return $this->ReturnJson(400413,'订单已退货');
        if(Cache::get($request->mailNo.'error')) return $this->ReturnJson(400413,'订单签收异常,请联系管理员');
        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'logisticsOrderCode','order_status', 'mailNo')->first();

        if(!$GoodsInfo){
            //入库失败,是无主件
            Cache::put($request->mailNo.'wzj','1',20);
            return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        }

        if($GoodsInfo->order_status == 5){
            Cache::put($request->mailNo.'ok','1',20);
            return $this->ReturnJson(200201,'该订单已到达签收');
        }

        if($GoodsInfo->order_status == 6){
            Cache::put($request->mailNo.'no','1',20);
            return $this->ReturnJson(400413,'订单已退货');
        }

        if($GoodsInfo->order_status == 0){

            //处理未到达签收的部分
           if(!OrderArrive::OrderArrive($GoodsInfo)){

               Cache::put($request->mailNo.'error','1',20);
               return $this->ReturnJson(400414,'订单签收异常,请联系管理员');
           }

            if($request->type == 2){

                //走签收异常的部分
                $OrderSignError = OrderSign::SignError($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode,$request->text);

                if($OrderSignError){

                    self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已退件,退件理由是:'.$request->text.',操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);

                    return $this->ReturnJson(200201, '签收异常件,以上传至菜鸟部分');

                }else{

                    return $this->ReturnJson(400403, '订单退款异常,请联系管理员');
                }
            }

            OrderQuery::index($GoodsInfo->logisticsOrderCode);

            $OrderSign = OrderSign::SignInfo($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode);

            //快件进行签收退货
            if(!$OrderSign){

                DB::beginTransaction();
                try {
                    self::$Goods->where('mailNo', $request->mailNo)->update(['order_status' => 1, 'cainiao_node' => 4]);
                    self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);
                    DB::commit();
                    return $this->ReturnJson(200201, '到达成功');
                }catch (\Exception $e){
                    DB::rollBack();
                    return $this->ReturnJson(400403, '到达失败!');
                }
            }

            DB::beginTransaction();
            try {
                self::$Goods->where('mailNo', $request->mailNo)->update(['order_status' => '5', 'cainiao_node' => '5']);

                $dataText = [['text' => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'created_at' => date('Y-m-d H:i:s')],['text' => '菜鸟上游仓库快件已签收,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'created_at' => date('Y-m-d H:i:s')]];
                self::$GoodsLog->insert($dataText);
                DB::commit();
                return $this->ReturnJson(200201, '到达签收成功');
            }catch (\Exception $e){
                DB::rollBack();
                return $this->ReturnJson(400403, '到达签收失败!');
            }
        }

        return $this->ReturnJson(400403, '状态解析异常');
    }

}
