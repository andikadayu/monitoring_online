<?php

namespace App\Http\Controllers;

use App\Helpers\PhoneHelper;
use App\History;
use Illuminate\Http\Request;
use DB;
use Storage;
use Session;

class MasterGuruController extends Controller
{
    public function index()
    {
        $guru = DB::table('ms_guru')->get();
        return view('pages.guru', ['guru' => $guru]);
    }

    public function add_guru(Request $request)
    {
        if ($request->hasFile('img_guru')) {
            $extension = $request->file('img_guru')->extension();
            $imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
            Storage::putFileAs('public/guru', $request->file('img_guru'), $imgname);
        } else {
            $imgname = "default.png";
        }

        $insert = DB::table('ms_guru')
            ->insert([
                'nik_guru' => $request->input('nik_guru'),
                'nama_guru' => $request->input('nama_guru'),
                'jenis_kelamin_guru' => $request->input('jenis_kelamin_guru'),
                'tgl_lahir_guru' => $request->input('tgl_lahir_guru'),
                'alamat_guru' => $request->input('alamat_guru'),
                'agama_guru' => $request->input('agama_guru'),
                'no_telp_guru' => PhoneHelper::phoneNumber($request->input('no_telp_guru')),
                'email_guru' => $request->input('email_guru'),
                'img_guru' => $imgname
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menambah Data Guru");


        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_guru(Request $request)
    {
        $data = DB::table('ms_guru')
            ->where('id_guru', $request->get('id'))
            ->get();
        return $data;
    }

    public function update_guru(Request $request)
    {
        $imgbefore = $this->cek_image($request->input('id_guru'))->img_guru;

        if ($request->hasFile('img_guru')) {
            if ($imgbefore != 'default.png') {
                unlink(storage_path('app/public/guru/' . $imgbefore));
            }

            $extension = $request->file('img_guru')->extension();
            $imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
            Storage::putFileAs('public/guru', $request->file('img_guru'), $imgname);

            $update = DB::table('ms_guru')
                ->where('id_guru', $request->input('id_guru'))
                ->update([
                    'nik_guru' => $request->input('nik_guru'),
                    'nama_guru' => $request->input('nama_guru'),
                    'jenis_kelamin_guru' => $request->input('jenis_kelamin_guru'),
                    'tgl_lahir_guru' => $request->input('tgl_lahir_guru'),
                    'alamat_guru' => $request->input('alamat_guru'),
                    'agama_guru' => $request->input('agama_guru'),
                    'no_telp_guru' => PhoneHelper::phoneNumber($request->input('no_telp_guru')),
                    'email_guru' => $request->input('email_guru'),
                    'img_guru' => $imgname
                ]);
        } else {
            $update = DB::table('ms_guru')
                ->where('id_guru', $request->input('id_guru'))
                ->update([
                    'nik_guru' => $request->input('nik_guru'),
                    'nama_guru' => $request->input('nama_guru'),
                    'jenis_kelamin_guru' => $request->input('jenis_kelamin_guru'),
                    'tgl_lahir_guru' => $request->input('tgl_lahir_guru'),
                    'alamat_guru' => $request->input('alamat_guru'),
                    'agama_guru' => $request->input('agama_guru'),
                    'no_telp_guru' => PhoneHelper::phoneNumber($request->input('no_telp_guru')),
                    'email_guru' => $request->input('email_guru')
                ]);
        }

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Merubah Data Guru");

        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function cek_image($id)
    {
        return DB::table('ms_guru')
            ->where('id_guru', $id)
            ->first();
    }

    public function delete_guru(Request $request)
    {
        $imgbefore = $this->cek_image($request->get('id'))->img_guru;
        if ($imgbefore != 'default.png') {
            unlink(storage_path('app/public/guru/' . $imgbefore));
        }

        $delete = DB::table('ms_guru')
            ->where('id_guru', $request->get('id'))
            ->delete();

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menghapus Data Guru");

        if ($delete < 0) {
            return 'error';
        } else {
            return 'success';
        }
    }
}
