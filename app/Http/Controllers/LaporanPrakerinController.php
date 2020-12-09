<?php

namespace App\Http\Controllers;

use App\History;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\LaporanPrakerin;
use App\TempatPrakerin;
use Session;

class LaporanPrakerinController extends Controller
{
    public function index(Request $request)
    {
        $s = $request->get('search');
        if (Session::get('role') == 'Siswa') {
            $tempat = [];
            $laporan = LaporanPrakerin::leftJoin('ms_siswa', 'ms_siswa.nis_siswa', '=', 'tb_laporan_prakerin.nis_siswa')
                ->where('tb_laporan_prakerin.nis_siswa', Session::get('nis'))->get();
        } else {
            $tempat = TempatPrakerin::get();
            if ($s != null) {
                $laporan = LaporanPrakerin::leftJoin('ms_siswa', 'ms_siswa.nis_siswa', '=', 'tb_laporan_prakerin.nis_siswa')
                    ->where('ms_siswa.id_tempat_prakerin', $s)->get();
            } else {
                $laporan = [];
            }
        }
        return view('pages.laporan', ['laporan' => $laporan, 'tempat' => $tempat]);
    }

    public function add_laporan(Request $request)
    {
        $extension = $request->file('file_laporan')->extension();
        $pdfname = $request->input('nis_siswa') . '_' . 'Laporan' . '_' . date('dmyHis') . '.' . $extension;
        Storage::putFileAs('public/laporan', $request->file('file_laporan'), $pdfname);

        $laporan = new LaporanPrakerin();
        $data = array();
        $data['nis_siswa'] = $request->input('nis_siswa');
        $data['judul_laporan'] = $request->input('judul_laporan');
        $data['file_laporan'] = $pdfname;
        $data['tgl_laporan'] = date('Y-m-d');

        $proses = $laporan->UploadLaporan($data);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Mengunggah File Laporan Prakerin");

        if ($proses) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_laporan(Request $request)
    {
        $data = LaporanPrakerin::where('id_laporan', $request->get('id'))->first();

        return json_encode('storage/laporan/' . $data->file_laporan);
    }

    public function accept_laporan(Request $request)
    {
        $laporan = new LaporanPrakerin();
        $data = array();
        $data['lp_valid'] = 1;
        $data['id_pembimbing'] = Session::get('id_user');

        $proses = $laporan->acceptLaporan($request->get('id'), $data);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menyetujui Laporan Prakerin Siswa");

        if ($proses) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function reject_laporan(Request $request)
    {
        $check = LaporanPrakerin::find($request->get('id'));
        $check->lp_valid = 2;
        $check->id_pembimbing = Session::get('id_user');

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menolak Laporan Prakerin Siswa");

        $upd =  $check->save();
        if ($upd) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function reset_laporan(Request $request)
    {
        $cheks = LaporanPrakerin::find($request->get('id'));
        $cheks->lp_valid = 0;
        $cheks->id_pembimbing = null;

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Mengembalikan Status Laporan Prakerin Siswa");

        $res = $cheks->save();
        if ($res) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function getting_laporan(Request $request)
    {
        return LaporanPrakerin::where('id_laporan', $request->get('id'))->get();
    }

    public function update_laporan(Request $request)
    {
        $pdfbefore = $this->check_pdf()->file_laporan;
        $del = unlink(storage_path('app/public/laporan/' . $pdfbefore));
        if ($del) {
            $extension = $request->file('file_laporan')->extension();
            $pdfname = Session::get('nis') . '_' . 'Laporan' . '_' . date('dmyHis') . '.' . $extension;
            Storage::putFileAs('public/laporan', $request->file('file_laporan'), $pdfname);

            $update = LaporanPrakerin::find($this->check_pdf()->id_laporan);
            $update->judul_laporan = $request->input('judul_laporan');
            $update->tgl_laporan = date('Y-m-d');
            $update->file_laporan = $pdfname;
            $update->lp_valid = 0;
            $update->id_pembimbing = null;
            $up = $update->save();

            $h = new History();
            $h->addHistory(Session::get('id_user'), "Mengunggah Ulang File Laporan Prakerin");

            if ($up) {
                return 'success';
            } else {
                return 'error';
            }
        }
    }

    public function check_pdf()
    {
        return LaporanPrakerin::where('nis_siswa', Session::get('nis'))->first();
    }
}
