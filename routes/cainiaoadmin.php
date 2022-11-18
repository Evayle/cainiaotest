<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Cainiao'], function ($api){


    $api->group(['middleware' => 'adminToken'], function ($api){

        //包裹到达
        $api->post('cainiao/admin/order/arrive', 'Orderin@index');

        //包裹签收操作
        $api->post('cainiao/admin/order/sign', 'Orderin@index');

    });




});


