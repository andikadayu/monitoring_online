<?php

namespace App\Http\Controllers;

use App\History;
use Illuminate\Http\Request;
use DB;
use Session;

class TempatPrakerinController extends Controller
{
    public function index()
    {
        $tempat = DB::table('ms_tempat_prakerin')->get();
        return view('pages.tempat', ['tempat' => $tempat]);
    }

    public function add_tempat(Request $request)
    {
        $insert = DB::table('ms_tempat_prakerin')
            ->insert([
                'detail_tempat' => $request->input('detail_tempat'),
                'alamat_tempat' => $request->input('alamat_tempat'),
                'telp_kantor'   => $request->input('telp_kantor'),
                'email_kantor'  => $request->input('email_kantor')
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menambah Data Tempat Prakerin");

        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_tempat(Request $request)
    {
        $data = DB::table('ms_tempat_prakerin')
            ->where('id_tempat_prakerin', $request->get('id'))
            ->get();
        return $data;
    }

    public function update_tempat(Request $request)
    {
        $update = DB::table('ms_tempat_prakerin')
            ->where('id_tempat_prakerin', $request->input('id_tempat_prakerin'))
            ->update([
                'detail_tempat' => $request->input('detail_tempat'),
                'alamat_tempat' => $request->input('alamat_tempat'),
                'telp_kantor'   => $request->input('telp_kantor'),
                'email_kantor'  => $request->input('email_kantor')
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Merubah Data Tempat Prakerin");

        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function delete_tempat(Request $request)
    {
        $delete = DB::table('ms_tempat_prakerin')
            ->where('id_tempat_prakerin', $request->get('id'))
            ->delete();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menghapus Data Tempat Prakerin");

        if ($delete < 0) {
            return 'error';
        } else {
            return 'success';
        }
    }
}
