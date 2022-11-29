<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use App\Models\CainiaoOrderLog;
use App\Models\Forecast;
use App\Models\ShelfInfo;
use App\Models\BeginPickBox;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Library\Cainiao\OrderBeginPick;

class OrderShelves extends Controller
{
    //下架操作

    private static $Goods;
    private static $GoodsLog;
    private static $ShelfInfo;
    private static $BoundTask;
    private static $PickBox;

    public function __construct()
    {
        if(!self::$Goods)     self::$Goods     = new Forecast();
        if(!self::$ShelfInfo) self::$ShelfInfo = new ShelfInfo();
        if(!self::$PickBox)   self::$PickBox   = new BeginPickBox();
        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
        if(!self::$BoundTask) self::$BoundTask = new CainiaoBoundTask();

    }

    public function index(Request $request){

        $adminInfo = $request->get('adminInfo');

        //处理订单
        if(!$request->filled(['logisticsOrderCode', 'code'])) return $this->ReturnJson();

        if(strlen($request->logisticsOrderCode) < 5) return $this->ReturnJson(400415, '单号长度太短');

        $BoundTaskInfo = self::$BoundTask->where('tesk_status', 1)->where('logisticsOrderCode', $request->logisticsOrderCode)->select('id')->first();
//
        $GoodsInfo = self::$Goods->where('logisticsOrderCode', $request->logisticsOrderCode)->select('id', 'two_logisticsOrderCode', 'mailNo')->first();

        if(!$GoodsInfo) return $this->ReturnJson(400416, '该订单是无主件!');

        if(!$BoundTaskInfo) return $this->ReturnJson(400417, '请联系管理员查看该快件的上架状态');

        $date = date('Y-m-d H:i:s');

        $OrderBeginPick = OrderBeginPick::BeginPick($GoodsInfo->two_logisticsOrderCode, $GoodsInfo->mailNo);

        // if(!$OrderBeginPick) return $this->ReturnJson(400419, '发送挑选申请失败,请重新扫码');

        DB::beginTransaction();

        try {

            self::$Goods->where('logisticsOrderCode', $request->logisticsOrderCode)->update(['order_status' => 20, 'cainiao_node' => 11]);

            self::$ShelfInfo->where('order', $request->logisticsOrderCode)->update(['status' => 2]); //已下架

            self::$BoundTask->where('logisticsOrderCode', $request->logisticsOrderCode)->update(['tesk_status' => 3]);

            $log = ['text' => '该快件已下架,下架操作人是:'.$adminInfo->user_name.'操作时间是'.$date, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_BEGIN_PICK','order' => $request->logisticsOrderCode, 'created_at' => $date];

            self::$GoodsLog->where('order', $request->logisticsOrderCode)->create($log);

            self::$PickBox->create(['order' => $request->logisticsOrderCode, 'code' => $request->code, 'two_logisticsOrderCode' => $GoodsInfo->two_logisticsOrderCode]);

            DB::commit();

        }catch (\Exception $e){

            DB::rollBack();

            return $this->ReturnJson(400420, '下架失败,请重新下架,或联系管理员');
        }

        return $this->ReturnJson(200201, '下架成功!');

    }

}
