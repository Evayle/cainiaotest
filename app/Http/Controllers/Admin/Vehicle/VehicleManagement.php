<?php

namespace App\Http\Controllers\Admin\Vehicle;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\VehicleMangement;
use Illuminate\Support\Facades\DB;

class VehicleManagement extends Controller
{
    //车辆管理

    private static $Vehicle;

    /**
     * UserGroup constructor
     */
    public function  __construct(){

        if(!self::$Vehicle) self::$Vehicle = new VehicleMangement();

    }

    public function add(Request $request){

        if(!$request->filled(['code', 'name'])) return $this->ReturnJson();
        //新增
        DB::beginTransaction();
        try {
            $data = [
                'name'        => $request->name,
                'code'    => $request->code,
                'created_at' => date('Y-m-d H:i:s'),
            ];
            self::$Vehicle->create($data);
            DB::commit();
            return $this->ReturnJson(200201, '提交成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400413, '提交失败');
        }
    }

    public function query(Request $request){

        $offset = $request->input('offset',0);
        $limit  = $request->input('limit',10);

        $query = self::$Vehicle;

        if($request->name){

            $query = $query->where('name', $request->name);
        }
        if($request->code){

            $query = $query->where('code', $request->code);
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->get();

        if(!$data) return $this->ReturnJson(200201, '获取成功');

        return $this->ReturnJson(200201, '获取成功',['data' => $data, 'count' => $count, 'page' => ($offset + 1)]);

    }

    public function edit(Request $request){

        if(!$request->id) return $this->ReturnJson();

        $data = [];

        if($request->name){

            $data['name'] = $request->name;
        }
        if($request->code){

            $data['code'] = $request->code;
        }

        DB::beginTransaction();
        try {

            self::$Vehicle->where('id', $request->id)->update($data);
            DB::commit();
            return $this->ReturnJson(200201, '修改成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400413, '修改失败');
        }

    }

    public function del(Request $request){

        if(!$request->id) return $this->ReturnJson();

        DB::beginTransaction();
        try {

            self::$Vehicle->where('id', $request->id)->delete();
            DB::commit();
            return $this->ReturnJson(200201, '删除成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '删除失败');
        }
    }



}
