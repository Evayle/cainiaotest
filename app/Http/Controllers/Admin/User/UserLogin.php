<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Cache;

class UserLogin extends Controller
{


    private static $AdminUser;

    public function __construct()
    {

        if(!self::$AdminUser) {

            self::$AdminUser =  new AdminUser();
        }
    }

    /**
     * 用戶登錄操作
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request) {

        if (!$request->filled(['user_phone', 'user_password'])) return $this->ReturnJson(400403, '重要的参数为空');
        $phone    = $request->input('user_phone');
        $password = $request->input('user_password');
        if(strlen($phone) == 11 || strlen($phone) == 8){

            $userInfo = self::$AdminUser->where('user_status', '1')->where('user_phone', $phone)->first();

            if (!$userInfo) return $this->ReturnJson(400413, '用户获取失败');

            if(!Hash::check($password,$userInfo->user_password)) return $this->ReturnJson(400413, '密码错误');

            $token = md5($userInfo->user_password.$userInfo->user_password.time().round(11111,98989));
            $Userinfo = ['id' => $userInfo->id, 'user_name' => $userInfo->user_name, 'user_status' => $userInfo->user_status, 'user_phone' => $userInfo->user_phone, 'socket_id' => $userInfo->socket_id, 'user_token' => $token, 'token_time' => date('Y-m-d H:i:s',time() + 86400)];

            Cache::forget($userInfo->user_token);
            Cache::put($token, json_encode($Userinfo,JSON_UNESCAPED_UNICODE));

            $Userinfo['user_rights'] = $userInfo->user_rights;
            $Userinfo['user_rights_pda'] = $userInfo->user_rights_pda;
            $Userinfo['token'] = $userInfo->user_rights_pda;
            $userInfo->update(['user_token' => $token, 'token_time' => date('Y-m-d H:i:s',(time() + 864000))]);
            unset($userInfo['user_token'],$Userinfo['token_time']);
            return $this->ReturnJson(200201,'获取成功', $Userinfo);

        }
        return $this->ReturnJson(400403, '电话号码格式错误');

    }


    /**
     * 退出登录
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function  loginOut(Request $request){

        if (!$request->filled('id')) return $this->ReturnJson(400403, '重要的参数为空');

        if($request->id){

            $userInfo = self::$AdminUser->find($request->id);

            if(!$userInfo) return $this->ReturnJson(400403, '退出登录异常');

            Cache::forget($userInfo->user_token);

            return $this->ReturnJson(200201, '退出登录成功!');

        }
    }

}
