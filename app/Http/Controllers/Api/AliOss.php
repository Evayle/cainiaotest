<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use OSS\OssClient;
use OSS\Core\OssException;

class AliOss extends Controller
{
    //处理ocr


    protected $accessKeyId;
    protected $accessKeySecret;
    protected $endpoint;
    protected $bucket;
    protected $file_name;


    public function __construct()
    {
        $this->endpoint = 'http://oss-cn-hangzhou.aliyuncs.com';
        $this->bucket = 'cainiaoevatest';
        $this->file_name = "cainiao/";
        $this->accessKeyId = 'LTAI5t9iW32DSB1sAQZ7CmqZ';
        $this->accessKeySecret = 'tndWbtlSWeohPYzgNA9qh8YqhEPNSk';

    }

    /**
     * 处理阿里云oss上传,返回状态
     * @param Request $request
     * @return string
     */
    public function createNewFile(Request $request)
    {

        $file = $request->file('file');

        if(!$file){

            return response()->json(['code' => '400413', 'msg' => '请上传图片']);
        }

        $object = $this->file_name . "eva-mhn1111." . $file->getClientOriginalExtension();

        try {
            $oss = new OssClient($this->accessKeyId, $this->accessKeySecret, $this->endpoint);

            $oss->uploadFile($this->bucket, $object, $file);

            //一个小时
            $timeout = 3600;

            $options = [];

            $signedUrl = $oss->signUrl($this->bucket, $object, $timeout, "GET", $options);

            return response()->json(['code' => '200201', 'msg' => '获取成功', 'data' => ['pathImage' => $signedUrl, 'pathInfo' => $object]]);

        } catch (OssException $e) {

            return response()->json(['code' => '400416', 'msg' => '上传异常,请重新上传']);
        }



    }


    /**
     * 删除图片
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function delFile(Request $request)
    {

        if(!$request->filled('pathInfo')){

            return response()->json(['code' => '400413', 'msg' => '重要参数为空']);

        }
        $object = $request->input('pathInfo');


        try{
            $ossClient = new OssClient($this->accessKeyId, $this->accessKeySecret, $this->endpoint);

            $ossClient->deleteObject($this->bucket, $object);

            return response()->json(['code' => '200201', 'msg' => '删除成功']);

        } catch(OssException $e) {

            return response()->json(['code' => '400416', 'msg' => '删除失败']);
        }

    }

}
