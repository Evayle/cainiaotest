<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\Forecast;
use App\Models\CainiaoConfig;
use Illuminate\Http\Request;

class CainiaoOrderQuery extends Controller
{
    //查询订单的状态
    //CONSO_ORDER_QUERY


    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();
    }

    public function index(Request $request){

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_ORDER_QUERY',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹入库成功');
        }

        return $this->ReturnJson(400403, '包裹入库失败', $res);

    }

    protected function ResDataSet($logisticsOrderCode) {

        return json_encode(['orderCode' => $logisticsOrderCode]);
    }


}
