<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUserGruop;
use Illuminate\Support\Facades\DB;

class UserGroup extends Controller
{
    /**
     * @var AdminUserGruop
     */
    private static $AdminUserGroup;

    /**
     * UserGroup constructor
     */
    public function  __construct(){

        if(!self::$AdminUserGroup) {

            self::$AdminUserGroup = new AdminUserGruop();
        }
    }

    /**
     * 增加用户分组
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function add(Request $request){

        //处理必要的参数
        if(!$request->filled('name')) {

            return $this->ReturnJson(400403, '重要参数为空');
        }

        DB::beginTransaction();
        try {
            self::$AdminUserGroup->create(['name' => $request->name, 'created_at' => date('Y-m-d H:i:s')]);
            DB::commit();
            return $this->ReturnJson(200201, '提交成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '提交失败');
        }
    }

    /**
     * 查询分组
     * @param Request $request
     * @return \Illuminate\Http\JsonResponsez
     */
    public function query(Request $request){

        $query = self::$AdminUserGroup;
        $offset = $request->input(['offset',1]);
        $limit  = $request->input(['limit',10]);

        if($request->name) {

            $query = $query ->where('name', $request->name);
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->get()->toArray();

        return $this->ReturnJson(200201,'获取成功',['data' => $data,'count' => $count]);

    }

    /**
     * 修改分组
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request){

        if(!$request->filled('id')){

            return $this->ReturnJson(200201,'重要参数为空');
        }

        $UpdateData  = [];
        if($request->name){

            $UpdateData['name'] = $request->name;
        }

        DB::beginTransaction();
        try {
            self::$AdminUserGroup->where('id', $request->id)->udpate($UpdateData);
            DB::commit();
            return $this->ReturnJson(200201, '修改成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '修改失败');
        }

    }

    /**
     * 删除用户分组
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function del(Request $request){

        if(!$request->filled('id')) return $this->ReturnJson(400403,'重要参数为空');


        $AdminUser = new \App\Models\AdminUser();
        $AdminUserinfo = $AdminUser->where('user_group', $AdminUser)->first();

        if($AdminUserinfo){

            return $this->ReturnJson(400403, '该分组还有用户使用,请将在使用过的用户分组移至别的分组再进行删除');
        }

        DB::beginTransaction();
        try {
            self::$AdminUserGroup->where('id', $request->id)->delete();
            DB::commit();
            return $this->ReturnJson(200201, '删除成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '删除失败');
        }

    }

}
