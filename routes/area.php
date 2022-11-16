<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Area'], function ($api){

    /**
     * 库区增删改查
     */
    $api->group(['middleware' => 'adminToken'], function ($api){

        /**
         * 库区增删改查
         */
        $api->post('admin/area/add', 'ReservoirArea@add');
        $api->post('admin/area/del', 'ReservoirArea@del');
        $api->post('admin/area/edit', 'ReservoirArea@edit');
        $api->get ('admin/area/query', 'ReservoirArea@query');

        /**
         * 库区业务逻辑操作部分--库区绑定门点
         */

        $api->post('admin/area/bandarrive',  'ReservoirBand@BoundArea');
        $api->post('admin/area/cancelbandarrive',  'ReservoirBand@CancelBoundArea');
        $api->post('admin/area/sort', 'ReservoirBand@Storesort');


    });
});


