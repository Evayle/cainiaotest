<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Pda'], function ($api){

    $api->group(['middleware' => 'adminToken'], function ($api){

        //PDA签收入库
        $api->post('cainiao/admin/pda/order/arrive', 'OrderArriveSign@index');

        //PDA上架部分
        $api->post('cainiao/admin/pda/order/shelf', 'OrderShelf@index');

        //PDA任务列表
        $api->get('cainiao/admin/pda/task/list', 'OrderTaskList@index');

        //领取任务
        $api->post('cainiao/admin/pda/set/task', 'OrderTaskSet@index');

        //我的任务
        $api->get('cainiao/admin/pda/my/task/list', 'OrderTaskListInfo@index');

        //下架操作
        $api->post('cainiao/admin/pda/order/offshelf', 'OrderShelves@index');

        //绑定播种区
        $api->post('cainiao/admin/pda/baundswoing/baound', 'BaundSwoing@index');

        //播种扫描--获取播种的坑位
        $api->post('cainiao/admin/pda/baundswoing/sacn', 'BaoundSwoingScan@index');

        //大包号出库
        $api->post('cainiao/admin/pda/order/ountbound', 'PakageOut@index');

    });

});


