<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CainiaoConfig extends Model
{
    use HasFactory;

    protected $table = 'cainiao_config';

    protected $primaryKey = 'id';

    public    $timestamps = false;

    protected $fillable = ['id', 'key'];

    public function Setmd5Info($content) {

        $keyInfo = self::where('id', '1')->first();
        //加密需要16 字符二进制格式
        return urlencode(base64_encode(md5($content.$keyInfo->key, true)));
    }

}
