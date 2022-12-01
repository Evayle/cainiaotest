<?php

namespace App\Http\Controllers\Admin\Bozhong;

use App\Http\Controllers\Controller;
use App\Models\CainiaoPrintInfo;
use App\Models\BeginPickBox;
use App\Models\Forecast;
use Illuminate\Http\Request;
use App\Http\Controllers\Library\Cainiao\OrderOutBoundApply;
use Illuminate\Support\Facades\DB;


class PrintSBKJ extends Controller
{
    //打印面单
    private static $Goods;
    private static $PickBox;
    private static $PtintInfo;

    public function __construct()
    {
        if(!self::$Goods)      self::$Goods     = new Forecast();
        if(!self::$PickBox)    self::$PickBox   = new BeginPickBox();
        if(!self::$PtintInfo)  self::$PtintInfo = new CainiaoPrintInfo();
    }

    public function index(Request $request){

        if(!$request->filled('order')) return $this->ReturnJson();

        $data = self::$Goods->where('two_logisticsOrderCode', $request->order)->select('trackingNumber')->first();

        if(!$data)  return $this->ReturnJson(400416, '该订单未入库或上架');

        if($data->trackingNumber){

            $Print = self::$PtintInfo->where('order', $data->trackingNumber)->select('print_Data')->first();

            self::$PtintInfo->where('order', $data->trackingNumber)->increment('is_print',1);

            return $this->ReturnJson(200202, '获取成功',['printData' => $Print]);
        }

        //没有,则请求

        $logisticsOrderCode = $request->order;

        $two_logisticsOrderCode = null;

        $dataInfo = self::$Goods->where('two_logisticsOrderCode', $request->order)->select('logisticsOrderCode', 'mailNo')->get()->toArray();

        foreach ($dataInfo as $key =>$vals){

            $two_logisticsOrderCode .= $vals['logisticsOrderCode'].'|';
        }

        $two_logisticsOrderCode = substr($two_logisticsOrderCode,0,strlen($two_logisticsOrderCode)-1);
     
        $PrintInfo = OrderOutBoundApply::APPLY($two_logisticsOrderCode,$logisticsOrderCode );

    
        if(!$PrintInfo) return $this->ReturnJson(400417, '获取打印面单失效,请联系管理员');

        $trackingNumber = $PrintInfo->waybillDetail->mailNo;

        $CainiaoPrintInfo = [
            'order' => $PrintInfo->waybillDetail->mailNo,
            'print_Data' => $PrintInfo->waybillDetail->cloudPrintData,
        ];

        DB::beginTransaction();
        try {
            self::$PtintInfo->create($CainiaoPrintInfo);
            self::$PickBox->where('two_logisticsOrderCode', $request->order)->update(['status' => 3]);
            self::$Goods->where('two_logisticsOrderCode',$request->order)->update(['trackingNumber' => $trackingNumber, 'order_status' => 40, 'cainiao_node' => 12]);
            DB::commit();
            return $this->ReturnJson(200201, '获取成功',['printData' => $PrintInfo->waybillDetail->cloudPrintData]);
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnJson(400403, '获取失败');
        }

    }
}
