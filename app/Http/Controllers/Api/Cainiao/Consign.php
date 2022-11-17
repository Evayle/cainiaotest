<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use Illuminate\Http\Request;
use App\Models\Forecast;
use Illuminate\Support\Facades\DB;

class Consign extends Controller
{
    //CONSO_WAREHOUSE_SIGN

    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();

    }

    /**
     * 包裹签收
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request) {

        if(!$request->mailNo) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->mailNo, $dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_SIGN');

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_SIGN',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹上游仓库已签收');

        }

        return $this->ReturnJson(400403, '包裹上游仓库签收失败', $res);

    }

    /**
     * 签收失败
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function SignError(Request $request) {

        if(!$request->filled(['mailNo', 'remark'])) return $this->ReturnJson();

        $dataInfo = self::$Goods->where('mailNo', $request->mailNo)->first();

        if(!$dataInfo) return $this->ReturnCainiaoError('未有该资料,请发预报');

        $content = $this->ResDataSet($dataInfo->mailNo, $dataInfo->logisticsOrderCode,'CONSO_WAREHOUSE_SIGN',false,'签收失败', $request->remark, 404);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = $this->postData('CONSO_WAREHOUSE_SIGN',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return $this->ReturnJson(400403, '发送失败,请联系管理员');

        $res = json_decode($res);

        if($res->success == 'true'){

            return $this->ReturnJson(200201, '包裹上游仓库取消签收');

        }

        return $this->ReturnJson(400403, '包裹上游仓库取消签收失败', $res);

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

}
