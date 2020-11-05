<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;

class MonitoringDetail extends Model
{
    protected $table = 'tb_monitoring_detail';
	protected $primaryKey = 'id_monitoring_detail';
	public $timestamps = null;

	public function getCetak($id)
	{
		return DB::table('tb_monitoring_detail')
			->join('ms_siswa','ms_siswa.nis_siswa','=','tb_monitoring_detail.nis_siswa')
			->where('id_monitoring',$id)
			->get();
	}
}
