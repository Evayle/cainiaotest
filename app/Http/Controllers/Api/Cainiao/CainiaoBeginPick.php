<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\Forecast;
use Illuminate\Http\Request;

class CainiaoBeginPick extends Controller
{
    //开始拣货
    //CONSO_WAREHOUSE_BEGIN_PICK


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

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_BEGIN_PICK');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_BEGIN_PICK',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);

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
