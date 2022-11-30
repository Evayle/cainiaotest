<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\CainiaoErrorOrderLog;

class OrderBeginPick extends Controller
{
    //CONSO_WAREHOUSE_BEGIN_PICK

    public static function BeginPick($logisticsOrderCode, $mailNo){

        $content = self::ResDataSet($logisticsOrderCode,'CONSO_WAREHOUSE_BEGIN_PICK');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_BEGIN_PICK',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return true;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $mailNo, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;
    }

    protected function ResDataSet( $logisticsOrderCode, $eventType, $desc = '开始挑拣', $remark = '仓库人员开始挑拣') {

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
                        'occurTime' => date('Y-m-d H:i:s'),
                        'result' => [
                            'desc' => $desc,
                            'remark' => $remark
                        ],
                    ],
                ],
            ],
        ];
        return json_encode($data);
    }



}
