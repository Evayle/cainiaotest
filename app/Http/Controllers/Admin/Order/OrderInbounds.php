<?php

namespace App\Http\Controllers\Admin\Order;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use App\Models\Store;
use App\Models\Forecast;
use App\Models\ShelfInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
     * 多件入库
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request){

        $adminInfo = $request->get('adminInfo');

        if(!$request->filled('mailNo'))  return $this->ReturnJson();

        $Goodsinfo = self::$Goods->where('mailNo', $request->mailNo)->select('mailNo', 'logisticsOrderCode', 'order_status', 'cainiao_node', 'conso_order_query','store_name')->first();

        if(!$Goodsinfo) return $this->ReturnJson(400403, '订单不存在');

        if($Goodsinfo->conso_order_query ==1) return $this->ReturnJson(400405, '该功能是多件入库');

        if($Goodsinfo->order_status < 7 ||  $Goodsinfo->order_status > 10) {

            return $this->ReturnJson(400403, $this->OrderStatusInfo($Goodsinfo->order_status));
        }

        if($Goodsinfo->order_status == 10) return $this->ReturnJson(200201, '该订单订单已入库');

        //查询绑定的库区
        $storeinfo = self::$Store->area_infos($Goodsinfo->store_name);

        if(!$storeinfo) return $this->ReturnJson(400403, '该订单的快件没有绑定库区,请联系仓管!');

        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo', $request->mailNo)->update(['order_status' => 10, 'created_at' => date('Y-m-d H:i:s')]);
            self::$ShelfInfo->create(['order' => $request->mailNo, 'area_id' => $storeinfo['area_id'], 'area_name' => $storeinfo['area_name'],'created_at' => date('Y-m-d H:i:s')]);
            self::$GoodsLog->create(['text' => '该快件已入库,快件库区是:'.$storeinfo['area_name'].',操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name]);
            DB::commit();
            return $this->ReturnJson(200201, '入库成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '入库失败,请联系管理员!');
        }
    }

}
