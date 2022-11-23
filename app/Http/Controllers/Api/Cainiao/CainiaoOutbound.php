<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\Forecast;
use Illuminate\Http\Request;

class CainiaoOutbound extends Controller
{
    //国际集运出库

    //CONSO_WAREHOUSE_OUTBOUND


    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();
    }

    /**
     * 出库
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->with(['userinfo'])->first();


        if(!$dataInfo) return $this->ReturnJson(400413, '单号不存在');

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,
            'CONSO_WAREHOUSE_OUTBOUND',
            $dataInfo->two_logisticsOrderCode,
            $dataInfo->trackingNumber,
            '123456',
            $dataInfo->userinfo->buyer_name,
            $dataInfo->userinfo->buyer_mobile,
            $dataInfo->userinfo->buyer_wangwangId,
            $dataInfo->userinfo->buyer_streetAddress
        );

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_OUTBOUND',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        dd($res);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);

    }

    public function out(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->with(['userinfo'])->first();


        if(!$dataInfo) return $this->ReturnJson(400413, '单号不存在');

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,
            'CONSO_WAREHOUSE_OUTBOUND',
            $dataInfo->two_logisticsOrderCode,
            $dataInfo->trackingNumber,
            '123456',
            $dataInfo->userinfo->buyer_name,
            $dataInfo->userinfo->buyer_mobile,
            $dataInfo->userinfo->buyer_wangwangId,
            $dataInfo->userinfo->buyer_streetAddress,
            false,'上游出库失败','由于快件丢失,已不能出库'
        );

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_OUTBOUND',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        dd($res);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);

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

//        dd($data);
        return json_encode($data);
    }





}
