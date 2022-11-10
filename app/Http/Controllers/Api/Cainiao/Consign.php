<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Caoniaotext;

class Consign extends Controller
{
    //CONSO_WAREHOUSE_CONSIGN


    private static $getdate;

    public function __construct()
    {

        date_default_timezone_set("Asia/Macau");

        $getdate = date("Y_m_d_H_i_s");
    }

    /**
     * 接收菜鸟的部分
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {


        $param = $request->all();
//
//        if(!$request->filled(['logistics_interface', 'partner_code', 'from_code', 'msg_type'])){
//
//            return response()->json(["success" => false, "message" => "预报接收失败", "code" => 400413]);
//        }
//
//        if($param['partner_code'] != 'TRAN_STORE_30792933' || $param['from_code'] != 'CNCTP' || $param['msg_type'] != 'CONSO_WAREHOUSE_CONSIGN'){
//
//
//            return response()->json(["success" => false, "message" => "预报接收失败", "code" => 400416]);
//        }

        //处理接收的预报件--彩虹桥部分


        Caoniaotext::create(['text'=>json_encode($param)]);


        return $this->ReturnJson(200201,'ok',[],200);
    }


}
