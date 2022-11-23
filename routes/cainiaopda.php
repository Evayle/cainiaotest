<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Pda'], function ($api){

    $api->group(['middleware' => 'adminToken'], function ($api){

        $api->post('cainiao/admin/pda/order/arrive', 'OrderArriveSign@index');

    });

});


