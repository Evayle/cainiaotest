<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoErrorLog;
use App\Models\Forecast;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ConsignCancel extends Controller
{
    //CONSO_WAREHOUSE_RETURN_REFUND_NOTICE

    private static $orderData;

    public function __construct() {

        if(!self::$orderData) self::$orderData = new Forecast();
    }

    public function  index(Request $request) {

        if(!$request->filled('logisticsEvent')) return $this->ReturnCainiaoError();

        $param = $request->logisticsEvent;

        if($param['eventHeader']['eventType'] != 'CONSO_WAREHOUSE_CANCEL_CONSIGN') return $this->ReturnCainiaoError();

        $body = $param['eventBody']['logisticsDetail'];

        $orderInfo = self::$orderData->where('logisticsOrderCode', $body['logisticsOrderCode'])->select('id')->first();

        if(!$orderInfo){

            CainiaoErrorLog::create(['date' =>date('Y-m-d'), 'text' =>json_encode($request->logisticsEvent), 'type' => 6]);

            return $this->ReturnCainiaoError('没有该预报下发!');
        }

        DB::beginTransaction();
        try {

            self::$orderData->where('logisticsOrderCode', $body['logisticsOrderCode'])->update(['order_status'=> 2]);
            DB::commit();
            return $this->ReturnCainiao('修改成功');
        }catch (\Exception $e){
            DB::rollBack();
            CainiaoErrorLog::create(['date' =>date('Y-m-d'), 'text' =>json_encode($request->logisticsEvent), 'type' => 1]);
            return $this->ReturnCainiaoError('参数异常');
        }
    }

}
