<?php

namespace App\Http\Controllers\Admin\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use App\Models\Forecast;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderSign as Sign;

class OrderSign extends Controller
{
    //CONSO_WAREHOUSE_SIGN

    //签收

    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request){

        $adminInfo = $request->get('adminInfo');

        if(!$request->mailNo) return $this->ReturnJson();

        if(Cache::get($request->mailNo.'signerror'))  return $this->ReturnJson(400403,'该订单不存在系统中!');
        if(Cache::get($request->mailNo.'signstatus')) return $this->ReturnJson(400403,Cache::get($request->mailNo.'signstatus'));
        if(Cache::get($request->mailNo.'sign'))       return $this->ReturnJson(200201,'订单已签收'); //幂等处理

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->select('mailNo', 'logisticsOrderCode', 'order_status', 'cainiao_node')->first();

        if(!$dataInfo) {
            Cache::put($request->mailNo,'signerror',20);
            return $this->ReturnJson(400403,'该订单不存在系统中!');
        }

        $OrderStatus = $this->VerifyStatus($dataInfo->order_status);

        if($OrderStatus != 1){

            Cache::put($request->mailNo.'signstatus',$OrderStatus,20);

            return $this->ReturnJson(400403,$OrderStatus);
        }
        //验证订单数据
        $OrdedrInfo = Sign::SignInfo($dataInfo->mailNo, $dataInfo->logisticsOrderCode);

        if(!$OrdedrInfo){

            return $this->ReturnJson(400403,'订单签收异常,请联系管理员');
        }

        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo')->update(['order_status' => 5, 'cainiao_node' => 5]);
            self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已签收,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);
            DB::commit();
            Cache::put($request->mailNo,'sign',60);
            return $this->ReturnJson(200201, '到达成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '到达失败!');
        }
    }

    private function VerifyStatus($status) {

        if($status === 5 ) return 1;
        if($status < 5)    return '该订单未签收!';
        return $this->OrderStatusInfo($status);
    }

}
