<?php

namespace App\Http\Controllers\Admin\Order;

use App\Http\Controllers\Controller;
use App\Models\Forecast;
use Illuminate\Http\Request;

class OrderShelfPrint extends Controller
{
    //打印上架单
    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();        
    }

    public function index(Request $request){

        if(!$request->filled('logisticsOrderCode'))  return $this->ReturnJson();

        $Goodsinfo = self::$Goods->where('logisticsOrderCode', $request->logisticsOrderCode)->with(['areainfo' => function($query){

            $query->select('order', 'area_name');

        }])->with(['storename' => function($query){

            $query->select('cainiao_match', 'receiving_name');

        }])->select('logisticsOrderCode','store_name')->first();


        if(!$Goodsinfo) return $this->ReturnJson(400413, '获取失败');
        
        $html = '<!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>上架单</title>
            <style>
                .box {
                    text-align: center;
                    font-size: 24px;
                    font-weight: bold;
                }
            </style>
        </head>
        <body>
            <div class="box">
                <div>库区：'.$Goodsinfo->areainfo->area_name.'</div>
                <div>'.$Goodsinfo->store_name.'</div>
                <div>'.$Goodsinfo->storename->receiving_name.'</div>
                <div>'.$request->logisticsOrderCode.'</div>
                <div>'.date('Y-m-d H:i:s').'</div>
            </div>
        </body>
        </html>';
        echo $html;
    }

}
