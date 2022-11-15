<?php

namespace App\Http\Controllers\Admin\Area;

use App\Http\Controllers\Controller;
use App\Models\Area;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReservoirArea extends Controller
{
    //库区增删改查
    private static $Area;
    private static $Store;

    /**
     * UserGroup constructor
     */
    public function  __construct(){

        if(!self::$Area)  self::$Area = new Area();
        if(!self::$Store) self::$Store = new Store();

    }

    /**
     * 新增库区
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function add(Request $request){

        if(!$request->filled('area_name'))


            return $this->ReturnJson(400403, '重要参数为空');

        //新增
        DB::beginTransaction();

        try {
            $data = [
                'area_name'  => $request->area_name,
                'created_at' => date('Y-m-d H:i:s'),
                'admin_name' => $request->get('adminInfo')->user_name.'修改于'.date('Y-m-d H:i:s'),
            ];
            self::$Area->create($data);
            DB::commit();
            return $this->ReturnJson(200201, '提交成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '提交失败');
        }
    }

    /**
     * 库区查询
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function query(Request $request){

        $query = self::$Area;
        $offset = $request->input('offset', 0);
        $limit = $request->input('limit', 10);

        if($request->area_name){

            $query = $query->where('area_name', $request->area_name);
        }

        if($request->id){

            $query = $query->where('id', $request->id);
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->with(['store' => function($query){

            $query->select('area_id', 'id','cainiao_match', 'receiving_name', 'receiving_name_simple');

        }])->get()->toArray();

        if(!$data) return $this->ReturnJson(200201, '数据获取成功');

        return $this->ReturnJson(200201, '数据获取成功', ['data'=> $data, 'count' => $count, 'page' => $offset +1]);

    }

    /**
     * 修改库区
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request){

        if(!$request->id) return $this->ReturnJson();
        $Updata = [];
        if($request->area_name){

            $Updata['area_name'] = $request->area_name;
            $Updata['admin_name'] =$request->get('adminInfo')->user_name.'修改于'.date('Y-m-d H:i:s');
        }

        DB::beginTransaction();
        try {
            self::$Area->where('id', $request->id)->update($Updata);
            DB::commit();
            return $this->ReturnJson(200201, '修改成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '修改失败');
        }
    }

    /**
     * 删除库区
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function del(Request $request){

        if(!$request->id) return $this->ReturnJson();

        if(self::$Store->where('area_id', $request->id)->count() > 0) return $this->ReturnJson(400403, '该库区还存在门店,请解除绑定门店后再进行删除库区操作');

        DB::beginTransaction();
        try {
            self::$Area->where('id', $request->id)->delete();
            DB::commit();
            return $this->ReturnJson(200201, '删除成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '删除失败');
        }
    }


}
