<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\BeginPickBox;
use App\Models\Forecast;
use App\Models\BoundSwoing;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BaoundSwoingScan extends Controller
{

    private static  $Goods;
    private static  $PickBox;
    private static  $BoundSwoing;

    //绑定播种的区域
    public function __construct(){

        if(!self::$Goods)         self::$Goods       = new Forecast();
        if(!self::$PickBox)       self::$PickBox     = new BeginPickBox();
        if(!self::$BoundSwoing)   self::$BoundSwoing = new BoundSwoing();

    }

    //播种扫描
    public function index(Request $request){

        if(!$request->filled(['code', 'order'])) return $this->ReturnJson();

        $PickBoxInfo = self::$PickBox->where('status',2)->where('code',$request->code)->where('order', $request->order)->select('order','two_logisticsOrderCode','out_sort')->first();

        if(!$PickBoxInfo) return $this->ReturnJson(400417, '订单异常,请联系管理员查看该快件所属区域');

        //获取这里坑位的所有顺序
        if($PickBoxInfo->out_sort) return $this->ReturnJson(200201, '获取成功', ['sort' => $PickBoxInfo->out_sort]);

        //如果没有code

        $PickBoxData = self::$PickBox->where('status',2)->where('code',$request->code)->get()->toArray();

        $t = 0;

        foreach ($PickBoxData as $key => $item){

            if($t < $item['out_sort']){
                $t = $item['out_sort'];
            }
        }

        DB::beginTransaction();

        try {

            self::$PickBox->where('two_logisticsOrderCode', $PickBoxInfo->two_logisticsOrderCode)->update(['out_sort' => ($t + 1)]);
            DB::commit();
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400418, '排序获取失败');
        }

        return $this->ReturnJson(200201, '获取成功',['sort' => $t+1]);
    }
}
