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
            DB::table('cainiao_yubao')->insert(['text' => json_decode($request->all()), 'crerated_at' => date('Y-m-d H:i:s')]);
            return $this->ReturnCainiao();
        }catch (\Exception $e){

            return $this->ReturnCainiaoError('数据接收异常,请联系管理员');
        }

    }

}
