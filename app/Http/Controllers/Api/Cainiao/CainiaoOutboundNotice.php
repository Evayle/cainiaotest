<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CainiaoOutboundNotice extends Controller
{
    //出库通知
    //CONSO_WAREHOUSE_OUTBOUND_NOTICE

    public function index(Request $request){

        try {
            $param         = json_encode($request->all());

            DB::table('cainiao_yubao')->insert(['text' => $param, 'created_at' => date('Y-m-d H:i:s',time())]);
            return $this->ReturnCainiao();
        }catch (\Exception $e){

            return $this->ReturnCainiaoError('数据接收异常,请联系管理员');
        }

    }

}
