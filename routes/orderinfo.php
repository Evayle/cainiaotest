<?php

use Illuminate\Support\Facades\Route;

Route::group(['namespace'=>'App\Http\Controllers\Admin\Order'], function ($api){

    //处理订单搜素的部分
    $api->group(['middleware' => 'adminToken'], function ($api){

        //客服查询订单的部分
        $api->get ('admin/order/infos/query', 'Search@index');

        //pc多件入库部分--有重量
        $api->post('cainiao/zh/order/in/bound', 'OrderInbounds@index');

        //pc单件入库部分--无重量
        $api->post('cainiao/zh/order/in/bounds', 'OrderInbound@index');

    });

     //多件打印上架单
     $api->get('cainiao/order/shelf/printinfo', 'OrderShelfPrint@index');

        //处理定时任务的部分
        $api->post('cainiao/task/callback', 'OutBoundCallback@index');

});

Route::group(['namespace'=>'App\Http\Controllers\Admin\Bozhong'], function ($api){

    $api->group(['middleware' => 'adminToken'], function ($api){
        //pc 扫码待出库
        $api->post('cainiao/admin/order/scan/bound', 'BozhongScan@index');
        //打印
        $api->post('cainiao/admin/order/bound/print', 'PrintSBKJ@index');


        //播种区管理
        $api->post('cainiao/bozhong/set', 'BozhongIndex@add');
        $api->post('cainiao/bozhong/del', 'BozhongIndex@del');
        $api->post('cainiao/bozhong/edit', 'BozhongIndex@edit');
        $api->get('cainiao/bozhong/list', 'BozhongIndex@query');
    });
});

Route::group(['namespace'=>'App\Http\Controllers\Task'], function ($api){

    // $api->group(['middleware' => 'adminToken'], function ($api){
        //模拟任务下发
        $api->post('cainiao/task/xaifa', 'OrderOutBoundTask@index');
    // });
});


//车辆管理
Route::group(['namespace'=>'App\Http\Controllers\Admin\Vehicle'], function ($api){

    $api->group(['middleware' => 'adminToken'], function ($api){
        //车辆管理
        $api->post('cainiao/vehicle/set', 'VehicleManagement@add');
        $api->post('cainiao/vehicle/del', 'VehicleManagement@del');
        $api->post('cainiao/vehicle/edit', 'VehicleManagement@edit');
        $api->get('cainiao/vehicle/list', 'VehicleManagement@query');

    });
});