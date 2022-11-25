<?php

namespace App\Http\Controllers\Admin\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoOrderLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderArrive;
use App\Http\Controllers\Library\Cainiao\OrderQuery;
use App\Http\Controllers\Library\Cainiao\OrderSign;
use App\Http\Controllers\Library\Cainiao\OrderInbound;

class EquipmenSignOrder extends Controller
{
    //天机签收

    private static $Goods;
    private static $GoodsLog;

    //天机签收,单件是否在这里执行入库部分
    private $type = 1;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request) {

        if(!$request->filled(['parcel_weight', 'mailNo', 'long', 'width', 'height', 'operator']))           return $this->ReturnJson();
        if(!$this->VerifyNum([$request->long, $request->width, $request->height, $request->parcel_weight])) return $this->ReturnJson(400413, '重要参数的值,不可以为0');

        $adminInfo = $request->get('adminInfo');

        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'logisticsOrderCode','order_status', 'mailNo', 'conso_order_query')->first();

        if(!$GoodsInfo) return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        //体积重
        $volume = number_format(($request->long * $request->width * $request->height) / 6000, 2);

        if($this->VerifyStatus($GoodsInfo->order_status != 1)) return $this->ReturnJson(400415,$this->OrderStatusInfo($GoodsInfo->order_status));

        //订单入库

        $OrderArrive = OrderArrive::OrderArrive($GoodsInfo);

        if(!$OrderArrive) return $this->ReturnJson(400415,'订单到达失败,请联系管理员,查看该日志');

        $OrderQuery = OrderQuery::index($GoodsInfo->logisticsOrderCode);

        $OrderSign = OrderSign::SignInfo($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode);

        if(!$OrderSign){

            //快件达到成功,签收失败

            $orderStatus = ['order_status' => 1, 'cainiao_node' => 4];
            $dataInfo = [];

        }


















    }



    /**
     * 处理写入sql的部分
     * @param $mailNo
     * @param $orderStatus
     * @param $dataInfo
     * @return bool
     */
    private function SetDB($mailNo, $orderStatus, $dataInfo){

        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo', $mailNo)->update($orderStatus);
            self::$GoodsLog->insert($dataInfo);
            DB::commit();
            return true;
        }catch (\Exception $e){
            DB::rollBack();
            return false;
        }
    }

    private function VerifyStatus($status) {

        if($status === 0 ) {
            return 1;
        }
        //处理异的员因
        return $this->OrderStatusInfo($status);

    }
}
