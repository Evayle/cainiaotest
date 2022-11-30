<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class ProcessPodcast implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $data;    //接受的数据
    public $tries = 2;  //最大尝试次数
    public $timeout = 2;    //最长超时时间


    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        //
        $this->data = $data;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {

        sleep(3);
        Log::info("记录2条日志");
//        $rand = mt_rand(1,2);
//        if ($rand == 2){
//            //等待三秒，抛出异常
//            sleep(3);
//            throw new Exception('任务失败');
//        }
//        sleep(3);
//        Log::info("记录一条日志");
//        var_dump($rand,$this->data->data);
    }
}
