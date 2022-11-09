<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Admin\Store'], function ($api){

    /**
     * 柜点部分
     */
    $api->group(['middleware' => 'adminToken'], function ($api){

        /**
         * 上游柜点操作部分
         */
        $api->post('admin/store/add', 'StoreInfo@add');
        $api->post('admin/store/del', 'StoreInfo@del');
        $api->post('admin/store/edit', 'StoreInfo@edit');
        $api->get('admin/store/query', 'StoreInfo@query');
        $api->get('admin/store/recycle/query', 'StoreInfo@recycleBin');
        $api->post('admin/store/recycle/del', 'StoreInfo@RemoveCompletely');
        $api->post('admin/store/recycle/recover', 'StoreInfo@recoverData');

        /**
         * 转柜点部分
         */
        $api->post('admin/storematch/add', 'StoreMatchInfo@add');
        $api->post('admin/storematch/del', 'StoreMatchInfo@del');
        $api->post('admin/storematch/edit', 'StoreMatchInfo@edit');
        $api->get('admin/storematch/query', 'StoreMatchInfo@query');
        $api->get('admin/storematch/recycle/query', 'StoreMatchInfo@recycleBin');
        $api->post('admin/storematch/recycle/del', 'StoreMatchInfo@RemoveCompletely');
        $api->post('admin/storematch/recycle/recover', 'StoreMatchInfo@recoverData');

    });
});


