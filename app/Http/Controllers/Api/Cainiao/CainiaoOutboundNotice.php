<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\Forecast;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CainiaoOutboundNotice extends Controller
{
    //出库通知
    //CONSO_WAREHOUSE_OUTBOUND_NOTICE



    private static $orderData;
    private static $getdate;

    public function __construct()
    {
        self::$getdate = date("Y-m-d H:i:s");
        if(!self::$orderData)   self::$orderData   = new Forecast();

    }



    public function index(Request $request){

        if(!$request->filled(['logistics_interface', 'data_digest', 'partner_code', 'msg_type'])) return $this->ReturnCainiaoError();

        if($request->msg_type !='CONSO_WAREHOUSE_OUTBOUND_NOTICE' || $request->from_code != 'inner' || $request->partner_code != 'TRAN_STORE_30792933')  return $this->ReturnCainiaoError();

        try {

            $params        = $request->all();
            $param         = json_decode($request->logistics_interface);
            dump($param);
            if(self::$orderData->islogisticsOrderCode($param->logisticsEvent->eventBody->logisticsDetail->logisticsOrderCode)){

                return $this->ReturnCainiaoError('预报信息已存在');
            }

//            $tradeDetail   = $param->logisticsEvent->eventBody->tradeDetail;
//            $paymentDetail = $param->logisticsEvent->eventBody->paymentDetail;
//            $body          = $param->logisticsEvent->eventBody->logisticsDetail;
//
//            $shopData      = $this->shopData($paymentDetail, $body->items[0]);
//
//            $orderData     = $this->orderData($body, $tradeDetail, $body->items[0]);
//
//            $paymentDetail =$this->paymentData($body);

            dd(12312);

        }catch (\Exception $e){

            return $this->ReturnCainiaoError('参数异常');
        }





    }

}
