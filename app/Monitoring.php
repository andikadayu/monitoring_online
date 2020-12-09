<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;
use Session;

class Monitoring extends Model
{
	protected $table = 'tb_monitoring';
	protected $primaryKey = 'id_monitoring';
	public $timestamps = null;

	public function get_siswa($tempat, $tahun)
	{
		return DB::table('ms_siswa')
			->join('ms_kelas', 'ms_kelas.id_kelas', '=', 'ms_siswa.id_kelas')
			->join('ms_tahun_ajaran', 'ms_tahun_ajaran.id_tahun_ajaran', '=', 'ms_kelas.id_tahun_ajaran')
			->where('id_tempat_prakerin', $tempat)
			->where('ms_kelas.id_tahun_ajaran', $tahun)
			->get();
	}

	public function getMonitoring($m)
	{
		if (Session::get('role') == 'Admin') {
			return DB::table('tb_monitoring')
				->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
				->whereMonth('tgl_monitoring', date('m', strtotime($m)))
				->whereYear('tgl_monitoring', date('Y', strtotime($m)))
				->get();
		} else {
			return DB::table('tb_monitoring')
				->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
				->whereMonth('tgl_monitoring', date('m', strtotime($m)))
				->whereYear('tgl_monitoring', date('Y', strtotime($m)))
				->where('id_user', Session::get('id_user'))
				->get();
		}
	}

	public function getCetak($id)
	{
		return DB::table('tb_monitoring')
			->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
			->join('ms_users', 'ms_users.id_user', '=', 'tb_monitoring.id_user')
			->join('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
			->where('id_monitoring', $id)
			->get();
	}
}
