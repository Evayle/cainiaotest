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



Route::group(['namespace'=>'App\Http\Controllers\Admin\User'], function ($api){

    /**
     * 后台用户的增,删,改,查
     */
    $api->post('admin/user/add', 'User@add');
    $api->post('admin/user/del', 'User@del');
    $api->post('admin/user/edit', 'User@edit');
    $api->get('admin/user/query', 'User@query');
    $api->get('admin/user/rights', 'User@queryRole');
    $api->post('admin/user/set/role', 'User@setRole');
    $api->post('admin/login', 'UserLogin@login');
    $api->post('admin/loginout', 'UserLogin@loginOut');

    /**
     * 后台用户组部分
     */
    $api->post('admin/group/add', 'UserGroup@add');
    $api->post('admin/group/del', 'UserGroup@del');
    $api->post('admin/group/edit', 'UserGroup@edit');
    $api->get('admin/group/query', 'UserGroup@query');

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


