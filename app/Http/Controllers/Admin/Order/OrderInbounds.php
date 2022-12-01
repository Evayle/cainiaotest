<?php

namespace App\Http\Controllers\Admin\Order;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use App\Models\Store;
use App\Models\Forecast;
use App\Models\ShelfInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Library\Cainiao\OrderInbound;

class OrderInbounds extends Controller
{
    //pc订单入库

    private static $Goods;
    private static $Store;
    private static $GoodsLog;
    private static $ShelfInfo;


    public function __construct()
    {
        if(!self::$Store)     self::$Store     = new Store();
        if(!self::$Goods)     self::$Goods     = new Forecast();
        if(!self::$ShelfInfo) self::$ShelfInfo = new ShelfInfo();
        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
    }

    /**
     * 统一入库
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request){
  
        $adminInfo = $request->get('adminInfo');

        if(!$request->filled(['mailNo', 'weight']))  return $this->ReturnJson();

        if($request->weight < 0.02 || $request->weight > 26){

            return $this->ReturnJson(400415, '重量异常，不可以低于0.02或者超过26kg');
        }

        $Goodsinfo = self::$Goods->where('mailNo', $request->mailNo)->select('mailNo', 'logisticsOrderCode', 'order_status', 'cainiao_node', 'conso_order_query','store_name','weight')->first();
       
        if(!$Goodsinfo) return $this->ReturnJson(400413, '该订单是无主件');

        //在这里查询有没有重量
        
        if($Goodsinfo->order_status == 6) return $this->ReturnJson(400417, '该订单已退货');

        if($Goodsinfo->order_status < 5 ||  $Goodsinfo->order_status > 10) {

            return $this->ReturnJson(400423, $this->OrderStatusInfo($Goodsinfo->order_status));
        }
    
        // if($Goodsinfo->order_status == 6)  return $this->ReturnJson(400415, '该订单订单已退回');

        if($Goodsinfo->order_status == 10) {

            // self::$Goods->where('mailNo', $request->mailNo)->update(['weight' => $request->weight, 'update_at' => date('Y-m-d H:i:s')]);
            if($Goodsinfo->conso_order_query == 1){

                return $this->ReturnJson(200202, '单件入库成功');
            }

            return $this->ReturnJson(200201, '多件入库成功');
        }

        //如果是单件--查看有没有入库，没有就入库，有入库，就直接分拣出库，
        if($Goodsinfo->conso_order_query == 1){
            // 10入库,显示订单在那个区
            //如果单件
            $OrderInbound = OrderInbound::Inbond($Goodsinfo->mailNo,$Goodsinfo->logisticsOrderCode,($request->weight * 1000));

            if(!$OrderInbound){
                return  $this->ReturnJson(400418, '单件入库失败！');
            }

            DB::beginTransaction();

            try {
                self::$Goods->where('mailNo', $request->mailNo)->update(['order_status' => 10, 'weight' => ($request->weight * 1000), 'cainiao_node' => 7,'created_at' => date('Y-m-d H:i:s')]);
                self::$GoodsLog->create(['text' => '该订单（单件）已入库,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name]);
                DB::commit();
                return $this->ReturnJson(200202, '单件入库成功');
            }catch (\Exception $e){
                DB::rollBack();
                return $this->ReturnJson(400419, '单件入库失败,请联系管理员!');
            }
    
        }else{
            
            //查询绑定的库区
            $storeinfo = self::$Store->area_infos($Goodsinfo->store_name);

            if(!$storeinfo) return $this->ReturnJson(400421, '该订单的快件没有绑定库区,请联系仓管!');

            $ShelfInfo = self::$ShelfInfo->where('order', $request->mailNo)->select('id')->first();

            if($ShelfInfo) return $this->ReturnJson(200203, '多件已入库成功,等待上架');
        }

        DB::beginTransaction();
        try {
            self::$Goods->where('logisticsOrderCode', $request->mailNo)->update(['order_status' => 10, 'weight' => $request->weight,'created_at' => date('Y-m-d H:i:s')]);
            self::$ShelfInfo->create(['order' => $Goodsinfo->mailNo, 'area_id' => $storeinfo['area_id'], 'area_name' => $storeinfo['area_name'],'created_at' => date('Y-m-d H:i:s')]);
            self::$GoodsLog->create(['text' => '该快件已入库,快件库区是:'.$storeinfo['area_name'].',操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name]);
            DB::commit();
            return $this->ReturnJson(200201, '多件入库成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400420, '多件入库失败,请联系管理员!');
        }
    }
}
