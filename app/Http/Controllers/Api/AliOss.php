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
        $this->endpoint        ='http://oss-cn-hangzhou.aliyuncs.com';
        $this->bucket          = 'cainiaoevatest';
        $this->file_name       = "cainiao/";
        $this->accessKeyId     = 'LTAI5tLiJw4XKAJ16JBNWcjy19';
        $this->accessKeySecret = '2TmLUto4bngYpyheNXMXdxCaeK21od9';

    }


    /**
     * 处理阿里云oss上传
     * @param Request $request
     * @return string
     */
    public function createNewFile(Request $request)
    {

        $file = $request->file('file');
        $object = $this->file_name."eva-mhn." . $file->getClientOriginalExtension();
        try {
            $oss = new OssClient($this->accessKeyId, $this->accessKeySecret,$this->endpoint);
            $oss->uploadFile($this->bucket, $object, $file);
        } catch (OssException $e) {

        }

        return $object;

    }
}
