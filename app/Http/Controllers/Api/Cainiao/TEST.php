<?php

namespace App\Http\Controllers\Api\Cainiao;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Caoniaotext;
use Illuminate\Support\Facades\DB;

class TEST extends Controller
{
    //ceshi

    private $key = '6QZc68cU1n05u2j09x9DB14747d9i8W3';

    public function  index(Request $request) {

        $param = json_decode($request->logistics_interface);

        $tradeDetail   = $param->logisticsEvent->eventBody->tradeDetail;
        $paymentDetail = $param->logisticsEvent->eventBody->paymentDetail;
        $body          = $param->logisticsEvent->eventBody->logisticsDetail;

        $shopData = $this->shopData($paymentDetail, $body->items[0]);

        $orderData = $this->orderData($body, $tradeDetail, $body->items[0]);

        $paymentDetail =$this->paymentData($body);

        dd($shopData,$orderData,$paymentDetail);


    }




    public function orderData($body, $tradeDetail,$shopInfo){


        return [
            'mailNo'             => $body->mailNo,
            'consoType'          => $body->consoType,
            'carrierCode'        => $body->carrierCode,
            'deliveryType'       => $body->deliveryType,
            'isLastPackage'      => $body->isLastPackage,
            'isSplitConsign'     => $body->isSplitConsign,
            'packageQuantity'    => $body->packageQuantity,
            'shop_name'          => $shopInfo->categoryName,
            'logisticsOrderCode' => $body->logisticsOrderCode,
            'tradeOrderId'       => $tradeDetail->tradeOrderId,
            'user_name'          => $body->buyerDetail->name,
            'dereRecogCode'      => $tradeDetail->dereRecogCode,
            'user_phone'         => $body->buyerDetail->mobile,
//            'created_at'         => self::$getdate
        ];
    }

    public function  shopData($paymentDetail,$shopInfo){

        return [

            'skuId'              => $shopInfo->skuId,
            'itemId'             => $shopInfo->itemId,
            'itemName'           => $shopInfo->itemName,
            'itemPicUrl'         => $shopInfo->itemPicUrl,
            'categoryId'         => $shopInfo->categoryId,
            'itemQuantity'       => $shopInfo->itemQuantity,
            'categoryName'       => $shopInfo->categoryName,
            'itemUnitPrice'      => $shopInfo->itemUnitPrice,
            'itemSkuProperty'    => $shopInfo->itemSkuProperty,
            'totalActualPayment' => $shopInfo->totalActualPayment,
            'tradeOrderValue'    => $paymentDetail->tradeOrderValue,
            'totalShippingFee'   => $paymentDetail->totalShippingFee,
//            'gstCurrency'=> $shopInfo->gstCurrency,
//            'exchangeRate'=> $shopInfo->exchangeRate,
//            'isLevyTax',
//            'isPresent',

//            'actualSenderName',
//            'created_at' => self::$getdate
        ];

    }

    public function  paymentData($body) {

        return [
            'buyer_wangwangId' => $body->buyerDetail->wangwangId,
            'buyer_name' => $body->buyerDetail->name,
            'buyer_mobile' => $body->buyerDetail->mobile,
//            'buyer_email'=> $body->buyerDetail->email,
            'buyer_country' => $body->buyerDetail->country,
            'buyer_province' => $body->buyerDetail->province,
            'buyer_city' => $body->buyerDetail->city,
            'buyer_district' => $body->buyerDetail->district,
//            'buyer_town'  => $body->buyerDetail->town,
            'buyer_streetAddress' => $body->buyerDetail->streetAddress,
            'sender_wangwangId' => $body->senderDetail->streetAddress,
            'sender_name' => $body->senderDetail->name,
            'sender_shopName' => $body->senderDetail->shopName,
            'mobile' => $body->senderDetail->mobile,
            'country' => $body->senderDetail->country,
            'province' => $body->senderDetail->province,
            'sender_city' => $body->senderDetail->city,
            'sender_district' => $body->senderDetail->district,
//            'sender_town' => $body->senderDetail->town,
            'sender_streetAddress' => $body->senderDetail->streetAddress,
//            'created_at' => self::$getdate
        ];

    }

}
