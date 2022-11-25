<?php

namespace App\Http\Controllers\Admin\Pda;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forecast;
use App\Models\CainiaoOrderLog;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Cache;
use App\Http\Controllers\Library\Cainiao\OrderArrive;
use App\Http\Controllers\Library\Cainiao\OrderQuery;
use App\Http\Controllers\Library\Cainiao\OrderSign;
use App\Http\Controllers\Library\Code\CainiaoErrorCode;

class OrderArriveSign extends Controller
{
    //快件到达签收
    private static $Goods;
    private static $GoodsLog;

    public function __construct()
    {
        if(!self::$Goods)    self::$Goods    = new Forecast();
        if(!self::$GoodsLog) self::$GoodsLog = new CainiaoOrderLog();
    }

    public function index(Request $request) {

        $adminInfo = $request->get('adminInfo');

        if(!$request->filled(['mailNo', 'code'])) return $this->ReturnJson();

        $GoodsInfo = self::$Goods->where('mailNo', $request->mailNo)->select('id', 'logisticsOrderCode','order_status', 'mailNo')->first();

        if(!$GoodsInfo) return $this->ReturnJson(400413, '该订单是无主件');

        if($GoodsInfo->order_status == 5) return $this->ReturnJson(200201,'该订单已到达签收');
        if($GoodsInfo->order_status == 6) return $this->ReturnJson(400415,'快件已退回取消');

        if(!OrderArrive::OrderArrive($GoodsInfo)) return $this->ReturnJson(400416,'订单到达异常,请联系管理员');

        //到达签收异常处理
        if($request->code != 200){

            //处理异常签收
            $SignError = OrderSign::SignError($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode,$request->code);

            if(!$SignError) return $this->ReturnJson(400417, '订单签收失败反馈异常,请重新尝试,或者联系管理员');

            $datainfo = [
                [
                    'order'       => $GoodsInfo->mailNo,
                    'user_name'   => $adminInfo->user_name,
                    'created_at'  => date('Y-m-d H:i:s'),
                    'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE',
                    'text'        => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name,
                ],
                [
                    'order'       => $GoodsInfo->mailNo,
                    'user_name'   => $adminInfo->user_name,
                    'created_at'  => date('Y-m-d H:i:s'),
                    'cainiao_api' => 'CONSO_WAREHOUSE_SIGN',
                    'text'        => '菜鸟上游仓库快件签收异常,异常原因是:'.CainiaoErrorCode::SignCode($request->code).',操作人员的账号是:'.$adminInfo->user_name,
                ]
            ];
            $orderStatus = ['order_status' => 6, 'cainiao_node' => 6];

            $SetDB = $this->SetDB($GoodsInfo->mailNo, $orderStatus, $datainfo);

            return $SetDB ? $this->ReturnJson(200202, '签收异常已处理'): $this->ReturnJson(400418, '签收异常,数据写入失败,联系管理员') ;

        }

        //正常快件的签收

        OrderQuery::index($GoodsInfo->logisticsOrderCode);

        $OrderSign = OrderSign::SignInfo($GoodsInfo->mailNo, $GoodsInfo->logisticsOrderCode);

        if(!$OrderSign){

            $orderStatus = ['order_status' => 1, 'cainiao_node' => 4];

            $datainfo = [
                'order'       => $GoodsInfo->mailNo,
                'user_name'   => $adminInfo->user_name,
                'created_at'  => date('Y-m-d H:i:s'),
                'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE',
                'text'        => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name,
            ];

            $SetDB = $this->SetDB($GoodsInfo->mailNo, $orderStatus, $datainfo);

            return $SetDB
                    ? $this->ReturnJson(200203, '快件已到达')
                    : $this->ReturnJson(400419, '快件到达失败,请重现扫码,若再失败,请联系管理员') ;

        }


        $datainfo = [
            [
                'order'       => $GoodsInfo->mailNo,
                'user_name'   => $adminInfo->user_name,
                'created_at'  => date('Y-m-d H:i:s'),
                'cainiao_api' => 'CONSO_WAREHOUSE_ARRIVE',
                'text'        => '菜鸟上游仓库快件已到达,操作人员的账号是:'.$adminInfo->user_name,
            ],
            [
                'order'       => $GoodsInfo->mailNo,
                'user_name'   => $adminInfo->user_name,
                'created_at'  => date('Y-m-d H:i:s'),
                'cainiao_api' => 'CONSO_WAREHOUSE_SIGN',
                'text'        => '菜鸟上游仓库快件签收成功:,操作人员的账号是:'.$adminInfo->user_name,
            ]
        ];
        $orderStatus = ['order_status' => 5, 'cainiao_node' => 5];

        $SetDB = $this->SetDB($GoodsInfo->mailNo, $orderStatus, $datainfo);

        return $SetDB
            ? $this->ReturnJson(200201, '快件已到达,签收')
            : $this->ReturnJson(400420, '快件到达签收失败,请重现扫码,若再失败,请联系管理员') ;

    }


    /**
     * 处理写入sql的部分
     * @param $mailNo
     * @param $orderStatus
     * @param $dataInfo
     * @return bool
     */
    public function SetDB($mailNo, $orderStatus, $dataInfo){


        DB::beginTransaction();
        try {
            self::$Goods->where('mailNo', $mailNo)->update($orderStatus);
            self::$GoodsLog->insert($dataInfo);
            DB::commit();
            return true;
        }catch (\Exception $e){
            DB::rollBack();
            return false;
        }

    }

}
