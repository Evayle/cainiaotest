<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\Forecast;

class OrderQuery extends Controller
{
    //CONSO_ORDER_QUERY

    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();

    }


    public  static function  index($logisticsOrderCode){

        $content = self::ResDataSet($logisticsOrderCode);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_ORDER_QUERY',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;

        $res = json_decode($res);

        if(!isset($res->isSingle)) {

            return false;
        }

        $conso_order_query = $res->isSingle ? 1: 2 ;
        $isLastPackage     = $res->isLastPackage ? 1: 2 ;
        self::$Goods->where('logisticsOrderCode', $logisticsOrderCode)->update(['conso_order_query' => $conso_order_query, 'isLastPackage' => $isLastPackage]);
        return $conso_order_query;
    }

    protected function ResDataSet($logisticsOrderCode) {

        return json_encode(['orderCode' => $logisticsOrderCode]);
    }
}
