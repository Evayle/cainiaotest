<?php

namespace App\Http\Controllers\Library\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoConfig;
use App\Models\CainiaoErrorOrderLog;
use Illuminate\Http\Request;

class OrderOutBoundCallBack extends Controller
{

//CAINIAO_GLOBAL_SORTINGCENTER_OUTBOUND_CALLBACK

public static function index($logisticsOrderCode, $trackingNumber, $bigBagId, $weight, $length = 10, $width =10, $height = 10) {

    $content =  self::ResDataSet($logisticsOrderCode, $trackingNumber, $bigBagId, 0, $weight, $length , $width , $height);

    $contentInfo = CainiaoConfig::Setmd5Info($content);

    $postData = self::CallPostData('CAINIAO_GLOBAL_SORTINGCENTER_OUTBOUND_CALLBACK',$content ,$contentInfo);

    $res = self::Curl(self::$url,$postData);

    if(!$res) return false;

    $errlog = $res;

    $res = json_decode($res);

    if(isset($res->success) && $res->success == 'true') return true;

    $errorlog = ['content' => $errlog, 'cainiao_api' => 'CAINIAO_GLOBAL_SORTINGCENTER_OUTBOUND_CALLBACK', 'order' => $logisticsOrderCode, 'created_at' => date('Y-m-d H:i:s')];

    CainiaoErrorOrderLog::create($errorlog);

    return false;
}

protected function ResDataSet($logisticsOrderCode, $trackingNumber, $bigBagId ,$opCode ,$weight, $length, $width, $height) {

    $data = [
        'logisticsOrderCode' => $logisticsOrderCode,
        'trackingNumber' => $trackingNumber,
        'waybillNumber' => '',
        'opTime' =>date("Y-m-d H:i:s"),
        'timeZone' => '8',
        'operator' =>'Staff001',
        'opLocation' => 'Macau',
        'opCode' => $opCode,
        'opRemark' => "您的包裹出库成功",
        'imgUrl' => '',
        'currentCPResCode' => 'TRAN_STORE_30742435',
        'fromPortCode' => '',
		'toPortCode' => '',
		'transportType' => '4', //水路运输(2)、铁路运输(3)、公路运输(4)、航空运输(5)、邮件运输(6)、其他运输(9)
        'parcel' => [
            'weight' => $weight,
            'weightUnit' => 'g',
            'length' => $length,
            'width' => $width,
            'height' => $height,
            'dimensionUnit' => 'cm',
            'packingType' => 2,//包装种类:1:木箱;2:纸箱;3:桶装;4:散装;5:托盘;6:包;7:其它
            'bigBagID' => $bigBagId,
            'asnID' => 'ASN1234567'
        ]
    ];

    return json_encode($data);
}
}
