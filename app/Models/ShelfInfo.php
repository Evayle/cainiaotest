<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShelfInfo extends Model
{
    use HasFactory;

    protected $table = 'cainiao_shelf_info';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = true;

    protected $fillable = ['id', 'order', 'area_id', 'area_name', 'status', 'status', 'created_at','updated_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }

    /**
     * 货架日志
     */
    public function  SetData($param){


        $data = $this->where('order', $param['order'])->first();

        return $data ? $data->update($param) : $this->create($param);

    }

}
