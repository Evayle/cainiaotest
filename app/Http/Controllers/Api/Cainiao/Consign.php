<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Caoniaotext;
use App\Models\Forecast;
use App\Models\ForecastShop;
use App\Models\ForecastCount;
use App\Models\ForecastUserinfo;
use Illuminate\Support\Facades\DB;

class Consign extends Controller
{
    //CONSO_WAREHOUSE_CONSIGN


    private static $getdate;

    private static $shopData;
    private static $orderData;
    private static $orderCount;
    private static $paymentData;


    public function __construct()
    {
        self::$getdate = date("Y-m-d H:i:s");
        if(!self::$shopData)    self::$shopData    = new ForecastShop();
        if(!self::$orderData)   self::$orderData   = new Forecast();
        if(!self::$orderCount)  self::$orderCount  = new ForecastCount();
        if(!self::$paymentData) self::$paymentData = new ForecastUserinfo();

    }

    /**
     * 接收菜鸟的部分
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {


        $param = $request->all();


        Caoniaotext::create(['text' => json_encode($param)]);

        return $this->ReturnCainiao('下发成功');
    }


    public function  sign(Request $request)
    {


//        dd($request->all());

//        if(!$request->filled(['msg_type', 'msg_id', 'from_code', 'partner_code', 'data_digest', 'logistics_interface'])) return $this->ReturnCainiaoError('重要参数为空');
        //验证

        //处理签名
//        if($request->msg_type !=' ' || $request->msg_id != '' || $request->from_code != '' || $request->partner_code != '' || $request->data_digest != '' || $request->logistics_interface != '')
//            return $this->ReturnCainiaoError();

        //接收数据--主表信息--SKU等信息---商品支付等信息

        //主体信息部分

        $body = $request->logisticsEvent['eventBody']['logisticsDetail'];
        $tradeDetail = $request->logisticsEvent['eventBody']['tradeDetail'];
        $paymentDetail = $request->logisticsEvent['eventBody']['paymentDetail'];

        try {

            $shopData = $this->shopData($paymentDetail, $body['items'][0]);

            $orderData = $this->orderData($body, $tradeDetail, $body['items'][0]);

            $paymentDetail =$this->paymentData($body);

        }catch (\Exception $e){

            return $this->ReturnCainiaoError('参数异常');
        }
//        dd($orderData, $shopData, $paymentDetail);
        DB::beginTransaction();
        try {
            $OrderById = self::$orderData->insertGetId($orderData);

            $shopData['d_id']      = $OrderById;
            $paymentDetail['d_id'] = $OrderById;
            self::$shopData->create($shopData);
            self::$paymentData->create($paymentDetail);
            self::$orderCount->datacount(self::$getdate);
            DB::commit();
            return $this->ReturnCainiao();
        }catch (\Exception $e){
            DB::rollBack();
            return $this->ReturnCainiaoError('数据接收异常,请联系管理员');
        }
    }


    public function orderData($body, $tradeDetail,$shopInfo){


        return [
            'mailNo'             => $body['mailNo'],
            'consoType'          => $body['consoType'],
            'deliveryType'       => $body['deliveryType'],
            'isLastPackage'      => $body['isLastPackage'],
            'isSplitConsign'     => $body['isSplitConsign'],
            'packageQuantity'    => $body['packageQuantity'],
            'shop_name'          => $shopInfo['categoryName'],
            'logisticsOrderCode' => $body['logisticsOrderCode'],
            'tradeOrderId'       => $tradeDetail['tradeOrderId'],
            'user_name'          => $body['buyerDetail']['name'],
            'dereRecogCode'      => $tradeDetail['dereRecogCode'],
            'user_phone'         => $body['buyerDetail']['mobile'],
            'created_at'         => self::$getdate
        ];
    }

    public function  shopData($paymentDetail,$shopInfo){

        return [

            'skuId'              => $shopInfo['skuId'],
            'itemId'             => $shopInfo['itemId'],
            'itemName'           => $shopInfo['itemName'],
            'itemPicUrl'         => $shopInfo['itemPicUrl'],
            'categoryId'         => $shopInfo['categoryId'],
            'itemQuantity'       => $shopInfo['itemQuantity'],
            'categoryName'       => $shopInfo['categoryName'],
            'itemUnitPrice'      => $shopInfo['itemUnitPrice'],
            'itemSkuProperty'    => $shopInfo['itemSkuProperty'],
            'totalActualPayment' => $shopInfo['totalActualPayment'],
            'tradeOrderValue'    => $paymentDetail['tradeOrderValue'],
            'totalShippingFee'   => $paymentDetail['totalShippingFee'],
//            'gstCurrency'=> $shopInfo['gstCurrency'],
//            'exchangeRate'=> $shopInfo['exchangeRate'],
//            'isLevyTax',
//            'isPresent',

//            'actualSenderName',
            'created_at' => self::$getdate
        ];

    }

    public function  paymentData($body) {

        return [
            'buyer_wangwangId' => $body['buyerDetail']['wangwangId'],
            'buyer_name' => $body['buyerDetail']['name'],
            'buyer_mobile' => $body['buyerDetail']['mobile'],
//            'buyer_email'=> $body['buyerDetail']['email'],
            'buyer_country' => $body['buyerDetail']['country'],
            'buyer_province' => $body['buyerDetail']['province'],
            'buyer_city' => $body['buyerDetail']['city'],
            'buyer_district' => $body['buyerDetail']['district'],
//            'buyer_town'  => $body['buyerDetail']['town'],
            'buyer_streetAddress' => $body['buyerDetail']['streetAddress'],
            'sender_wangwangId' => $body['senderDetail']['streetAddress'],
            'sender_name' => $body['senderDetail']['name'],
            'sender_shopName' => $body['senderDetail']['shopName'],
            'mobile' => $body['senderDetail']['mobile'],
            'country' => $body['senderDetail']['country'],
            'province' => $body['senderDetail']['province'],
            'sender_city' => $body['senderDetail']['city'],
            'sender_district' => $body['senderDetail']['district'],
//            'sender_town' => $body['senderDetail']['town'],
            'sender_streetAddress' => $body['senderDetail']['streetAddress'],
            'created_at' => self::$getdate
        ];

    }


}
