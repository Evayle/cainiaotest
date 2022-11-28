<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use App\Models\CainiaoBoundTask;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;

class OrderTaskListInfo extends Controller
{
    //我的任务

    private static $BoundTask;
    private static $GoodsLog;

    public function __construct()
    {

        if(!self::$GoodsLog)  self::$GoodsLog  = new CainiaoOrderLog();
        if(!self::$BoundTask) self::$BoundTask = new CainiaoBoundTask();
    }

    /**
     * PDA 我的任务列表
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request){


        $adminInfo = $request->get('adminInfo');

        $data = self::$BoundTask->where('admin_name', $adminInfo->user_name)->select('id', 'mailNo', 'logisticsOrderCode', 'two_logisticsOrderCode', 'tesk_status', 'area_name', 'code', 'bound_time', 'admin_name', 'created_at')->orderBy('bound_time')->get()->toArray();

        if(!$data) return $this->ReturnJson(200202, '任务列表已清空');

        return $this->ReturnJson(200201, '获取成功', $data);

    }

}
