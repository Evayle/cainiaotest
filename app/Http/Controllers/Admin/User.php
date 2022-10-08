<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUser;

class User extends Controller
{

    private  static $AdminUser;

    /**
     * 初始化
     * User constructor.
     */
    public function __construct()
    {
        if(!self::$AdminUser){

            self::$AdminUser = new AdminUser();
        }
    }

    /**
     * 后台人员管理
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function UserList(Request $request) {

        $phone  = $request->input('phone');
        $limit  = $request->input('limit',10);
        $offset = $request->input('offset',0);

        $query = self::$AdminUser;

        if($phone && (strlen($phone) == 8 || strlen($phone) == 11)){

            $query = $query->where('user_phone', $phone);

        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->select('user_name', 'user_phone', 'user_stautus')->get();

        return response()->json([
            'code' => '200201', 'msg' => '獲取成功', 'data' =>['data' => $data,'count' => $count]
        ]);

    }

}


