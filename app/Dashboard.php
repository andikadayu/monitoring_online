<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;
use Session;

class Dashboard extends Model
{
    public function j_pembimbing()
    {
        return DB::table('ms_pembimbing')->count();
    }

    public function j_siswa()
    {
        return DB::table('ms_siswa')->count();
    }

    public function j_tempat()
    {
        return DB::table('ms_tempat_prakerin')->count();
    }

    public function j_user()
    {
        return DB::table('ms_users')->count();
    }

    public function monitoring()
    {
        if (Session::get('role') == 'Pembimbing') {
            $data = DB::table('tb_monitoring')
                ->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
                ->join('ms_users', 'ms_users.id_user', '=', 'tb_monitoring.id_user')
                ->join('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
                ->where('tb_monitoring.id_user', Session::get('id_user'))
                ->get();
        } else {
            $data = DB::table('tb_monitoring')
                ->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
                ->join('ms_users', 'ms_users.id_user', '=', 'tb_monitoring.id_user')
                ->join('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
                ->get();
        }
        return $data;
    }
}
