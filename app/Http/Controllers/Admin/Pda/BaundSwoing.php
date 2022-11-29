<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\BeginPickBox;
use App\Models\BoundSwoing;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BaundSwoing extends Controller
{
    private static  $PickBox;
    private static  $BoundSwoing;

    //绑定播种的区域
    public function __construct(){

        if(!self::$PickBox)   self::$PickBox   = new BeginPickBox();
        if(!self::$BoundSwoing)   self::$BoundSwoing   = new BoundSwoing();

    }

    public function index(Request $request){

        if(!$request->filled(['box_code', 'swoing_code'])) return $this->ReturnJson();

        //获取box的code
        $PickBoxInfo = self::$PickBox->where('staus',1)->where('code', $request->box_code)->first();

        if(!$PickBoxInfo)return  $this->ReturnJson(400413, '货架车code无效,请联系管理员');

        $BounBox = self::$BoundSwoing->where('code', $request->swoing_code)->first();

        if(!$BounBox)return  $this->ReturnJson(400415, '播种区code无效');

        $PickBoxInfoswoing_code = self::$PickBox->where('staus',1)->where('swoing_code', $request->swoing_code)->first();

        if($PickBoxInfoswoing_code) return  $this->ReturnJson(400416, '货架车code还有快件未扫描完成,不可以绑定新的code');

        //发送数据部分
        DB::beginTransaction();

        try {

            self::$PickBox->where('staus',1)->where('code', $request->box_code)->update(['staus' => 2, 'swoing_code' => $request->swoing_code]);

            DB::commit();

        }catch (\Exception $e){

            DB::rollBack();

            return $this->ReturnJson(400417, 'code绑定失败');
        }

        //同时处理发送

        return $this->ReturnJson(200201, 'code绑定成功');

    }
}
