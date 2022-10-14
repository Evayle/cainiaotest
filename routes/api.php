<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::group(['namespace'=>'App\Http\Controllers\Admin'], function ($api){

    $api->get('mhn/info', 'User@UserList');
    $api->get('admin/login', 'UserLogin@login');

    $api->post('admin/user/pass/set', 'UserLogin@password');
});



Route::group(['namespace'=>'App\Http\Controllers\Api'], function ($api){


    $api->post('file/update/oss', 'AliOss@createNewFile');

    $api->post('file/del/info', 'AliOss@delFile');

    //绑定用户uid
    $api->post('banding/uid', 'Index@index');
    $api->post('sendmsg/uid', 'Index@SendMessage');

});


/**
 * 测试的API的部分
 */


Route::group(['namespace'=>'App\Http\Controllers\Api\Cainiao'], function ($api){


    $api->post('order/consign/infos', 'Consign@index');


});


