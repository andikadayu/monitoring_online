<?php

namespace App\Http\Controllers;

use App\History;
use Illuminate\Http\Request;
use App\JurnalHarian;
use Session;
use App\TempatPrakerin;
use PDF;

class JurnalController extends Controller
{
    public function index(Request $request)
    {
        $jurnal = new JurnalHarian();
        $s = $request->get('search');
        $m = $request->get('month');
        $jurnals = $jurnal->getData($s, $m);
        $last = $jurnal->lastJurnal();
        $tempat = TempatPrakerin::get();
        return view('pages.jurnal', ['jurnal' => $jurnals, 'last' => $last, 's' => $s, 'm' => $m, 'tempat' => $tempat]);
    }

    public function add_jurnal(Request $request)
    {
        $jurnal = new JurnalHarian();
        $jurnal->nis_siswa = $request->input('nis_siswa');
        $jurnal->jam_masuk = $request->input('jam_masuk');
        $jurnal->jam_keluar = $request->input('jam_keluar');
        $jurnal->prosedur_kerja = $request->input('prosedur_kerja');
        $jurnal->kegiatan_kerja = $request->input('kegiatan_kerja');
        $jurnal->spesifikasi_bahan = $request->input('spesifikasi_bahan');
        $jurnal->tgl_jurnal = date('Y-m-d');

        $insert = $jurnal->save();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menambah Jurnal Harian");
        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function view_jurnal(Request $request)
    {
        return JurnalHarian::where('id_jurnal', $request->get('id'))->get();
    }

    public function edit_jurnal(Request $request)
    {
        $check = JurnalHarian::find($request->input('id_jurnal'));
        $check->jam_masuk = $request->input('jam_masuk');
        $check->jam_keluar = $request->input('jam_keluar');
        $check->prosedur_kerja = $request->input('prosedur_kerja');
        $check->kegiatan_kerja = $request->input('kegiatan_kerja');
        $check->spesifikasi_bahan = $request->input('spesifikasi_bahan');
        $check->is_valid = 0;

        $update = $check->save();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Mengubah Jurnal Harian");
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
        $acc->catatan = null;
        $cca = $acc->save();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menyetujui Jurnal Harian");

        if ($cca) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function reject_jurnal(Request $request)
    {
        $rcc = JurnalHarian::find($request->input('id_jurnal'));
        $catatan = "";

        foreach ($request->input('catatan') as $cat) {

            $catatan .= $cat . ', ';
        }

        $rcc->is_valid = 2;
        $rcc->id_pembimbing = Session::get('id_user');
        $rcc->catatan = $catatan;
        $ccr = $rcc->save();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menolak Jurnal Harian");

        if ($ccr) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function c_tempat(Request $request)
    {
        $siswa = new JurnalHarian();
        $data = $siswa->get_siswa($request->get('id'));
        foreach ($data as $key => $v) {
            echo "<option value='" . $v->nis_siswa . "'>" . "(" . $v->nis_siswa . ") " . $v->nama_siswa . "</option>";
        }
    }

    public function report_jurnal(Request $request)
    {
        $tanggal = $request->get('tgl_jurnal');
        $tgl = explode(" - ", $tanggal);
        $time1 = strtotime($tgl[0]);
        $newformat1 = date('Y-m-d', $time1);
        $time2 = strtotime($tgl[1]);
        $newformat2 = date('Y-m-d', $time2);
        $nis = $request->get('nis_siswa');
        $jurnal = new JurnalHarian();

        $pdf = PDF::loadview('component.lapor_jurnal', [
            'jurnal' => $jurnal->JurnalDate($nis, $newformat1, $newformat2),
            'siswa' => $jurnal->JurnalSiswa($nis),
            'first' => $newformat1,
            'last' => $newformat2
        ]);
        return $pdf->stream();
    }
}
