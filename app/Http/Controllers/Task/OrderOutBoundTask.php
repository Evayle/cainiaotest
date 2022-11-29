<?php

namespace App\Http\Controllers\Task;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use App\Models\CainiaoOrderLog;
use App\Models\Forecast;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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

            $query->select('order', 'area_id', 'area_name', 'code');

        }])->select('two_logisticsOrderCode', 'mailNo','logisticsOrderCode', 'outbound_time')->get()->toArray();


        if($dataInfo){

            $date = date('Y-m-d H:i:s');
            
            foreach ($dataInfo as  $key => $vals){

                DB::beginTransaction();
                try {
                    $data = [
                        'created_at' =>$date,
                        'mailNo'     => $vals['mailNo'],
                        'bound_time' => $vals['outbound_time'],
                        'code'       =>$vals['areainfo']['code'],
                        'area_id'    => $vals['areainfo']['area_id'],
                        'area_name'  => $vals['areainfo']['area_name'],
                        'logisticsOrderCode' => $vals['logisticsOrderCode'],
                        'two_logisticsOrderCode' => $vals['two_logisticsOrderCode'],
                    ];

                    // dd($data);
                    self::$BoundTask->create($data);
                    self::$GoodsLog->create(['order' => $vals['logisticsOrderCode'], 'text' => '待出库任务已同步任务列表']);
                    DB::commit();
                }catch (\Exception $e){
                    DB::rollBack();
                }
            }
        }

        $query->update(['order_status' => 18]);

        return $this->ReturnJson(200201, 'ok');
    }

    private  function DateSet(){

        return date('Y-m-d H:i;s',strtotime(date('Y-m-d')) + 60*60*16);
    }
}
