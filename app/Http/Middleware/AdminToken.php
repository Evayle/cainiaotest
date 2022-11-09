<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\AdminUser;
use Illuminate\Support\Facades\Cache;

class AdminToken
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {

        if(!$request->header('Authorization')) {
            return response(['code' => 400403, 'msg' => '认证缺失'],404);
        }

        $token = explode(' ', $request->header('Authorization'))[1];

        if(!$token){
            return response(['code' => 400403, 'msg' => '认证缺失'],404);
        }


        if(!Cache::get($token)){

            return response(['code' => 400403, 'msg' => '认证失效'],404);

        }

        $token = json_decode(Cache::get($token));

        if(strtotime($token->token_time) < time()){

            return response(['code' => 400403, 'msg' => '认证过期,请重新登录'],404);
        }

        $request->request->set('adminInfo', $token);

        //读取用户的token
        return $next($request);
    }
}
