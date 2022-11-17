<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    protected static $url = 'https://prelink.cainiao.com/gateway/link.do';

    public function __construct()
    {
        date_default_timezone_set("Asia/Macau");
    }

    public function ReturnJson($code = 400403, $msg = '重要参数为空', $data = [], $resCode = 200)
    {

        return response()->json(['code' => $code, 'msg' => $msg, 'data' => $data], $resCode);
    }

    public function ReturnCainiao($msg = '数据接收成功', $success = true, $resCode = 200)
    {

        return response()->json(['success' => $success, 'msg' => $msg], $resCode);
    }

    public function ReturnCainiaoError($msg = '请求的重要参数为空', $success = false, $resCode = 404)
    {

        return response()->json(['success' => $success, 'msg' => $msg], $resCode);
    }

    public static function Curl($url,$data,$method='POST'){

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_HTTPHEADER, ['Content-Type:application/x-www-form-urlencoded']);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        $result = curl_exec($curl);
        if(curl_errno($curl)) {
            return 'Errno'.curl_errno($curl);
        }
        curl_close($curl);
        return $result;
    }



    protected function postData($apiname, $logistics_interface, $data_digest, $logistic_provider_id = 'TRAN_STORE_30792933'){

        return 'msg_type=' . $apiname
            . '&logistics_interface=' . urlencode($logistics_interface)
            . '&data_digest=' . $data_digest
            . '&logistic_provider_id=' . urlencode($logistic_provider_id);

    }
}
