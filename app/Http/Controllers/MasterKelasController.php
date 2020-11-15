<?php

namespace App\Http\Controllers;

use App\History;
use Illuminate\Http\Request;
use DB;
use Session;

class MasterKelasController extends Controller
{
    public function index()
    {
        $kelas = DB::table('ms_kelas')
            ->join('ms_tahun_ajaran', 'ms_tahun_ajaran.id_tahun_ajaran', '=', 'ms_kelas.id_tahun_ajaran')
            ->join('ms_guru', 'ms_guru.id_guru', '=', 'ms_kelas.id_wali_kelas')
            ->get();
        $guru = DB::table('ms_guru')->get();
        $tahun = DB::table('ms_tahun_ajaran')->get();
        return view('pages.kelas', [
            'kelas' => $kelas,
            'guru' => $guru,
            'tahun' => $tahun
        ]);
    }

    public function add_kelas(Request $request)
    {
        $insert = DB::table('ms_kelas')
            ->insert([
                'detail_kelas' => $request->input('detail_kelas'),
                'id_tahun_ajaran' => $request->input('id_tahun_ajaran'),
                'id_wali_kelas' => $request->input('id_wali_kelas')
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menambah Data Kelas");

        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_kelas(Request $request)
    {
        $data = DB::table('ms_kelas')
            ->where('id_kelas', $request->get('id'))
            ->get();
        return $data;
    }

    public function update_kelas(Request $request)
    {
        $update = DB::table('ms_kelas')
            ->where('id_kelas', $request->input('id_kelas'))
            ->update([
                'detail_kelas' => $request->input('detail_kelas'),
                'id_tahun_ajaran' => $request->input('id_tahun_ajaran'),
                'id_wali_kelas' => $request->input('id_wali_kelas')
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Merubah Data Kelas");

        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function delete_kelas(Request $request)
    {
        $delete = DB::table('ms_kelas')
            ->where('id_kelas', $request->get('id'))
            ->delete();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menghapus Data Kelas");

        if ($delete < 0) {
            return 'error';
        } else {
            return 'success';
        }
    }
}
