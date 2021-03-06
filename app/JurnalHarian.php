<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;
use Session;

class JurnalHarian extends Model
{
    protected $table = 'tb_jurnal';
    protected $primaryKey = 'id_jurnal';
    public $timestamps = null;

    public function getData($s, $m)
    {
        if (Session::get('role') == 'Pembimbing' || Session::get('role') == 'Admin') {
            $data = DB::table('tb_jurnal')
                ->join('ms_siswa', 'tb_jurnal.nis_siswa', '=', 'ms_siswa.nis_siswa')
                ->join('ms_tempat_prakerin', 'ms_siswa.id_tempat_prakerin', '=', 'ms_tempat_prakerin.id_tempat_prakerin')
                ->where('ms_siswa.id_tempat_prakerin', $s)
                ->whereMonth('tgl_jurnal', date('m', strtotime($m)))
                ->whereYear('tgl_jurnal', date('Y', strtotime($m)))
                ->get();
        } else {
            $data = DB::table('tb_jurnal')
                ->join('ms_siswa', 'tb_jurnal.nis_siswa', '=', 'ms_siswa.nis_siswa')
                ->join('ms_tempat_prakerin', 'ms_siswa.id_tempat_prakerin', '=', 'ms_tempat_prakerin.id_tempat_prakerin')
                ->where('tb_jurnal.nis_siswa', Session::get('nis'))
                ->get();
        }
        return $data;
    }

    public function lastJurnal()
    {
        if (Session::get('role') == 'Siswa') {
            if ($this->cek_last() == null) {
                return 'Belum';
            } else {
                $cek = $this->cek_last()->tgl_jurnal;

                if ($cek == date('Y-m-d')) {
                    return 'Sudah';
                } else {
                    return 'Belum';
                }
            }
        }
        return null;
    }

    public function get_siswa($id)
    {
        return DB::table('ms_siswa')->where('id_tempat_prakerin', $id)->get();
    }

    public function JurnalDate($nis, $first, $last)
    {
        return DB::table('tb_jurnal')->where('nis_siswa', $nis)->where('is_valid', 1)->whereBetween('tgl_jurnal', [$first, $last])->get();
    }

    public function JurnalSiswa($nis)
    {
        return DB::table('ms_siswa')->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'ms_siswa.id_tempat_prakerin')->where('nis_siswa', $nis)->get();
    }

    public function cek_last()
    {
        return DB::table('tb_jurnal')
            ->where('nis_siswa', Session::get('nis'))
            ->orderBy('tgl_jurnal', 'DESC')
            ->first();
    }
}
