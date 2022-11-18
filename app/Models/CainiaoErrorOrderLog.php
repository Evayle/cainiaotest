<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CainiaoErrorOrderLog extends Model
{
    use HasFactory;

    protected $table = 'carniao_order_error_log';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = true;

    protected $fillable = ['id', 'order', 'content', 'cainiao_api', 'created_at' ,'updated_at'];

    /**
     * 设置时间格式
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
