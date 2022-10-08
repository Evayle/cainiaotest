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
        return view('admin.login.login');

        if (!$request->filled(['user_phone', 'user_password'])) {

           return response()->json([
               'code' => '400413', 'msg' => '重要參數為空'
           ],403);

        }
        $phone    = $request->input('user_phone');
        $password = $request->input('user_password');


        if(strlen($phone) == 11 || strlen($phone) == 8){



            $userInfo = self::$AdminUser->where('user_status', '1')->where('user_phone', $phone)->first();

            if (!$userInfo) {

                return response()->json([
                    'code' => '400413', 'msg' => '獲取用戶信息失敗!'
                ]);
            }

            if(!Hash::check($password,$userInfo->user_password)){
                return response()->json([
                    'code' => '400413', 'msg' => '密碼錯誤!'
                ]);

            }

            //密碼正確,存入到session

            //生成token

            $token = md5($userInfo->user_password.$userInfo->user_password);

            $userInfo->update(['user_token' => $token]);


//            session::put($phone, $token);
//            $data = session::put($phone, $token);
//            dump($data);
//
//            $data = session::get($phone);
//            dump($data);
//            $data =  session::flush($phone);
//            dump($data);
//

            return view('admin.login.login');
        }
        return response()->json([
            'code' => '400413', 'msg' => '電話號碼格式錯誤'
        ]);

    }



    public function banUsers(Request $request)
    {

        if (!$request->filled(['user_phone'])) {

            return response()->json([
                'code' => '400413', 'msg' => '重要參數為空'
            ],403);

        }

        $phone = $request->input('user_phone');

        if(strlen($phone) == 11 || strlen($phone) == 8){

            $userInfo = self::$AdminUser->where('user_status', 1)->where('user_phone', $phone)->first();

            if (!$userInfo) {

                return response()->json([
                    'code' => '400413', 'msg' => '獲取用戶信息失敗!'
                ]);
            }

            $userInfo->update(['user_status' => '0']);
            session::flush($phone);
            return '刪除成功';
        }
        return response()->json([
            'code' => '400413', 'msg' => '電話號碼格式錯誤'
        ]);
    }


}
