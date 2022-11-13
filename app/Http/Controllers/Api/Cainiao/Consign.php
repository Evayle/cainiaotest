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


        Caoniaotext::create(['text' => json_encode($param)]);

        return $this->ReturnCainiao('下发成功');
    }


    public function  sign(Request $request){


//        dd($request->all());

        if(!$request->filled(['msg_type', 'msg_id', 'from_code', 'partner_code', 'data_digest', 'logistics_interface'])) return $this->ReturnCainiaoError('重要参数为空');
        //验证

        //处理签名
//        if($request->msg_type !=' ' || $request->msg_id != '' || $request->from_code != '' || $request->partner_code != '' || $request->data_digest != '' || $request->logistics_interface != '')
//            return $this->ReturnCainiaoError();

        //接收数据--主表信息--SKU等信息---商品支付等信息











    }

}
