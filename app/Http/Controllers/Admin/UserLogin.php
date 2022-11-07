<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

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

            $token = md5($userInfo->user_password.$userInfo->user_password);

            $userInfo->update(['user_token' => $token]);

            return $this->ReturnJson(200201,'获取成功',['user_phone' => $userInfo->user_phone, 'user_name' =>$userInfo->user_name, 'token' => $token, 'user_rights' => $userInfo->user_rights, 'user_rights_pda' => $userInfo->user_rights_pda]);

        }
        return $this->ReturnJson(400403, '电话号码格式错误');

    }


}
