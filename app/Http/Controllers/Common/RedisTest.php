<?php

namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use App\Jobs\ProcessPodcast;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class RedisTest extends Controller
{
    //
    public function index(){

        date_default_timezone_set('prc');
        //创建一个数组模拟用户数据
        $data = array(
            'tid'=>date('Y-m-d H:i:s').uniqid()
        );
        //将数据放到队列里
        $job = (new ProcessPodcast($data))->delay(5);    //delay()延迟
        $job->dispatch($job)->onQueue('trade');    //设置队列名称，否则为默认名称
        //打印一个返回信息
        return "我是订单方法";
    }
}
