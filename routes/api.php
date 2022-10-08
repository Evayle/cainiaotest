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


