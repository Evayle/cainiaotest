<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Pda'], function ($api){

    $api->group(['middleware' => 'adminToken'], function ($api){

        $api->post('cainiao/admin/pda/order/arrive', 'OrderArriveSign@index');

        //PDA上架部分
        $api->post('cainiao/admin/pda/order/shelf', 'OrderShelf@index');

        //PDA任务列表
        $api->get('cainiao/admin/pda/task/list', 'OrderTaskList@index');

    });

});


