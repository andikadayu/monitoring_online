<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class SiswaReg extends Model
{
    public function check_siswa($nis)
    {
        return DB::table('ms_siswa')->where('nis_siswa',$nis)->first();
    }

    public function check_user($nis)
    {
        return DB::table('ms_users')->where('id_siswa_detail',$nis)->first();
    }

    public function registrasi($data = array())
    {
        return DB::table('ms_users')->insert($data);
    }
}
