<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\Forecast;
use Illuminate\Http\Request;

class CainiaoInbound extends Controller
{
    //CONSO_WAREHOUSE_INBOUND 入库操作


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

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_INBOUND',1);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_INBOUND',$content ,$contentInfo);


        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹入库成功');
        }

        return $this->ReturnJson(400403, '包裹入库失败', $res);

    }


    /**
     * 包裹到达--失败
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function inboundError(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_INBOUND',1,1,1,1,false);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_INBOUND',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹入库成功');
        }

        return $this->ReturnJson(400403, '包裹入库失败', $res);
    }


    protected function ResDataSet( $logisticsOrderCode, $eventType, $weight, $length = 1, $wide = 1, $height = 1, $success = true) {

        $data = [
            'logisticsEvent' =>[
                'eventHeader' =>[
                    'eventType' => $eventType,
                    'eventTime' => date('Y-m-d H:i:s'),
                    'eventTimeZone' => 'UTC+8',
                ],
                'eventBody' =>[
                    'logisticsDetail'=>[
                        'logisticsOrderCode' => $logisticsOrderCode,
                        'categoryFeature' => '01',
                        'weight' => $weight,
                        'length' => $length,
                        'width'  => $wide,
                        'height' => $height,
                        'occurTime' => date('Y-m-d H:i:s'),
                        'result' => [
                            'success' => $success
                        ],
                    ],
                ],

            ],
        ];
        return json_encode($data);
    }





}
