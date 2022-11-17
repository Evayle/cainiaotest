<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoConfig;
use Illuminate\Support\Facades\DB;


class CainiaoArrive extends Controller
{
    //包裹到达集运仓库

    //CONSO_WAREHOUSE_ARRIVE

    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();

    }

    /**
     * 包裹到达
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->mailNo, $dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_ARRIVE');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_ARRIVE',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹到达成功');

        }

        return $this->ReturnJson(400403, '包裹到达失败', $res);

    }

    protected function ResDataSet( $mailNo, $logisticsOrderCode, $eventType) {

        $data =  ['logisticsEvent'=>[
            'eventHeader' => [
                'eventType' => $eventType,
                'eventTime' => date("Y-m-d H:i:s")
            ],
            'eventBody' => [
                'logisticsDetail' =>[
                    'mailNo' =>$mailNo,
                    'occurTime' => date("Y-m-d H:i:s"),
                    'timeZone' => 'UTC+8',
                    'logisticsOrderCode' => $logisticsOrderCode
                ]
            ],
        ]];

        return json_encode($data);
    }




}
