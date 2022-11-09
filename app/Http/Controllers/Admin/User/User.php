<?php

namespace App\Http\Controllers\Admin\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use App\Models\AdminUserGroup;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class User extends Controller
{

    private  static $AdminUser;
    private  static $AdminUserGroup;

    /**
     * 初始化
     * User constructor.
     */
    public function __construct()
    {
        if(!self::$AdminUser){

            self::$AdminUser = new AdminUser();
        }
        if(!self::$AdminUserGroup){

            self::$AdminUserGroup = new AdminUserGroup();
        }
    }

    /**
     * 后台人员管理列表
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function query(Request $request) {


        $limit  = $request->input('limit',10);
        $offset = $request->input('offset',0);

        $query = self::$AdminUser;

        if($request->id){

            $query = $query->where('id', $request->id);
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->select('id', 'user_name',  'user_phone', 'user_status', 'socket_id' ,'created_at', 'user_group')->get();

        return $this->ReturnJson(200201, '获取成功',['data' => $data, 'count' => $count, 'page' => ($offset + 1)]);

    }

    /**
     * 获取用户权限
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public  function queryRole(Request $request)
    {

        if(!$request->id) return $this->ReturnJson(400403, '重要参数为空');

        $query = self::$AdminUser->where('id', $request->id)->select('id','user_rights', 'user_rights_pda')->first();

        return $this->ReturnJson(200201, '获取成功',[$query]);
    }

    /**
     * 设置用户权限
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function setRole(Request $request)
    {
        if(!$request->id) return $this->ReturnJson(400403, '重要参数为空');

        $Update = [];
        if($request->user_rights){
            $Update['user_rights'] = json_encode($request->user_rights);
        }
        if($request->user_rights_pda){
            $Update['user_rights'] = json_encode($request->user_rights_pda);
        }

        DB::beginTransaction();
        try {
            self::$AdminUser->where('id', $request->id)->update($Update);
            DB::commit();
            return $this->ReturnJson(200201, '更新成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '更新失败');
        }
    }

    /**
     * 新增后台用户
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function add(Request $request){

        //处理必要的参数
        if(!$request->filled(['user_name', 'user_phone', 'user_password','user_group'])) {

            return $this->ReturnJson(400403, '重要参数为空');
        }

        $phone = $request->user_phone;
        if(!is_numeric($phone)) return $this->ReturnJson(400403, '电话参数异常');

        $Group = $this->CheckGroup($request->user_group);
        if(!$Group) return $this->ReturnJson(400403, '分组数据异常');

        $userToken = md5($request->user_phone.$request->user_phone.time());
        $data = ['user_name' => $request->user_name, 'user_phone' => $request->user_phone, 'user_password' => HASH::make($request->user_passwors),'user_group' => $request->user_group, 'user_token' => $userToken,'created_at' => date('Y-m-d H:i:s')];

        if($request->user_status){

            $data['user_status'] = '1';
        }

        DB::beginTransaction();
        try {
            self::$AdminUser->create($data);
            DB::commit();
            return $this->ReturnJson(200201, '提交成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '提交失败');
        }
    }

    /**
     * 修改后台用户信息
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request){


        if(!$request->filled('id')) return $this->ReturnJson(400403, '重要参数为空');

        $Updata = [];
        if($request->user_name){
            $Updata['user_name'] = $request->user_name;
        }

        if($request->user_phone){
            $Updata['user_phone'] = $request->user_phone;
        }

        if($request->user_status){
            $Updata['user_status'] = '1';
        }else{
            $Updata['user_status'] = '0';
        }

        if($request->user_group){

            $groupvarify = $this->CheckGroup($request->user_group);
            if(!$groupvarify) return $this->ReturnJson(400403, '分组数据异常');
            $Updata['user_group'] = $request->user_group;
        }

        if($request->user_password){

            $Updata['user_password'] = Hash::make($request->user_password);
        }

        DB::beginTransaction();
        try {
            self::$AdminUser->where('id' , $request->id)->update($Updata);
            DB::commit();
            return $this->ReturnJson(200201, '修改成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '修改失败');
        }

    }

    /**
     * 删除后台用户
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function del(Request $request){

        if(!$request->filled('id')){

            return $this->ReturnJson(400403,'重要参数为空');
        }

        DB::beginTransaction();
        try {
            self::$AdminUser->where('id', $request->id)->delete();
            DB::commit();
            return $this->ReturnJson(200201, '删除成功');

        }catch (\Exception $e){

            DB::rollBack();
            return $this->ReturnJson(400403, '删除失败');
        }

    }

    /**
     * 验证分组是否存在
     * @param $group_id
     * @return bool
     */
    public function  CheckGroup($group_id)
    {
        $Group = self::$AdminUserGroup->where('id', $group_id) ->select('id') ->first();
        return $Group ? true: false;
    }

}


