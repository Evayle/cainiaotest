<?php

namespace App\Http\Controllers\Admin\Order;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Http\Controllers\Library\Cainiao\OrderInBoundCallBack;
use App\Http\Controllers\Library\Cainiao\OrderOutBoundCallBack;

class OutBoundCallback extends Controller
{
    //分拨仓出/入库

    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request){

        $data = self::$Goods->where('order_status', 45)->select('trackingNumber','two_logisticsOrderCode')->groupBy('trackingNumber','two_logisticsOrderCode')->get()->toArray();

        if(!$data) return true;

        $trackingNumber = [];

        foreach ($data as $key => $vals){

            $trackingNumber[$key] = $vals['trackingNumber'];
        }

        $GoodsInfo = self::$Goods->whereIn('trackingNumber', $trackingNumber)->select('weight','trackingNumber')->get()->toArray();

        foreach ($data as $key=>$items){
            $data[$key]['weight'] = 0;
            foreach ($GoodsInfo as $item){
                if($data[$key]['trackingNumber'] ==  $item['trackingNumber']){

                    $data[$key]['weight'] += $item['weight'] * 1000;
                }
            }
        }

        foreach($data as $item){

            $OrderInBoundCallBack = OrderInBoundCallBack::index($item['two_logisticsOrderCode'], $item['trackingNumber'], $item['weight'],1);

//            if($OrderInBoundCallBack){
//
//            }

        }
    }

}
