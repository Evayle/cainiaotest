<?php

namespace App\Http\Controllers\Admin\Push;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class WxPush extends Controller
{
    //微信推送

    public function  index(Request $request){

        if(!$request->filled(['title','text'])) return false;

        return  true;

    }

    public function OutBoundNoticeError($option)
    {
        //发送
//        g-FoXFqCLb6OtxM2QlIcd66FCyahClIsuhY2lBEyHCA
//        {{first.DATA}}
//        异常单量：{{keyword1.DATA}}
//          异常详情：{{keyword2.DATA}}
//          提醒时间：{{keyword3.DATA}}
//          {{remark.DATA}}

        return true;
    }




}
