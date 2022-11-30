<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\CainiaoErrorOrderLog;
use Illuminate\Http\Request;

class OrderInBoundCallBack extends Controller
{
    //CAINIAO_GLOBAL_SORTINGCENTER_INBOUND_CALLBACK

    public static function index($logisticsOrderCode, $trackingNumber,$opCode,$weight, $length = 10, $width =10, $height = 10) {

        $content =  self::ResDataSet($logisticsOrderCode, $trackingNumber,$opCode,$weight, $length , $width , $height);

        $contentInfo = CainiaoConfig::Setmd5Info($content);

        $postData = self::CallPostData('CAINIAO_GLOBAL_SORTINGCENTER_INBOUND_CALLBACK',$content ,$contentInfo);

        $res = self::Curl(self::$url,$postData);

        if(!$res) return false;

        $errlog = $res;

        $res = json_decode($res);

        if(isset($res->success) && $res->success == 'true') return true;

        $errorlog = ['content' => $errlog, 'cainiao_api' => 'CAINIAO_GLOBAL_SORTINGCENTER_INBOUND_CALLBACK', 'order' => $logisticsOrderCode, 'created_at' => date('Y-m-d H:i:s')];

        CainiaoErrorOrderLog::create($errorlog);

        return false;
    }

    protected function ResDataSet($logisticsOrderCode, $trackingNumber, $opCode ,$weight, $length, $width, $height) {

        $data = [
            'logisticsOrderCode' => $logisticsOrderCode,
            'trackingNumber' => $trackingNumber,
            'opTime' =>date("Y-m-d H:i:s"),
            'timeZone' => '8',
            'operator' =>'Staff001',
            'opLocation' => 'Macau',
            'opCode' => $opCode,
            'opRemark' => "您的包裹入库成功",
            'imgUrl' => '',
            'currentCPResCode' => 'TRAN_STORE_30742435',
            'parcel' => [
                'weight' => $weight,
                'weightUnit' => 'g',
                'length' => $length,
                'width' => $width,
                'height' => $height,
                'dimensionUnit' => 'cm',
                'packingType' => 2,//包装种类:1:木箱;2:纸箱;3:桶装;4:散装;5:托盘;6:包;7:其它
                'categoryFeature' => '02'
            ]
        ];
        return json_encode($data);
    }
}
