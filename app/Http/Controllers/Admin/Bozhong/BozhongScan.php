<?php

namespace App\Http\Controllers\Admin\Bozhong;

use App\Http\Controllers\Controller;
use App\Models\BeginPickBox;
use App\Models\Forecast;
use Illuminate\Http\Request;
use App\Http\Controllers\Library\Cainiao\OrderBeginPick;
use App\Http\Controllers\Library\Cainiao\OrderOutBoundApply;


class BozhongScan extends Controller
{
    //播种扫描
    private static  $Goods;
    private static  $PickBox;
  

    //绑定播种的区域
    public function __construct(){

        if(!self::$Goods)   self::$Goods   = new Forecast();
        if(!self::$PickBox) self::$PickBox = new BeginPickBox();
    }

    public function index(Request $request){


        //查询是不是单件
        
        if(!$request->filled('order')) return $this->ReturnJson();


        $GoodsInfo = self::$Goods->where('mailNo', $request->order)->with(['printinfo' => function($query){

        }])->select('two_logisticsOrderCode','conso_order_query', 'trackingNumber','order_type', 'cainiao_node')->first();

        if(!$GoodsInfo) return $this->ReturnJson(400413, '该订单是无主件');

        //如果是单件或者是中件类型
        if($GoodsInfo->conso_order_query == 1 || $GoodsInfo->order_type == 1){
            
            //如果没有预报
            if(!$GoodsInfo->two_logisticsOrderCode){

                return $this->ReturnJson(400415, '该订单没有出库通知,请稍后再试');
            }

            //如果是中件的部分
            
            //已经做了菜鸟的节点同时又是中件
            if($GoodsInfo->order_type == 1){

                $GoodsInfoData = self::$Goods->where('two_logisticsOrderCode', $GoodsInfo->two_logisticsOrderCode)->select('two_logisticsOrderCode','mailNo')->get()->toArray();

                return $this->ReturnJson(200201, '获取成功',['data'=> $GoodsInfoData, 'count' => count($GoodsInfoData)]);
               
            }

            //单件
            if(!$GoodsInfo->trackingNumber){

                //发送出库通知
                $OrderBeginPick = OrderBeginPick::BeginPick($GoodsInfo->two_logisticsOrderCode, $request->order);

                if($OrderBeginPick){

                    return $this->ReturnJson(200201, '获取成功',['data'=> ['order' => $request->order, 'two_logisticsOrderCode'=>$GoodsInfo->two_logisticsOrderCode ], 'count' => 1]);
                }

                return $this->ReturnJson(400417, '请重新扫码,若失败,请联系管理员');
            }

            return $this->ReturnJson(200201, '获取成功',['data'=> ['order' => $request->order, 'two_logisticsOrderCode'=>$GoodsInfo->two_logisticsOrderCode ], 'count' => 1]);


        }

        $PickBoxInfo = self::$PickBox->where('order',$request->order)->where('status',2)->first();

        if(!$PickBoxInfo) return $this->ReturnJson(400414, '任务为空');

        $query = self::$PickBox->where('two_logisticsOrderCode', $PickBoxInfo->two_logisticsOrderCode)->where('status',2);

        $count = $query->count();

        $data = $query->get()->toArray();

        return $this->ReturnJson(200201, '获取成功',['data'=> $data, 'count' => $count]);

    }

}
