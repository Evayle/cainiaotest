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

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_OUTBOUND_APPLY');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_OUTBOUND_APPLY',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);

    }

    protected function ResDataSet( $logisticsOrderCode, $logisticsOrderCodes, $eventType, $isSplitOut, $isMPS, $completeMPS, $subPackageQuantity, $subPackageIndex, $sublogisticsOrderCode ) {

        $data = [
            'logisticsEvent' =>[
                'eventHeader' =>[
                    'eventType' => $eventType,
                    'eventTime' => date('Y-m-d H:i:s'),
                    'eventTimeZone' => 'UTC+8',
                ],
                'eventBody' =>[
                    'logisticsDetail'=>[
                        'logisticsOrderCode'  => $logisticsOrderCode,
                        'logisticsOrderCodes' => $logisticsOrderCodes,
                        'isSplitOut' => $isSplitOut,
                        'isMPS'      => $isMPS,
                        'multipieceShipment'=> [
                            'completeMPS'           => $completeMPS,
                            'subPackageQuantity'    => $subPackageQuantity,
                            'subPackageIndex'       => $subPackageIndex,
                            'sublogisticsOrderCode' => $sublogisticsOrderCode
                        ],
                    ],
                ],
            ],
        ];
        return json_encode($data);
    }


}
