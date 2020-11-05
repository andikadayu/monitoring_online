<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class LaporanPrakerin extends Model
{
    protected $table = 'tb_laporan_prakerin';

    public function UploadLaporan($data = array())
    {
        return DB::table('tb_laporan_prakerin')->insert($data);
    }

    public function acceptLaporan($id,$data = array())
    {
        return DB::table('tb_laporan_prakerin')->where('id_laporan',$id)->update($data);
    }
}
