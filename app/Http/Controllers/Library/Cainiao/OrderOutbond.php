<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\CainiaoErrorOrderLog;
use Illuminate\Http\Request;

class OrderOutbond extends Controller
{
    //CONSO_WAREHOUSE_OUTBOUND

    public static function index($logisticsOrderCodes, $two_logisticsOrderCod, $trackingNumber, $bigBagId , $buyer_name, $buyer_mobile, $buyer_wangwangId, $buyer_streetAddress) {

        $content =  self::ResDataSet($logisticsOrderCodes,'CONSO_WAREHOUSE_OUTBOUND', $two_logisticsOrderCod, $trackingNumber, $bigBagId, $buyer_name, $buyer_mobile, $buyer_wangwangId, $buyer_streetAddress);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::postData('CONSO_WAREHOUSE_OUTBOUND',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);
     
        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return true;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE', 'order' => $two_logisticsOrderCod, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;
    }

    protected function ResDataSet( $logisticsOrderCode, $eventType, $logisticsOrderCodes, $mailNo, $bigBagId ,$name , $phone, $wangwangId, $streetAddress, $success = true, $dessc = '乐淘上游出库', $remark = '乐淘上游已经出库成功') {

        $data = [
            'logisticsEvent' =>[
                'eventHeader' =>[
                    'eventType' => $eventType,
                    'eventTime' => date('Y-m-d H:i:s'),
                    'eventTimeZone' => 'UTC+8',
                ],
                'eventBody' =>[
                    'logisticsDetail'=>[
                        'logisticsOrderCode'  => $logisticsOrderCodes,
                        'logisticsOrderCodes' => $logisticsOrderCode,
                        'occurTime' => date('Y-m-d H:i:s'),
                        'mailNo' => $mailNo,
                        'packageType' => '2',
                        'carrierCode' => 'LETAO_AOYUN',
                        'bigBag' => ['bigBagId'=>$bigBagId],
                        'senderDetail' => [
                            'name' => '乐淘',
                            'country' => '中国',
                            'streetAddress' =>'廣東省珠海市香洲區港二路51號1棟三樓LT倉',
                            'mobile' => 15363780710,
                            'phone' => 15363780710,
                        ],
                        'receiverDetail' => [
                            'name' => $name,
                            'phone' => $phone,
                            'country' => '中国',
                            'wangwangId' => $wangwangId,
                            'streetAddress' => $streetAddress,
                        ],
                        'result' => [
                            'success' => $success,
                            'desc'    => $dessc,
                            'remark'  => $remark,
                        ],
                    ],
                ],
            ],
        ];

        if(!$success )$data['logisticsEvent']['eventBody']['logisticsDetail']['result']['code'] = 403;

        return json_encode($data);
    }
}
