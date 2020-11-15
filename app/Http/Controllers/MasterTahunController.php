<?php

namespace App\Http\Controllers;

use App\History;
use Illuminate\Http\Request;
use DB;
use Session;

class MasterTahunController extends Controller
{
    public function index()
    {
        $tahun = DB::table('ms_tahun_ajaran')->get();
        return view('pages.tahun', ['tahun' => $tahun]);
    }

    public function add_tahun(Request $request)
    {
        $insert = DB::table('ms_tahun_ajaran')
            ->insert([
                'tahun_awal' => $request->input('tahun_awal'),
                'tahun_akhir' => $request->input('tahun_akhir')
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menambah Data Tahun Ajaran");

        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_tahun(Request $request)
    {
        $data = DB::table('ms_tahun_ajaran')
            ->where('id_tahun_ajaran', $request->get('id'))
            ->get();
        return $data;
    }

    public function update_tahun(Request $request)
    {
        $update = DB::table('ms_tahun_ajaran')
            ->where('id_tahun_ajaran', $request->input('id_tahun_ajaran'))
            ->update([
                'tahun_awal' => $request->input('tahun_awal'),
                'tahun_akhir' => $request->input('tahun_akhir')
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Merubah Data Tahun Ajaran");

        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function delete_tahun(Request $request)
    {
        $delete = DB::table('ms_tahun_ajaran')
            ->where('id_tahun_ajaran', $request->get('id'))
            ->delete();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menghapus Data Tahun Ajaran");

        if ($delete < 0) {
            return 'error';
        } else {
            return 'success';
        }
    }
}
