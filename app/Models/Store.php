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

    protected $fillable = ['receiving_id', 'cainiao_match', 'receiving_name', 'receiving_name_simple', 'receiving_address','sort', 'type', 'latitude', 'area_id', 'longitude', 'created_at', 'updated_at', 'deleted_at'];

    /**
     * 设置时间格式几个人法兰克福国际'螺丝刀快件管理我快递费加绿茶
     */
    protected $dateFormat;

    protected function serializeDate(\DateTimeInterface $date){

        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }

    /**
     * 查询菜鸟标识
     */
    public static function  cainiao_match($param){

        $data =  self::where('receiving_address', $param)->select('cainiao_match')->first();

        return $data ? $data->cainiao_match : 'AYDTTT';
    }

    /**
     * 查询关联库区
     * @param $param
     * @return array
     */
    public function  area_infos($param){

        if(!$param) return false;

        $data =  self::where('cainiao_match', $param)->with(['areainfo' => function($query){

            $query->select('id', 'area_name');

        }])->select('area_id')->first();

        return  $data
            ? ['area_id' => $data->areainfo->id, 'area_name' => $data->areainfo->area_name]
            : null;
    }



    /**
     * 关联库区
     */
    public function areainfo(){

        return $this->hasOne(Area::class, 'id', 'area_id');
    }


}
