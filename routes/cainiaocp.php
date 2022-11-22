<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Api\Cainiao'], function ($api){

    /**
     * 菜鸟cp-->cn
     */
    $api->post('cainiao/arrive/warehouse', 'CainiaoArrive@index'); //快件到达仓库
    $api->post('cainiao/warehouse/sign', 'Consign@index'); //快件签收操作-->成功
    $api->post('cainiao/warehouse/sign/error', 'Consign@SignError'); //快件签收操作-->失败
    $api->post('cainiao/warehouse/inbound', 'CainiaoInbound@index'); //菜鸟入库操作--成功
    $api->post('cainiao/warehouse/inbound/error', 'CainiaoInbound@inboundError'); //菜鸟入库操作--失败
    $api->post('cainiao/warehouse/order/query', 'CainiaoOrderQuery@index'); //菜鸟查询订单


    $api->post('cainiao/warehouse/outbound/apply', 'CainiaoOutboundApply@index'); //仓库开始挑拣
    $api->post('cainiao/warehouse/outbound', 'CainiaoOutbound@index'); //仓库开始出库

    /**
     * 分拨仓库
     */
    $api->post('cainiao/warehouse/sortingcenter/inbound',   'CainiaoSortingcenterInbnbound@index'); //分拨仓仓库入库
    $api->post('cainiao/warehouse/sortingcenter/ountbound', 'CainiaoSortingcenterOutbound@index'); //分拨仓仓库出库

});


