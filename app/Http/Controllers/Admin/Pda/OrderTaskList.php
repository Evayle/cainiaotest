<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class OrderTaskList extends Controller
{

    private static $BoundTask;

    public function __construct()
    {
        if(!self::$BoundTask) self::$BoundTask = new CainiaoBoundTask();
    }

    //任务列表

    public  function index(Request $request){

       //搜索任务列表

        $dataChunk = self::$BoundTask->where('tesk_status', 0)->select(DB::raw('count(two_logisticsOrderCode) num'),'two_logisticsOrderCode')->groupBy('two_logisticsOrderCode','bound_time')->orderBy('bound_time')->get()->toArray();

        //获取区域领任务的部分
        $tasklistnum = 2;

        $i = 0;
        $t = 0;
        $count = 0;
        $dataTsk = [];
        foreach ($dataChunk as $key => $item){

            $dataTsk[$t][$i]['taskID'] = $item['two_logisticsOrderCode'];
            $dataTsk[$t][$i]['num'] = $item['num'];
            $i++;
            if($i == $tasklistnum){
                $i = 0;
                $t++;
            }

            $count += $item['num'];
        }

        return $this->ReturnJson(200201, '获取成功',['data' => $dataTsk, 'count' => $count]);
    }

    private  function DateSet(){

        return date('Y-m-d H:i;s',strtotime(date('Y-m-d')) + 60*60*16);
    }


}
