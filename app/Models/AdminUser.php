<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AdminUser extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'admin_user';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = true;

    protected $fillable = ['id', 'user_name', 'user_password', 'user_status', 'user_rights', 'user_rights_pda','user_group', 'user_phone', 'user_token', 'socket_id', 'created_at','updated_at','deleted_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }


    /**
     * 一对一关联用户分组名称
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function  usergroup() {

        return $this->hasOne(AdminUserGruop::class, 'uid', 'id');

    }
}
