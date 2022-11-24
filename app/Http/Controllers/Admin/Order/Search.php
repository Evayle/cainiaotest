<?php

namespace App\Http\Controllers\Admin\Order;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;
use App\Models\Forecast;

class Search extends Controller
{
    //搜索

    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }


    public function index(Request $request){

        if(!$request->filled('order'))  return $this->ReturnJson();

        $offset = $request->input('offset',0);
        $limit  = $request->input('limit',10);
        $start_time  = $request->input('start_time',null);
        $end_time    = $request->input('end_time',null);
        $in_time     = $request->input('in_time',null);

        $query = self::$Goods;

        if($request->order){

            $query = $query->where('mailNo',$request->order)->orWhere('trackingNumber', $request->order);
        }

        //处理时间的部分
        if($in_time){

            $query = $query->whereDate('in_time', $in_time);
        }

        if($start_time && $end_time){

            $query = $query->where('over_time', '>', $start_time )->where('over_time' , '<', $end_time);
        }

        $count = $query->count();

        $data = $query->with(['shopinfo' =>function($query){

            $query->select('id', 'd_id', 'itemName', 'categoryId', 'categoryName', 'itemPicUrl', 'tradeOrderValue');
        }])->with(['userinfo' => function($query){

            $query->select('id', 'd_id', 'buyer_wangwangId', 'buyer_name', 'buyer_mobile', 'buyer_country', 'buyer_province','buyer_city', 'buyer_district', 'buyer_streetAddress', 'sender_wangwangId', 'sender_name', 'sender_shopName', 'mobile', 'country', 'province', 'sender_city', 'sender_district', 'sender_streetAddress', 'created_at');
        }])->with(['orderlog' => function($query){

            $query->select('id', 'text', 'user_name', 'cainiao_api', 'created_at', 'order');

        }])->with(['areainfo' => function($query){

            $query->select('order', 'area_name', 'code');

        }])->offset($offset)->limit($limit)->select('id', 'mailNo','logisticsOrderCode','user_phone', 'deliveryType', 'trackingNumber', 'store_name', 'user_name', 'shop_name', 'order_status', 'cainiao_node', 'created_at', 'long', 'wide', 'height', 'weight', 'in_time', 'over_time')->get()->toArray();

        return $this->ReturnJson(200201,'获取成功',['data' => $data, 'count' => $count, 'page' => ($offset + 1)]);

    }


}
