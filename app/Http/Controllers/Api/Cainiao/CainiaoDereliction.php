<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use Illuminate\Http\Request;

class CainiaoDereliction extends Controller
{
    //wuzhujain

    //CONSO_WAREHOUSE_DERELICTION


    public  function  index(Request $request){

        if(!$request->filled(['recogCode', 'mailNo'])) return $this->ReturnJson();

        $content = $this->ResDataSet($request->mailNo,$request->recogCode,'CONSO_WAREHOUSE_DERELICTION');
//        dd($content);
        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_DERELICTION',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);
        dd($res);
        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);



    }

    protected function ResDataSet( $logisticsOrderCode, $recogCode ,$eventType ) {

        $data = [
            'logisticsEvent' =>[
                'eventHeader' =>[
                    'eventType' => $eventType,
                    'eventTime' => date('Y-m-d H:i:s'),
                    'eventTimeZone' => '8',
                ],
                'eventBody' =>[
                    'logisticsDetail'=>[
                        'recogCode' => $recogCode,
                        'mailNo' => $logisticsOrderCode,
                        'timeZone' => 'UTC+8',
                        'consoWarehouseCode' => 'TRAN_STORE_30792933',
                        'occurTime'=>date('Y-m-d H:i:s'),
                    ],
                ],
            ],
        ];

//        dd($data);
        return json_encode($data);
    }



}
