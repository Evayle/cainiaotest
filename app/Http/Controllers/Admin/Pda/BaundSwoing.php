<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\BeginPickBox;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BaundSwoing extends Controller
{
    private static  $PickBox;

    //绑定播种的区域
    public function __construct(){

        if(!self::$PickBox)   self::$PickBox   = new BeginPickBox();

    }

    public function index(Request $request){


        if(!$request->filled(['box_code', 'swoing_code'])) return $this->ReturnJson();

        //获取box的code
        $PickBoxInfo = self::$PickBox->where('staus',1)->where('code', $request->box_code)->first();

        if(!$PickBoxInfo)return  $this->ReturnJson(400413, 'code无效');



        //发送数据部分


        DB::beginTransaction();

        try {

            self::$PickBox->where('staus',1)->where('code', $request->box_code)->update(['staus' => 2]);

            DB::commit();



        }catch (\Exception $e){

            DB::rollBack();

            return $this->ReturnJson(400417, 'code绑定失败');
        }

        //同时处理发送

        return $this->ReturnJson(200201, 'code绑定成功');


    }
}
