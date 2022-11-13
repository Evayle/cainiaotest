<?php

namespace App\Http\Controllers\Admin\Area;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Area;
use App\Models\Store;
use Illuminate\Support\Facades\DB;


class ReservoirBand extends Controller
{
    //库区绑定


    private static $Area;
    private static $Store;

    public function  __construct(){

        if(!self::$Area)  self::$Area = new Area();
        if(!self::$Store) self::$Store = new Store();

    }

    /**
     * 库区绑定门店操作
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function BoundArea(Request $request){

        if(!$request->filled(['store_id', 'area_id'])) return $this->ReturnJson();

        $Areainfo = self::$Area->where('id', $request->area_id)->first();
        $Storenfo = self::$Store->where('receiving_id', $request->store_id)->first();

        if(!$Areainfo || !$Storenfo) return $this->ReturnJson(400403, '请确认门店或者库区是否存在');

        DB::beginTransaction();
        try {
            $Storenfo->update(['area_id' => $request->area_id]);
            DB::commit();
            return $this->ReturnJson(200201, '绑定成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '绑定失败');
        }

    }

    /**
     * 门店/柜点解除库区
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function CancelBoundArea(Request $request){

        if(!$request->filled('store_id')) return $this->ReturnJson();

        $Storenfo = self::$Store->where('receiving_id', $request->store_id)->first();

        if(!$Storenfo) return $this->ReturnJson(400403, '请确认门店或者库区是否存在');

        DB::beginTransaction();
        try {
            $Storenfo->update(['area_id' => 0]);
            DB::commit();
            return $this->ReturnJson(200201, '解绑成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '解绑失败,请联系管理员');
        }

    }

}
