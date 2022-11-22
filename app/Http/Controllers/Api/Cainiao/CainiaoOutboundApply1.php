<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\Forecast;
use Illuminate\Http\Request;

class CainiaoOutboundApply extends Controller
{
    //拣货完成--出库申请

    //CONSO_WAREHOUSE_OUTBOUND_APPLY

    private static $Goods;

    public function __construct()
    {

        if(!self::$Goods) self::$Goods = new Forecast();

    }

    /**
     * 开始挑拣
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->two_logisticsOrderCode,'CONSO_WAREHOUSE_BEGIN_PICK');
//        dd($content);
        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_OUTBOUND_APPLY',$content ,$contentInfo);


        $res = self::Curl(self::$url,$postData);
        dd($res);
        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);

    }

    protected function ResDataSet( $logisticsOrderCode, $eventType, $desc = '开始拣货了', $remark = '上游仓库已经开始拣货' ) {

        $data = [
            'logisticsEvent' =>[
                'eventHeader' =>[
                    'eventType' => $eventType,
                    'eventTime' => date('Y-m-d H:i:s'),
                    'eventTimeZone' => '8',
                ],
                'eventBody' =>[
                    'logisticsDetail'=>[
                        'logisticsOrderCode' => $logisticsOrderCode,
                        'timeZone' => 'UTC+8',
                        'result' => [
                            'desc' => $desc,
                            'remark' => $remark
                        ],
                        'occurTime'=>date('Y-m-d H:i:s'),

                    ],
                ],
            ],
        ];
        return json_encode($data);
    }


}
