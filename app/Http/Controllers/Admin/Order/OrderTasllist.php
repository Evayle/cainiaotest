<?php

namespace App\Http\Controllers\Admin\Order;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderTasllist extends Controller
{
    //后台查询任务清单列表

    private static $BoundTask;

    public function __construct()
    {

        if(!self::$BoundTask) self::$BoundTask = new CainiaoBoundTask();
    }

    public function index(Request $request){

        $dataChunk = self::$BoundTask->select(DB::raw('count(two_logisticsOrderCode) num'),'two_logisticsOrderCode')->groupBy('two_logisticsOrderCode','bound_time')->orderBy('bound_time')->get()->toArray();


        dd($dataChunk);



    }

}
