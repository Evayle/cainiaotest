<?php

namespace App\Http\Controllers\Admin\Cainiao;

use App\Http\Controllers\Controller;
use Faker\Core\Number;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoOrderLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use  App\Http\Controllers\Library\Cainiao\OrderArrive;

class Orderin extends Controller
{
    //CONSO_WAREHOUSE_ARRIVE

    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    /**
     * 包裹到达
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request) {

        $adminInfo = $request->get('adminInfo');
        dd($adminInfo);
        if(!$request->mailNo) return $this->ReturnJson();

        if(Cache::get($request->mailNo)) return $this->ReturnJson(400403,'该订单是无主件,请知悉!');

        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'order_status', 'mailNo')->first();

        if(!$GoodsInfo){

            //入库失败,是无主件
            Cache::put($request->mailNo,'1',10);

            return $this->ReturnJson(400403,'该订单是无主件,请知悉1!');
        }

        $StatusInfo = $this->VerifyStatus($GoodsInfo->order_status);

        if($StatusInfo !== 1){
            //修改订单状态
            return $this->ReturnJson(400403,'该订单的状态是:'.$StatusInfo);
        }

        //处理订单
        $data = OrderArrive::OrderArrive($GoodsInfo);

        if(!$data) return $this->ReturnJson(400403,'快件到达操作失败,请重新操作一次');

        //如果订单是入库过的话,
        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo')->update(['order_status' => 1, 'cainiao_node' => 4]);
            self::$GoodsLog->create(['text' => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name, 'user_name' => $adminInfo->user_name, 'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE']);
            DB::commit();
            return $this->ReturnJson(200201, '到达成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '到达失败!');
        }
    }

    private function VerifyStatus($status) {

        if($status === 0 ) {
            return 1;
        }

        //处理异的员因
        switch ($status){

            case 1:
                return '上游仓库已入库';
                break;
            case 5:
                return '上游仓库已上架';
                break;
            case 10:
                return '上游仓库已下架';
                break;
            case 15:
                return '上游仓库开始分拨';
                break;
            case 20:
                return '上游仓打包出库';
                break;
            case 25:
                return '上游仓出库';
                break;
            default:
                return '状态不详';
                break;

        }
    }
}
