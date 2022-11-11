<?php

namespace App\Http\Controllers\Admin\Store;

use App\Http\Controllers\Controller;
use App\Models\Store;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StoreInfo extends Controller
{ //后台门店管理部分
    private static $Store;

    /**
     * UserGroup constructor
     */
    public function  __construct(){

        if(!self::$Store) {

            self::$Store = new Store();
        }
    }

    /**
     * 新增门店
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function add(Request $request){

        if(!$request->filled(['type', 'latitude', 'longitude', 'cainiao_match', 'receiving_name', 'receiving_address', 'receiving_name_simple']))
            return $this->ReturnJson(400403, '重要参数为空');

        //新增

        $data = [
            'type'                  => $request->type,
            'latitude'              => $request->latitude,
            'longitude'             => $request->longitude,
            'created_at'            => date('Y-m-d H:i:s'),
            'cainiao_match'         => $request->cainiao_match,
            'receiving_name'        => $request->receiving_name,
            'receiving_address'     => $request->receiving_address,
            'receiving_name_simple' => $request->receiving_name_simple,
        ];
        DB::beginTransaction();
        try {
            self::$Store->create($data);
            DB::commit();
            return $this->ReturnJson(200201, '提交成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '提交失败');
        }
    }

    /**
     * 查询数据
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function query(Request $request){

        $query = self::$Store;
        $offset = $request->input('offset', 0);
        $limit = $request->input('limit', 10);

        if($request->type){

            $query = $query->where('type', $request->type);
        }

        if($request->receiving_id){

            $query = $query->where('receiving_id', $request->receiving_id);
        }

        if($request->cainiao_match){

            $query = $query->where('cainiao_match', $request->cainiao_match);
        }

        if($request->receiving_name){

            $query = $query->where('receiving_name', $request->receiving_name);
        }

        if($request->receiving_address){

            $query = $query->where('receiving_address', 'like','%'.$request->receiving_address.'%');
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->get()->toArray();

        if(!$data) return $this->ReturnJson(200201, '数据获取成功');

        return $this->ReturnJson(200201, '数据获取成功', ['data'=> $data, 'count' => $count, 'page' => $offset + 1]);

    }

    /**
     * 修改门店
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request){

        if(!$request->receiving_id || ($request->receiving_id == null) || ($request->receiving_id == 0)) return $this->ReturnJson(400403, '重要参数为空');


        $Updata = [];
        if($request->type){

            $Updata['type'] = $request->type;
        }

        if($request->cainiao_match){

            $Updata['cainiao_match'] = $request->cainiao_match;
        }

        if($request->receiving_name){

            $Updata['receiving_name'] = $request->receiving_name;
        }

        if($request->receiving_name_simple){

            $Updata['receiving_name_simple'] = $request->receiving_name_simple;
        }

        if($request->receiving_address){

            $Updata['receiving_address'] = $request->receiving_address;
        }

        if($request->latitude){

            $Updata['latitude'] = $request->latitude;
        }

        if($request->longitude){

            $Updata['longitude'] = $request->longitude;
        }

        DB::beginTransaction();
        try {
            self::$Store->where('receiving_id', $request->receiving_id)->update($Updata);
            DB::commit();
            return $this->ReturnJson(200201, '修改成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '修改失败');
        }
    }

    /**
     * 删除柜点(软删除)
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function del(Request $request){

        if(!$request->receiving_id) return $this->ReturnJson(400403, '重要参数为空');

        DB::beginTransaction();
        try {
            self::$Store->where('receiving_id', $request->receiving_id)->delete();
            DB::commit();
            return $this->ReturnJson(200201, '删除成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '删除失败');
        }
    }

    /**
     * 回收站数据
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function recycleBin(Request $request){
        $query = self::$Store->onlyTrashed();
        $offset = $request->input('offset', 0);
        $limit = $request->input('limit', 10);

        if($request->type){

            $query = $query->where('type', $request->type);
        }

        if($request->receiving_id){

            $query = $query->where('receiving_id', $request->receiving_id);
        }

        if($request->cainiao_match){

            $query = $query->where('cainiao_match', $request->cainiao_match);
        }

        if($request->receiving_name){

            $query = $query->where('receiving_name', $request->receiving_name);
        }

        if($request->receiving_address){

            $query = $query->where('receiving_address', 'like','%'.$request->receiving_address.'%');
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->get()->toArray();

        if(!$data) return $this->ReturnJson(200201, '数据获取成功');

        return $this->ReturnJson(200201, '数据获取成功', ['data'=> $data, 'count' => $count, 'page' => $offset +1]);

    }


    /**
     * 彻底删除
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function  RemoveCompletely(Request $request){

        if(!$request->receiving_id) $this->ReturnJson(400403, '重要参数为空');

        DB::beginTransaction();
        try {
            self::$Store->where('receiving_id', $request->receiving_id)->forceDelete();
            DB::commit();
            return $this->ReturnJson(200201, '彻底删除成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '彻底删除失败');
        }
    }

    /**
     * 恢复数据
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function recoverData(Request $request){

        if(!$request->receiving_id) $this->ReturnJson(400403, '重要参数为空');

        DB::beginTransaction();
        try {
            self::$Store->where('receiving_id', $request->receiving_id)->restore();
            DB::commit();
            return $this->ReturnJson(200201, '恢复成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '恢复失败');
        }
    }

}
