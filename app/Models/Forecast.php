<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Forecast extends Model
{
    use HasFactory;

    protected $table = 'cainiao_forecast';

    /**
     * 处理时间格式
     */

    protected $primaryKey = 'id';

    public    $timestamps = true;

    protected $fillable = ['id', 'mailNo', 'logisticsOrderCode', 'two_logisticsOrderCode', 'parcel_weight', 'mailNo', 'long', 'width', 'bigBagId', 'height', 'weight','trackingNumber', 'parcel_weight', 'conso_order_query', 'deliveryType', 'consoType', 'isSplitConsign', 'isLastPackage', 'packageQuantity', 'tradeOrderId', 'dereRecogCode', 'user_phone', 'user_name', 'shop_name', 'order_status', 'in_time', 'over_time', 'created_at' ,'updated_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }

    public function islogisticsOrderCode($logisticsOrderCode) {

        return $this->where('logisticsOrderCode', $logisticsOrderCode) ->select('id')->first();
    }

    /**
     * 关联订单信息
     */
    public function  shopinfo(){

        return $this->hasOne(ForecastShop::class, 'd_id', 'id');
    }

    /**
     * 关联用户详情
     */
    public function  userinfo(){

        return $this->hasOne(ForecastUserinfo::class, 'd_id', 'id');
    }

    /**
     * 关联日志
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function  orderlog(){

        return $this->hasMany(CainiaoOrderLog::class, 'order', 'logisticsOrderCode');

    }

    /**
     * 关联地址
     */
    public function storename(){

       return $this->hasOne(Store::class, 'cainiao_match', 'store_name');
    }

    /**
     * 关联出库上架库区
     */
    public function areainfo(){

        return  $this->hasOne(ShelfInfo::class, 'order', 'logisticsOrderCode');

    }

    /**
     * 关联打印
     */
    public function printinfo(){

        return  $this->hasOne(CainiaoPrintInfo::class, 'order', 'trackingNumber');

    }


}
