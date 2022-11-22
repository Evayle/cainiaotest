<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Cainiao'], function ($api){


    $api->group(['middleware' => 'adminToken'], function ($api){

        //包裹到达
        $api->post('cainiao/admin/order/arrive', 'Orderin@index');

        //包裹查询
        $api->post('cainiao/admin/order/query', 'OrderQuery@index');

        //包裹签收操作
        $api->post('cainiao/admin/order/sign', 'OrderSign@index');


        //天机入库签收等操作
        $api->post('cainiao/tj/admin/order/sign', 'EquipmenSignOrder@index');

        //手动入库部分

        $api->post('cainiao/tj/admin/order/inbond', 'OrderInbound@index');












    });




});


