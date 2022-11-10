<?php

namespace App\Http\Controllers\Api\CainiaoInfo;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CainiaoConsign extends Controller
{
    //下发预报的部分

    public function ConSign(Request $request){


        if(!$request->filled(['logistics_interface', 'partner_code', 'from_code', 'msg_type']))
            return $this->ReturnCainiao();
        if($request->from_code    !== 'CNCTP')                   return $this->ReturnCainiao();
        if($request->partner_code !== 'TRAN_STORE_30792933')     return $this->ReturnCainiao();
        if($request->msg_type     !== 'CONSO_WAREHOUSE_CONSIGN') return $this->ReturnCainiao();

        //可以接收

        $logisticsEvent = $request->logisticsEvent;












    }







}
