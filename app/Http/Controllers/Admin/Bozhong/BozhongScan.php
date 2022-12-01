<?php

namespace App\Http\Controllers\Admin\Bozhong;

use App\Http\Controllers\Controller;
use App\Models\BeginPickBox;
use Illuminate\Http\Request;


class BozhongScan extends Controller
{
    //播种扫描
    private static  $PickBox;

    //绑定播种的区域
    public function __construct(){

        if(!self::$PickBox)   self::$PickBox   = new BeginPickBox();
    }

    public function index(Request $request){

        if(!$request->filled('order')) return $this->ReturnJson();

        $PickBoxInfo = self::$PickBox->where('order',$request->order)->where('status',2)->select('two_logisticsOrderCode')->first();

        if(!$PickBoxInfo) return $this->ReturnJson(400413, '任务为空');

        $query = self::$PickBox->where('two_logisticsOrderCode', $PickBoxInfo->two_logisticsOrderCode)->where('status',2);

        $count = $query->count();

        $data = $query->get()->toArray();

        return $this->ReturnJson(200201, '获取成功',['data'=> $data, 'count' => $count]);

    }

}
