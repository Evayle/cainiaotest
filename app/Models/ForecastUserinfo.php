<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ForecastUserinfo extends Model
{
    use HasFactory;

    protected $table = 'cainiao_forecast_userinfo';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = true;

    protected $fillable = ['id', 'd_id', 'buyer_wangwangId', 'buyer_name', 'buyer_mobile', 'buyer_email', 'buyer_country', 'buyer_province', 'buyer_city', 'buyer_district', 'buyer_town', 'buyer_streetAddress', 'sender_wangwangId', 'sender_name', 'sender_shopName', 'mobile', 'country', 'province', 'sender_city', 'sender_district', 'sender_town', 'sender_streetAddress', 'created_at' ,'updated_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
