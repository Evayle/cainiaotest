<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\ForecastUserinfo;
use App\Models\Forecast;
use Illuminate\Http\Request;
use App\Http\Controllers\Library\Cainiao\OrderOutbond;
use Illuminate\Support\Facades\DB;

class PakageOut extends Controller
{
    //大包号出库
    private static $Goods;
    private static $UserInfo;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast(); 
        if(!self::$UserInfo) self::$UserInfo = new ForecastUserinfo();
    }

    public function index(Request $request){

        if(!$request->filled(['bigBagId', 'trackingNumber'])) return $this->ReturnJson();

        $GoodsInfo = self::$Goods->where('trackingNumber', $request->trackingNumber)->select('id','logisticsOrderCode','two_logisticsOrderCode','trackingNumber', 'order_status')->get()->toArray();

        if(!$GoodsInfo) return  $this->ReturnJson(400413, '出库失败,请将该订单给管理员');

        if($GoodsInfo[0]['order_status'] == 45) return $this->ReturnJson(200201, '出库成功');

        $logisticsOrderCodes = null;

        foreach ($GoodsInfo as  $item){

            $logisticsOrderCodes .= $item['logisticsOrderCode'].'|';
        }

        $logisticsOrderCodes = substr($logisticsOrderCodes,0,strlen($logisticsOrderCodes)-1);

        $two_logisticsOrderCode = $GoodsInfo[0]['two_logisticsOrderCode'];

        $userInfo = self::$UserInfo->where('d_id', $GoodsInfo['0']['id'])->first();

        $OrderOutbond = OrderOutbond::index($logisticsOrderCodes,$two_logisticsOrderCode, $request->trackingNumber,$request->bigBagId,$userInfo->buyer_name,$userInfo->buyer_mobile, $userInfo->buyer_wangwangId,$userInfo->buyer_streetAddress);

        if(!$OrderOutbond) return  $this->ReturnJson(400415, '大包号出库失败,请联系管理员');

        DB::beginTransaction();
        try {
            self::$Goods->where('trackingNumber', $request->trackingNumber)->update([ 'bigBagId' => $request->bigBagId,'order_status' => 45, 'cainiao_node' => 13, 'over_time' => date('Y-m-d H:i:s')]);
            DB::commit();
            return $this->ReturnJson(200201, '出库成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '出库失败,请重新扫描');
        }
    }
}
