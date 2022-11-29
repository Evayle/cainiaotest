<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\CainiaoErrorOrderLog;

class OrderInbound extends Controller
{
    //CONSO_WAREHOUSE_INBOUND

    public function Inbond($mailNo,$logisticsOrderCode) {


        $content = self::ResDataSet($logisticsOrderCode,'CONSO_WAREHOUSE_INBOUND',1);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_INBOUND',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return true;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $mailNo, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;

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
