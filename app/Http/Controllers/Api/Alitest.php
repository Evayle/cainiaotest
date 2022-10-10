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
        $this->accessKeyId     = 'LTAI5tLiJw4XKAJ16JBNWcjy';
        $this->accessKeySecret = '2TmLUto4bngYpyheNXMXdxCaeK21od';

    }


    /**
     * 处理阿里云oss上传
     * @param Request $request
     * @return string
     */
    public function createNewFile(Request $request)
    {

        $file = $request->file('file');
        $object = $this->file_name.'eva-mhn-'.round(1111,9999).'.' . $file->getClientOriginalExtension();
        try {
            $oss = new OssClient($this->accessKeyId, $this->accessKeySecret,$this->endpoint);
            $oss->uploadFile($this->bucket, $object, $file);
        } catch (OssException $e) {

        }

        return $object;

    }

//生成带水印参数的文件签名URL
    public function delFile(Request $request)
    {

        $object = "cainiao/111111.jpg";

        $ossClient = new OssClient($this->accessKeyId, $this->accessKeySecret,$this->endpoint);

        $timeout = 3600;

        $options = array(
            // 将图片缩放为固定宽高100 px。
            OssClient::OSS_PROCESS => "image/resize,m_fixed,h_100,w_100" );

        $signedUrl = $ossClient->signUrl($this->bucket, $object, $timeout, "GET", $options);

        print("rtmp url: \n" . $signedUrl);


    }



}
