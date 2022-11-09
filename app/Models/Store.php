<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Store extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'cainiao_receivinglist';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'receiving_id';

    public    $timestamps = true;

    protected $fillable = ['receiving_id', 'cainiao_match', 'receiving_name', 'receiving_name_simple', 'receiving_address', 'type', 'latitude', 'longitude', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
