<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class History extends Model
{
    protected $table = 'tb_history';
    protected $primaryKey = 'id_history';
    public $timestamps = null;

    public function getHistory()
    {
        return DB::table('tb_history')
            ->leftJoin('ms_users', 'ms_users.id_user', '=', 'tb_history.id_user')
            ->leftJoin('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
            ->leftJoin('ms_siswa', 'ms_users.id_siswa_detail', '=', 'ms_siswa.nis_siswa')
            ->get();
    }

    public function getCetak($first, $last)
    {
        return DB::table('tb_history')
            ->leftJoin('ms_users', 'ms_users.id_user', '=', 'tb_history.id_user')
            ->leftJoin('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
            ->leftJoin('ms_siswa', 'ms_users.id_siswa_detail', '=', 'ms_siswa.nis_siswa')
            ->whereBetween('tb_history.tanggal', [$first, $last])
            ->get();
    }

    public function addHistory($id, $kegiatan)
    {
        DB::table('tb_history')
            ->insert([
                'id_user' => $id,
                'kegiatan' => $kegiatan,
                'tanggal' => Carbon::now()->format('Y-m-d H:i:s')
            ]);
    }
}
