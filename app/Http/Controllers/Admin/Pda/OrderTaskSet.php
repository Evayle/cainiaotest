<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderTaskSet extends Controller
{
    //领取任务

    private static $BoundTask;
    private static $GoodsLog;

    public function __construct()
    {

        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
        if(!self::$BoundTask) self::$BoundTask = new CainiaoBoundTask();
    }


    public function index(Request $request){

        $adminInfo = $request->get('adminInfo');

        if(!$request->filled('taskID')) return $this->ReturnJson();

        $data = self::$BoundTask->where('tesk_status', 0)->where('two_logisticsOrderCode', $request->taskID)->select('id', 'two_logisticsOrderCode','mailNo')->get()->toArray();

        if(!$data) return $this->ReturnJson(400413, '领取的任务不存在,请返回刷新重新认领');
    

        $dataLog = [];
        $date = date('Y-m-d H:i:s');

        foreach ($data as $key => $val){

            $dataLog[$key]['text']      = '该快件任务已被'.$adminInfo->user_name.'认领,认领时间是'.$date;
            $dataLog[$key]['order']     = $val['mailNo'];
            $dataLog[$key]['user_name'] = $adminInfo->user_name;
        }

        DB::beginTransaction();

        try {
            self::$BoundTask->where('tesk_status', 0)->where('two_logisticsOrderCode', $request->taskID)->update(['tesk_status' => 1, 'admin_name' =>$adminInfo->user_name]);
            self::$GoodsLog->insert($dataLog);
            DB::commit();
            return $this->ReturnJson(200201, '认领成功!');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400417, '认领失败!');
        }
    }
}
