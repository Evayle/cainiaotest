<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;
use App\Models\Forecast;
use Illuminate\Support\Facades\DB;

class CainiaoOutboundNotice extends Controller
{
    //菜鸟出库通知
    //CONSO_WAREHOUSE_OUTBOUND_NOTICE


    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)     self::$Goods     = new Forecast();
        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
    }

    public function index(Request $request){


        if(!$request->filled(['logistics_interface', 'data_digest', 'partner_code', 'msg_type'])) return $this->ReturnCainiaoError();

        if($request->msg_type !='CONSO_WAREHOUSE_OUTBOUND_NOTICE' || $request->partner_code != 'TRAN_STORE_30792933')  return $this->ReturnCainiaoError();

        $params = $request->logistics_interface;

        $param = json_encode($request->all());

        $logistics_interface = json_decode($params);

        try {

            $outbound_time      = date('Y-m-d H:i:s');
            $carrierCode        = $logistics_interface->logisticsEvent->eventBody->logisticsDetail->carrierCode;
            $logisticsOrderCode = $logistics_interface->logisticsEvent->eventBody->logisticsDetail->logisticsOrderCode;

            $outboundLogisticsOrderCodes = $logistics_interface->logisticsEvent->eventBody->logisticsDetail->outboundLogisticsOrderCodes;

            $outOrders = explode("|", $outboundLogisticsOrderCodes);

        }catch (\Exception $e){

            return $this->ReturnCainiaoError('数据验收失败');
        }

        $date = date('Y-m-d H:i:s');
        $error = null;
        foreach($outOrders as $key => $item) {

            DB::beginTransaction();

            try {
                self::$Goods->where('logisticsOrderCode', $item)->update(['cainiao_node' => 10, 'two_logisticsOrderCode' => $logisticsOrderCode, 'outbound_time' =>  $outbound_time, 'carrierCode' => $carrierCode]);
                $log = ['text' => '该快件菜鸟下发预报,等待出库,预报的时间是:'.$date, 'user_name' => '菜鸟API发送', 'order' => $item, 'created_at' => $date, 'cainiao_api' => 'CONSO_WAREHOUSE_OUTBOUND_NOTICE'];
                self::$GoodsLog->where('order', $item)->create($log);
                DB::commit();
            }catch (\Exception $e){
                DB::rollBack();
                $error = true;
            }
        }

        if($error){

            DB::table('cainiao_outbount_error_log')->insert(['text' => $param]);
            return $this->ReturnCainiaoError('数据接收异常,请重新发送');
        }
        return  $this->ReturnCainiao();

    }

    public function indexs(Request $request){

        try {

            $param = json_encode($request->all());

            DB::table('cainiao_yubao')->insert(['text' => $param, 'created_at' => date('Y-m-d H:i:s',time())]);
            return $this->ReturnCainiao();
        }catch (\Exception $e){

            return $this->ReturnCainiaoError('数据接收异常,请联系管理员');
        }

    }

}
