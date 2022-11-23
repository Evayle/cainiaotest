<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use Illuminate\Http\Request;
use App\Models\CainiaoErrorOrderLog;

class OrderSign extends Controller
{
    //CONSO_WAREHOUSE_SIGN

    public static function  SignInfo($mailNo, $logisticsOrderCode) {

        $content = self::ResDataSet($mailNo, $logisticsOrderCode,'CONSO_WAREHOUSE_SIGN');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_SIGN',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return true;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $mailNo, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;

    }

    protected function ResDataSet( $mailNo, $logisticsOrderCode, $eventType, $status = true, $desc = '包裹正常', $remark = '包裹已签收',$code = 200) {

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
                    'logisticsOrderCode' => $logisticsOrderCode,
                    'result' => [
                        'success' => $status,
                        'desc' => $desc,
                        'remark' => $remark,
                        'code' => $code,
                    ],
                ],
            ],
        ]];

        return json_encode($data);
    }


    public static function  SignError($mailNo, $logisticsOrderCode, $text) {

        $content = self::ResDataSet($mailNo, $logisticsOrderCode,'CONSO_WAREHOUSE_SIGN',false,'包裹异常',$text, 403);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_SIGN',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return true;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $mailNo, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;

    }


}
