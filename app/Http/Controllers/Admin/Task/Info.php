<?php

namespace App\Http\Controllers\Admin\Task;

use App\Http\Controllers\Controller;
use App\Models\Forecast;
use Illuminate\Http\Request;

class Info extends Controller
{
    //认领件部分,用认领部分

    private static $Goods;

    public function __construct()
    {
        if(!self::$Goods) self::$Goods = new Forecast();

    }

    public  function index(Request $request){

        $data = self::$Goods->where('cainiao_node', 10)->select('created_at', 'mailNo', 'user_phone', 'trackingNumber')->get();

    }

}
