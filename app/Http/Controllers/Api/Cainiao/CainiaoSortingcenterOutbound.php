<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\Forecast;
use Illuminate\Http\Request;

class CainiaoSortingcenterOutbound extends Controller
{
    //CAINIAO_GLOBAL_SORTINGCENTER_OUTBOUND_CALLBACK
    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();
    }

    /**
     * 分拨仓入库
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->logisticsOrderCode,'CAINIAO_GLOBAL_SORTINGCENTER_INBOUND_CALLBACK');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CAINIAO_GLOBAL_SORTINGCENTER_INBOUND_CALLBACK',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹已经开始挑拣');
        }

        return $this->ReturnJson(400403, '包裹挑拣异常,请可联系管理员', $res);

    }

    protected function ResDataSet( $logisticsOrderCode, $eventType ) {

        $data = [
            'logisticsOrderCode',
            'trackingNumber',
            'waybillNumber',
            'opTime',
            'timeZone',
            'opCode',
            'transportType',
            'fromPortCode',
            'toPortCode',
            'operator',
            'operatorContact',
            'parcel' =>[
                'weight',
                'weightUnit',
                'length',
                'width',
                'height',
                'dimensionUnit',
                'bigBagID',
                'asnID'
            ],
        ];
        return json_encode($data);
    }


}
