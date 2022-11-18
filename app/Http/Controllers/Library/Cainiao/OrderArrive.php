<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use Illuminate\Http\Request;
use App\Models\CainiaoErrorOrderLog;

class OrderArrive extends Controller
{

    //快件到达
    public static function OrderArrive($dataInfo){

        $content = self::ResDataSet($dataInfo->mailNo, $dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_ARRIVE');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_ARRIVE',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;
        $errlog = $res;
        $res = json_decode($res);

        if($res->success == 'true'){

            return true;
        }

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $dataInfo->mailNo, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;
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
