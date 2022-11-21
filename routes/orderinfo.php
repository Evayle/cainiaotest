<?php

use Illuminate\Support\Facades\Route;

Route::group(['namespace'=>'App\Http\Controllers\Admin\Order'], function ($api){

    //处理订单搜素的部分
    $api->group(['middleware' => 'adminToken'], function ($api){

        //客服查询订单的部分

        $api->get ('admin/order/infos/query', 'Search@index');


    });
});


