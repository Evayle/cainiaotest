<?php

namespace App\Http\Controllers\Task;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use App\Models\CainiaoOrderLog;
use App\Models\Forecast;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Admin\Push\WxPush;

class OrderOutBoundTask extends Controller
{
    private static $Goods;
    private static $GoodsLog;
    private static $BoundTask;

    public function __construct()
    {
        if(!self::$Goods)     self::$Goods     = new Forecast();
        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
        if(!self::$BoundTask) self::$BoundTask = new CainiaoBoundTask();
    }

    //任务列表
    public  function index(Request $request){

        //任务列表--出库才有任务
        $query = self::$Goods->where('order_status', 17);

        $dataInfo = $query->with(['areainfo' => function($query){

            $query->where('status',1)->select('order', 'area_id', 'area_name', 'code');

        }])->select('two_logisticsOrderCode', 'mailNo','logisticsOrderCode', 'outbound_time', 'order_type')->get()->toArray();

        if(!$dataInfo) return true;

        $orderType =[];
        $error = [];

        if($dataInfo){

            $date = date('Y-m-d H:i:s');

            foreach ($dataInfo as  $key => $vals){

                if($vals['order_type'] == 1 ){

                    $orderType []=$vals['two_logisticsOrderCode'];
                }
                 DB::beginTransaction();
                 try {
                    $data = [
                        'created_at' =>$date,
                        'mailNo'     => $vals['mailNo'],
                        'bound_time' => $vals['outbound_time'],
                        'code'       => isset($vals['areainfo']['code'])      ? $vals['areainfo']['code']      : null,
                        'area_id'    => isset($vals['areainfo']['area_id'])   ? $vals['areainfo']['area_id']   : null ,
                        'area_name'  => isset($vals['areainfo']['area_name']) ? $vals['areainfo']['area_name'] : null,
                        'logisticsOrderCode' => $vals['logisticsOrderCode'],
                        'order_type' => $vals['order_type'],
                        'two_logisticsOrderCode' => $vals['two_logisticsOrderCode'],
                    ];
                     self::$BoundTask->create($data);
                     self::$GoodsLog->create(['order' => $vals['logisticsOrderCode'], 'text' => '待出库任务已同步任务列表']);
                     DB::commit();
                 }catch (\Exception $e){
                     $error [] = $vals['logisticsOrderCode'];
                     DB::rollBack();
                 }
            }
        }
        //如果有大件合单部分
         if($orderType){

             self::$BoundTask->whereIn('two_logisticsOrderCode', $orderType)->update(['order_type' => 1]);
         }

         if($error){
            //通知微信--后期走队列更快
             WxPush::OutBoundNoticeError($error);
         }

        $query->update(['order_status' => 18]);

        return $this->ReturnJson(200201, 'ok');
    }

    private  function DateSet(){

        return date('Y-m-d H:i;s',strtotime(date('Y-m-d')) + 60*60*16);
    }
}
