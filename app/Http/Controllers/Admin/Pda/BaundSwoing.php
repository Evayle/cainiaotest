<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\BeginPickBox;
use App\Models\BoundSwoing;
use App\Models\VehicleMangement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BaundSwoing extends Controller
{
    private static  $BeginPickBox;
    private static  $BoundSwoing;
    private static  $VehicleMangement;

    //绑定播种的区域
    public function __construct(){

        if(!self::$BoundSwoing)      self::$BoundSwoing      = new BoundSwoing();
        if(!self::$BeginPickBox)     self::$BeginPickBox     = new BeginPickBox();
        if(!self::$VehicleMangement) self::$VehicleMangement = new VehicleMangement();
    }

    public function index(Request $request){


        if(!$request->filled(['box_code', 'swoing_code'])) return $this->ReturnJson();

        $BoundSwoing =  self::$BoundSwoing->where('code', $request->swoing_code)->first();

        if(!$BoundSwoing) return $this->ReturnJson(400417, '车辆code不存在');

        $VehicleMangement = self::$VehicleMangement->where('code', $request->box_code)->first(); 

        if(!$VehicleMangement) return $this->ReturnJson(400418, '播种区code失败');

        $PickBoxInfoswoing_code = self::$BeginPickBox->where('code', $request->box_code)->orderBy('id', 'DESC')->first();

        if(!$PickBoxInfoswoing_code){
            
            return $this->ReturnJson(400421, '绑定异常,该快件不应该出现在分流区');
        }

        if($PickBoxInfoswoing_code->status == 2) return $this->ReturnJson(200202, '已经绑定了');

        // if($PickBoxInfoswoing_code->status == 1) return $this->ReturnJson(400419, '分流区已绑定');

        //发送数据部分
        DB::beginTransaction();

        try {

            self::$BeginPickBox->where('status',1)->where('code', $request->box_code)->update(['status' => 2, 'swoing_code' => $request->swoing_code]);

            DB::commit();

            return $this->ReturnJson(200201, 'code绑定成功');
        }catch (\Exception $e){

            DB::rollBack();

            return $this->ReturnJson(400419, 'code绑定失败');
        }


    }
}
