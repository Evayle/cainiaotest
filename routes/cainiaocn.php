<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Api\Cainiao'], function ($api){

    /**
     * 菜鸟cn-->cp预报部分
     */
    $api->post('cainiao/warehouse/forecast/notice', 'CainiaoConSign@index'); //菜鸟仓库签收预报
    $api->post('cainiao/warehouse/update/notice', 'CainiaoOutboundNotice@index'); //菜鸟仓库预报更新
    $api->post('cainiao/warehouse/cancel/notice', 'CainiaoOutboundNotice@index'); //菜鸟仓库预报取消
    $api->post('cainiao/warehouse/return_refund/notice', 'CainiaoOutboundNotice@index'); //菜鸟仓库预报退款取消

    /**
     * 菜鸟cn-cp出库部分
     */
    $api->post('cainiao/warehouse/outbound/notice', 'CainiaoOutboundNotice@index'); //菜鸟仓库出库通知
    $api->post('cainiao/warehouse/fee_status/notice', 'CainiaoOutboundNotice@index'); //菜鸟仓库出库通知取消


    /**
     * 菜鸟本地预报下发的部分
     */
//    $api->post('cainiao/warehouse/sign', 'Consign@sign'); //菜鸟仓库签收预报
//    $api->post('cainiao/warehouse/update/sign/test', 'ConsignUpdate@index'); //菜鸟仓库预报更新
//    $api->post('cainiao/warehouse/cancel/notice/test', 'ConsignCancel@index'); //菜鸟仓库预报取消
//    $api->post('cainiao/warehouse/return_refund/notice/test', 'ConsignRefund@index'); //菜鸟仓库预报退款取消
//
//
//    /**
//     * 菜鸟cn-cp出库部分
//     */

//    $api->post('cainiao/warehouse/outbound/notice', 'Consign@index'); //菜鸟仓库出库通知
//    $api->post('cainiao/warehouse/fee_status/notice', 'Consign@index'); //菜鸟仓库出库通知取消


    $api->post('cainiao/test', 'TEST@index');


});


