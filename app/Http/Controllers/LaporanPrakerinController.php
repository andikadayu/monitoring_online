<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Storage;
use App\LaporanPrakerin;
use Session;

class LaporanPrakerinController extends Controller
{
    public function index()
    {
        if (Session::get('role') == 'Siswa') {
            $laporan = LaporanPrakerin::where('nis_siswa',Session::get('nis'))->get();
        } else {
            $laporan = LaporanPrakerin::get();
        }
        return view('pages.laporan',['laporan'=>$laporan]);
    }

    public function add_laporan(Request $request)
    {
        $extension=$request->file('file_laporan')->extension();
        $pdfname=$request->input('nis_siswa').'_'.'Laporan'.'_'.date('dmyHis').'.'.$extension;
        Storage::putFileAs('public/laporan', $request->file('file_laporan'),$pdfname);
        
        $laporan = new LaporanPrakerin();
        $data = array();
        $data['nis_siswa'] = $request->input('nis_siswa');
        $data['judul_laporan'] = $request->input('judul_laporan');
        $data['file_laporan'] = $pdfname;
        $data['tgl_laporan'] = $request->input('tgl_laporan');

        $proses = $laporan->UploadLaporan($data);

        if ($proses) {
            return 'success';
        } else {
            return 'error';
        } 
    }

    public function get_laporan(Request $request)
    {
        $data=LaporanPrakerin::where('id_laporan',$request->get('id'))->first();

        return json_encode('storage/app/public/laporan/'.$data->file_laporan);

    }

    public function accept_laporan(Request $request)
    {
        $laporan = new LaporanPrakerin();
        $data = array();
        $data['lp_valid'] = 1;
        $data['id_pembimbing'] = Session::get('id_user');

        $proses = $laporan->acceptLaporan($request->get('id'),$data);
        if ($proses) {
            return 'success';
        } else {
            return 'error';
        }
    }
}
