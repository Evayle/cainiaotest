<?php

namespace App\Http\Controllers\Admin\Cainiao;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Library\Cainiao\OrderArrive;
use App\Models\CainiaoOrderLog;
use Illuminate\Http\Request;
use App\Models\Forecast;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderInbound as Inbound;

class OrderInbound extends Controller
{
    //CONSO_WAREHOUSE_INBOUND
    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request) {

        $adminInfo = $request->get('adminInfo');

        if(!$request->mailNo) return $this->ReturnJson();

        if(Cache::get($request->mailNo)) return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        if(Cache::get($request->mailNo.'arrive')) return $this->ReturnJson(200201,'该快件已入库');

        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'logisticsOrderCode','order_status', 'mailNo')->first();

        if(!$GoodsInfo){

            //入库失败,是无主件
            Cache::put($request->mailNo,'1',10);

            return $this->ReturnJson(400403,'该订单是无主件,请知悉!');
        }

        Cache::put($request->mailNo.'arrive','1',10);

        //处理订单
        $data = Inbound::Inbond($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode);

        if(!$data) return $this->ReturnJson(400403,'请重新操作一次');

        //如果订单是入库过的话,
        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo')->update(['order_status' => 10, 'cainiao_node' => 4]);
            self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);
            DB::commit();
            return $this->ReturnJson(200201, '菜鸟节点入库成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '菜鸟节点入库失败!');
        }

    }

}
