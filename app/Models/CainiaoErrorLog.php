<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CainiaoErrorLog extends Model
{
    use HasFactory;

    protected $table = 'cainiao_error_log';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = false;

    protected $fillable = ['id', 'type', 'type', 'date'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
