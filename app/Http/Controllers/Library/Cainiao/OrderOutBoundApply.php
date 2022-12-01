<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\CainiaoErrorOrderLog;
use Illuminate\Http\Request;

class OrderOutBoundApply extends Controller
{
    //CONSO_WAREHOUSE_OUTBOUND_APPLY


    public static function APPLY($logisticsOrderCode,  $two_logisticsOrderCode) {


        $content = self::ResDataSet( $logisticsOrderCode,$two_logisticsOrderCode,'CONSO_WAREHOUSE_OUTBOUND_APPLY');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_OUTBOUND_APPLY',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);
  
        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return $res;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $logisticsOrderCode, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;

    }

    protected function ResDataSet( $logisticsOrderCode, $two_logisticsOrderCode,$eventType, $desc = '开始拣货了', $remark = '上游仓库已经开始拣货' ) {

        $data = [
            'logisticsEvent' =>[
                'eventHeader' =>[
                    'eventType' => $eventType,
                    'eventTime' => date('Y-m-d H:i:s'),
                    'eventTimeZone' => '8',
                ],
                'eventBody' =>[
                    'logisticsDetail'=>[
                        'logisticsOrderCode' => $two_logisticsOrderCode,
                        'timeZone' => 'UTC+8',
                        'occurTime'=>date('Y-m-d H:i:s'),
                        'logisticsOrderCodes' => $logisticsOrderCode,
                        'isSplitOut' => 'N',

                    ],
                ],
            ],
        ];
        return json_encode($data);
    }
}
