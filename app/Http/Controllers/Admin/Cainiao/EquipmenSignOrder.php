<?php

namespace App\Http\Controllers\Admin\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoOrderLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderArrive;
use App\Http\Controllers\Library\Cainiao\OrderQuery;
use App\Http\Controllers\Library\Cainiao\OrderSign;
use App\Http\Controllers\Library\Cainiao\OrderInbound;

class EquipmenSignOrder extends Controller
{
    //天机签收

    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request) {

        if(!$request->filled(['parcel_weight', 'mailNo', 'long', 'width', 'height', 'operator'])){

            return $this->ReturnJson();
        }

        //检查参数

        if(!$this->VerifyNum([$request->long, $request->width, $request->height, $request->parcel_weight])){

            return $this->ReturnJson(400403, '重要参数的值,不可以为0');
        }

        $adminInfo = $request->get('adminInfo');

        if(Cache::get($request->mailNo.'tj')) return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        if(Cache::get($request->mailNo.'tk')) return $this->ReturnJson(400403,'该订已退款,请知悉!');
        if(Cache::get($request->mailNo.'ok')) return $this->ReturnJson(200201,'订单已入库签收',['order_type' => $request->mailNo.'ok']);

        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'logisticsOrderCode','order_status', 'mailNo', 'conso_order_query')->first();

        if(!$GoodsInfo){

            //入库失败,是无主件
            Cache::put($request->mailNo.'tj','1',10);

            return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        }

        //体积重
        $volume = number_format(($request->long * $request->width * $request->height) / 6000, 2);

        //查询当前的状态
        if($GoodsInfo->order_status == 6){
            Cache::put($request->mailNo.'tk','1',120);
            return $this->ReturnJson(400403,'该订已退款,请知悉!');
        }

        if($GoodsInfo->order_status == 5){
            Cache::put($request->mailNo.'ok',$GoodsInfo->conso_order_query,120);
            return $this->ReturnJson(400403,'订单已入库签收',['order_type' => $GoodsInfo->conso_order_query]);
        }

        $conso_order_query = $GoodsInfo->conso_order_query;

        //没有到达节点

        $arrive = null;
        if($GoodsInfo->order_status < 1){

            //到达
            $OrderArrive = OrderArrive::OrderArrive($GoodsInfo);
            $arrive = true;
            if(!$OrderArrive) return $this->ReturnJson(400403, '包裹到达失败');
        }

        //有到达
        $OrderQuery = OrderQuery::index($GoodsInfo->logisticsOrderCode);
        $OrderSign  = OrderSign::SignInfo($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode);

        $infos = null;

        if(!$OrderSign) {

            if($arrive){

                DB::beginTransaction();
                try {
                    self::$Goods->where('mailNo')->update(['order_status' => 1, 'cainiao_node' => 4, 'long' => $request->long, 'wide' => $request->width, 'height' => $request->height, 'weight' => $request->weight]);
                    self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);
                    DB::commit();
                }catch (\Exception $e){
                    DB::rollBack();
                }
            }

            return $this->ReturnJson(400403, '包裹入库成功,签收失败');

        }else{
            DB::beginTransaction();
            try {
                self::$Goods->where('mailNo')->update(['order_status' => 5, 'cainiao_node' => 5,'long' => $request->long, 'wide' => $request->width, 'height' => $request->height, 'weight' => $request->weight]);
                self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已到达,已签收,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);

                DB::commit();
//                return $this->ReturnJson(200201, '包裹,到达,签收成功');
//                $infos = true;
            }catch (\Exception $e){
                DB::rollBack();
                return $this->ReturnJson(400403, '包裹数据写入失败,请重新录入!');
            }

        }

        //查询是不是单件,单件要做个入库动作
        if($OrderQuery == 1){

            $OrderInbound = OrderInbound::Inbond($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode);
            if(!$OrderInbound) return $this->ReturnJson(200201, '快件已到达,签收');

            DB::beginTransaction();
            try {
                self::$Goods->where('mailNo')->update(['order_status' => 10, 'cainiao_node' => 7,'long' => $request->long, 'wide' => $request->width, 'height' => $request->height, 'weight' => $request->weight]);
                self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已到达,已签收,已入库,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);
                DB::commit();
                return $this->ReturnJson(200201, '包裹,到达,签收,入库成功');
            }catch (\Exception $e){
                DB::rollBack();
                return $this->ReturnJson(400403, '入库日志失败,请重新写入入库操作');
            }

        }

    }


    /**
     * yanzhen
     */
    public function VerifyNum($option) {

        foreach ($option as $item){

            if(!$item) return false;
        }
        return true;
    }


    public function VerifyStatus($status){







    }

}
