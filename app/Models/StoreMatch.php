<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class StoreMatch extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'cainaio_receivingmatch';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = true;

    protected $fillable = ['id', 'cainiao_match', 'cainiao_match_chi', 'cainiao_transfer', 'cainiao_transfer_chi', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
