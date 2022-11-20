<?php

namespace App\Http\Controllers\Admin\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderQuery as Query;

class OrderQuery extends Controller
{
    //CONSO_ORDER_QUERY

    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();
    }

    /**
     * 集运信息查询
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public  function index(Request $request){

        if(!$request->mailNo) return $this->ReturnJson();

        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'logisticsOrderCode', 'mailNo')->first();

        if(!$GoodsInfo) return $this->ReturnJson(400403, '该订单不存在上游系统');

        $dataInfo = Query::index($GoodsInfo->logisticsOrderCode);

        if(!$dataInfo) return $this->ReturnJson(400403, '查询失败!请知悉');

        //查询时,处理订单的状态 isTail isSingle
        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo', $request->mailNo)->update(['conso_order_query' => $dataInfo->isSingle, 'isLastPackage' => $dataInfo->isSingle]);

            DB::commit();
            return $this->ReturnJson(200201, '查询成功');
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '查询成功,状态设置失败,请知悉!');
        }
    }

}
