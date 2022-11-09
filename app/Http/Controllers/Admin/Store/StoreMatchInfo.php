<?php

namespace App\Http\Controllers\Admin\Store;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\StoreMatch;
use Illuminate\Support\Facades\DB;


class StoreMatchInfo extends Controller
{
    //后台门店管理部分
    private static $StoreMatch;

    /**
     * UserGroup constructor
     */
    public function  __construct(){

        if(!self::$StoreMatch) {

            self::$StoreMatch = new StoreMatch();
        }
    }

    /**
     * 新增门店
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function add(Request $request){

        if(!$request->filled(['cainiao_match', 'cainiao_match_chi', 'cainiao_transfer', 'cainiao_transfer_chi', 'receiving_address']))
            return $this->ReturnJson(400403, '重要参数为空');

        //新增

        $data = [
            'created_at'                     => date('Y-m-d H:i:s'),
            'cainiao_match'                  => $request->cainiao_match,
            'cainiao_transfer'               => $request->cainiao_transfer,
            'receiving_address'              => $request->receiving_address,
            'cainiao_match_chi'              => $request->cainiao_match_chi,
            'cainiao_transfer_chi'           => $request->cainiao_transfer_chi,

        ];
        DB::beginTransaction();
        try {
            self::$StoreMatch->create($data);
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

        $query = self::$StoreMatch;
        $offset = $request->input('offset', 0);
        $limit = $request->input('limit', 10);

        if($request->cainiao_match){

            $query = $query->where('cainiao_match', $request->cainiao_match);
        }

        if($request->cainiao_match_chi){

            $query = $query->where('cainiao_match_chi', $request->cainiao_match_chi);
        }

        if($request->cainiao_transfer_chi){

            $query = $query->where('cainiao_transfer_chi', $request->cainiao_transfer_chi);
        }

        if($request->cainiao_transfer){

            $query = $query->where('cainiao_transfer', $request->cainiao_transfer);
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->get()->toArray();

        if(!$data) return $this->ReturnJson(200201, '数据获取成功');

        return $this->ReturnJson(200201, '数据获取成功', ['data'=> $data, 'count' => $count, 'page' => $limit +1]);

    }

    /**
     * 修改门店
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function edit(Request $request){

        if(!$request->id) return $this->ReturnJson(400403, '重要参数为空');

        $Updata = [];
        if($request->cainiao_match){

            $Updata['cainiao_match'] = $request->cainiao_match;
        }

        if($request->cainiao_match_chi){

            $Updata['cainiao_match_chi'] = $request->cainiao_match_chi;
        }

        if($request->cainiao_transfer){

            $Updata['cainiao_transfer'] = $request->cainiao_transfer;
        }

        if($request->cainiao_transfer_chi){

            $Updata['cainiao_transfer_chi'] = $request->cainiao_transfer_chi;
        }

        DB::beginTransaction();
        try {
            self::$StoreMatch->where('id', $request->id)->update($Updata);
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

        if(!$request->id) return $this->ReturnJson(400403, '重要参数为空');

        DB::beginTransaction();
        try {
            self::$StoreMatch->where('id', $request->id)->delete();
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
        $query = self::$StoreMatch->onlyTrashed();
        $offset = $request->input('offset', 0);
        $limit = $request->input('limit', 10);

        if($request->cainiao_match){

            $query = $query->where('cainiao_match', $request->cainiao_match);
        }

        if($request->cainiao_match_chi){

            $query = $query->where('cainiao_match_chi', $request->cainiao_match_chi);
        }

        if($request->cainiao_transfer_chi){

            $query = $query->where('cainiao_transfer_chi', $request->cainiao_transfer_chi);
        }

        if($request->cainiao_transfer){

            $query = $query->where('cainiao_transfer', $request->cainiao_transfer);
        }

        $count = $query->count();

        $data = $query->offset($offset)->limit($limit)->get()->toArray();

        if(!$data) return $this->ReturnJson(200201, '数据获取成功');

        return $this->ReturnJson(200201, '数据获取成功', ['data'=> $data, 'count' => $count, 'page' => $limit +1]);

    }


    /**
     * 彻底删除
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function  RemoveCompletely(Request $request){

        if(!$request->id) return $this->ReturnJson(400403, '重要参数为空');

        DB::beginTransaction();
        try {
            self::$StoreMatch->where('id', $request->id)->forceDelete();
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

        if(!$request->id) return $this->ReturnJson(400403, '重要参数为空');

        DB::beginTransaction();
        try {
            self::$StoreMatch->where('id', $request->id)->restore();
            DB::commit();
            return $this->ReturnJson(200201, '恢复成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '恢复失败');
        }
    }

}
