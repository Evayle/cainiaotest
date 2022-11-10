<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['namespace'=>'App\Http\Controllers\Api\Cainiao'], function ($api){

        /**
         * 菜鸟cn-->cp部分
         */
        $api->post('cainiao/warehouse/sign', 'Consign@index'); //菜鸟仓库签收预报

});


