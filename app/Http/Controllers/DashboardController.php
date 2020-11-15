<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Dashboard;
use DB;
use Session;
use App\LaporanPrakerin;
use App\JurnalHarian;

class DashboardController extends Controller
{
    function index()
    {
        $dash = new Dashboard();
        $data['pembimbing'] = $dash->j_pembimbing();
        $data['siswa'] = $dash->j_siswa();
        $data['tempat'] = $dash->j_tempat();
        $data['user'] = $dash->j_user();
        $data['monitoring'] = $dash->monitoring();
        if (Session::get('role') == 'Siswa') {
            $data['jJurnal'] = JurnalHarian::where('nis_siswa', Session::get('nis'))->count();
            $data['jAcc'] = JurnalHarian::where('nis_siswa', Session::get('nis'))->where('is_valid', 1)->count();
            $data['jBelum'] = JurnalHarian::where('nis_siswa', Session::get('nis'))->where('is_valid', '!=', 1)->count();
            $data['sLaporan'] = LaporanPrakerin::where('nis_siswa', Session::get('nis'))->first();
        }
        return view('pages.dashboard', $data);
    }

    public function get_data()
    {
        $data = [];
        for ($i = 1; $i < 13; $i++) {
            if (Session::get('role') == 'Pembimbing') {
                $data[] = DB::table('tb_monitoring')
                    ->whereMonth('tgl_monitoring', '=', $i)
                    ->whereYear('tgl_monitoring', '=', date('Y'))
                    ->where('id_user', Session::get('id_user'))
                    ->count();
            } else {
                $data[] = DB::table('tb_monitoring')
                    ->whereMonth('tgl_monitoring', '=', $i)
                    ->whereYear('tgl_monitoring', '=', date('Y'))
                    ->count();
            }
        }
        return [
            'mnt'  => $data
        ];
    }
}
