<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use GatewayClient\Gateway;

class Index extends Controller
{

    /**
     * 初始化向服务器注册连接
     * Index constructor.
     */
    public  function __construct()
    {
        Gateway::$registerAddress = '127.0.0.1:1238';
    }


    /**
     * 用户client_id绑定用户uid
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {

        if(!$request->filled('client_id')){

            return response()->json(['code' => '400413', 'msg' => '重要参数为空']);

        }

        $client_id = $request->input('client_id');

        $uid = 10;

        if(!$client_id){

            return response()->json(['code' => '400413', 'msg' => '重要参数为空']);
        }

        Gateway::bindUid($client_id, $uid);

        return response()->json(['code' => '200201', 'msg' => '用户绑定成功']);

    }


    /**
     * 服务器向单个用户发送信息,可用给某个用户私聊
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function SendMessage(Request $request)
    {

        if(!$request->filled('message')){

            return response()->json(['code' => '400413', 'msg' => '重要参数为空']);
        }

        $message = $request->input('message');

        if(!$message){

            return response()->json(['code' => '400413', 'msg' => '重要参数为空']);
        }

        $uid = $request->input('uid');

        Gateway::sendToUid($uid, $message);

        return response()->json(['code' => '200201', 'msg' => '发送成功']);

    }

}
