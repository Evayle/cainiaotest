<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\ShelfInfo;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Library\Cainiao\OrderInbound;

class OrderShelf extends Controller
{

    private static $Goods;
    private static $GoodsLog;
    private static $ShelfInfo;

    public function __construct()
    {
        if(!self::$Goods)     self::$Goods     = new Forecast();
        if(!self::$ShelfInfo) self::$ShelfInfo = new ShelfInfo();
        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
    }

    public function index(Request $request){

        $adminInfo = $request->get('adminInfo');

        //处理订单
        if(!$request->filled(['logisticsOrderCode', 'code'])) return $this->ReturnJson();

        // if(strlen($request->code) < 3) return $this->ReturnJson(400415, '货架单长度太短');

        $GoodsInfo = self::$ShelfInfo->where('order', $request->logisticsOrderCode)->select('id', 'status', 'area_id', 'code')->first();

        if(!$GoodsInfo) return $this->ReturnJson(400416, '该订单未入库,请入库后再上架');

        $Goods = self::$Goods->where('logisticsOrderCode', $request->logisticsOrderCode)->select('mailNo')->first();

        $OrderInbound = OrderInbound::Inbond($Goods->mailNo,$request->logisticsOrderCode);

        if(!$OrderInbound) return $this->ReturnJson(400417, '订单上架失败,请立即联系管理员');

        DB::beginTransaction();

        try {

            self::$Goods->where('logisticsOrderCode', $request->logisticsOrderCode)->update(['order_status' => 15]);

            self::$ShelfInfo->where('order', $request->logisticsOrderCode)->update(['code' => $request->code, 'status' => 1]);

            $log = ['text' => '该快件已上架,上架货架号是:'.$request->code, 'user_name' => $adminInfo->user_name, 'order' => $request->logisticsOrderCode, 'created_at' => date('Y-m-d H:i:s')];

            self::$GoodsLog->where('order', $request->mailNo)->create($log);

            DB::commit();

            return $this->ReturnJson(200201, '上架成功!');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400417, '上架失败,请重新上架,请联系管理员');
        }
    }
}
