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

}
