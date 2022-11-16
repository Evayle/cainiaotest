<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoErrorLog;
use Illuminate\Support\Facades\DB;



class ConsignUpdate extends Controller
{
    //CONSO_WAREHOUSE_UPDATE_CONSIGN

    private static $orderData;

    public function __construct()
    {
        if(!self::$orderData) self::$orderData = new Forecast();
    }

    public function  index(Request $request) {


        if(!$request->filled('logisticsEvent')) return $this->ReturnCainiaoError();


        $param = $request->logisticsEvent;


        if($param['eventHeader']['eventType'] != 'CONSO_WAREHOUSE_UPDATE_CONSIGN') return $this->ReturnCainiaoError();

        $body = $param['eventBody']['logisticsDetail'];


        $orderInfo = self::$orderData->where('logisticsOrderCode', $body['logisticsOrderCode'])->select('id')->first();



        dd(json_encode($request->logisticsEvent));
        if(!$orderInfo){
            CainiaoErrorLog::create(['date' =>date('Y-m-d'), 'text' =>json_encode($request->logisticsEvent)]);
            return $this->ReturnCainiaoError('没有该预报!');
        }

        DB::beginTransaction();
        try {

            self::$orderData->where('logisticsOrderCode', $body['logisticsOrderCode'])->update(['mailNo'=>$body['mailNo'], 'carrierCode' => $body['carrierCode']]);
            DB::commit();
            return $this->ReturnCainiao('修改成功');
        }catch (\Exception $e){
            DB::rollBack();

            return $this->ReturnCainiaoError('参数异常');
        }
    }
}
