<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\JurnalHarian;
use Session;

class JurnalController extends Controller
{
    public function index()
    {
        $jurnal = new JurnalHarian();
        $jurnals = $jurnal->getData();
        $last = $jurnal->lastJurnal();
        
        return view('pages.jurnal',['jurnal'=>$jurnals,'last'=>$last]);
    }

    public function add_jurnal(Request $request)
    {
        $jurnal = new JurnalHarian();
        $jurnal->nis_siswa = $request->input('nis_siswa');
        $jurnal->jam_masuk = $request->input('jam_masuk');
        $jurnal->jam_keluar= $request->input('jam_keluar');
        $jurnal->prosedur_kerja = $request->input('prosedur_kerja');
        $jurnal->kegiatan_kerja = $request->input('kegiatan_kerja');
        $jurnal->spesifikasi_bahan = $request->input('spesifikasi_bahan');
        $jurnal->tgl_jurnal = $request->input('tgl_jurnal');

        $insert = $jurnal->save();
        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }   
    }

    public function view_jurnal(Request $request)
    {
        return JurnalHarian::where('id_jurnal',$request->get('id'))->get();
    }

    public function edit_jurnal(Request $request)
    {
        $check = JurnalHarian::find($request->input('id_jurnal'));
        $check->jam_masuk = $request->input('jam_masuk');
        $check->jam_keluar= $request->input('jam_keluar');
        $check->prosedur_kerja = $request->input('prosedur_kerja');
        $check->kegiatan_kerja = $request->input('kegiatan_kerja');
        $check->spesifikasi_bahan = $request->input('spesifikasi_bahan');
        $check->tgl_jurnal = $request->input('tgl_jurnal');

        $update = $check->save();
        if ($update) {
            return 'success';
        } else {
            return 'error';
        }   
    }

    public function accept_jurnal(Request $request)
    {
        $acc = JurnalHarian::find($request->get('id'));
        $acc->is_valid = 1;
        $acc->id_pembimbing = Session::get('id_user');
        $cca = $acc->save();

        if ($cca) {
            return 'success';
        } else {
            return 'error';
        }
        
    }
}
