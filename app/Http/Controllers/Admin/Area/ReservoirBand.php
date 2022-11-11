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
        if(!self::$Store) self::$Area = new Store();
    }

    /**
     * 绑定操作
     */
    public function BoundArea(Request $request){

        if(!$request->filled(['store_id', 'area_id'])) return $this->ReturnJson();


        $Areainfo = self::$Area->select('id')->find($request->area_id);
        $Storenfo = self::$Area->select('id')->find($request->store_id);







    }





}
