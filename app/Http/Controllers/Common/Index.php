<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AdminUserGruop;

class Index extends Controller
{
    /**
     * @var AdminUserGruop
     */
    private static $AdminUserGroup;

    /**
     * UserGroup constructor
     */
    public function  __construct(){

        if(!self::$AdminUserGroup) {

            self::$AdminUserGroup = new AdminUserGruop();
        }
    }


    public function add(Request $request){


    }

    public function query(Request $request){


    }

    public function edit(Request $request){


    }

    public function del(Request $request){


    }


}
