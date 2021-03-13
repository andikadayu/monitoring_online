<?php

namespace App\Http\Controllers;

use App\Helpers\PhoneHelper;
use App\History;
use Illuminate\Http\Request;
use DB;
use Storage;
use Session;

class MasterPembimbingController extends Controller
{
    public function index()
    {
        $pembimbing = DB::table('ms_pembimbing')->get();
        return view('pages.pembimbing', ['pembimbing' => $pembimbing]);
    }

    public function add_pembimbing(Request $request)
    {
        if ($request->hasFile('img_pembimbing')) {
            $extension = $request->file('img_pembimbing')->extension();
            $imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
            Storage::putFileAs('public/pembimbing', $request->file('img_pembimbing'), $imgname);
        } else {
            $imgname = "default.png";
        }

        $insert = DB::table('ms_pembimbing')
            ->insertGetId([
                'nama_pembimbing' => $request->input('nama_pembimbing'),
                'tgl_lahir_pembimbing' => $request->input('tgl_lahir_pembimbing'),
                'agama_pembimbing' => $request->input('agama_pembimbing'),
                'jenis_kelamin_pembimbing' => $request->input('jenis_kelamin_pembimbing'),
                'alamat_pembimbing' => $request->input('alamat_pembimbing'),
                'email_pembimbing' => $request->input('email_pembimbing'),
                'no_telp_pembimbing' => PhoneHelper::phoneNumber($request->input('no_telp_pembimbing')),
                'img_pembimbing' => $imgname
            ]);

        $insertt = DB::table('ms_users')
            ->insert([
                'email' => $request->input('email_pembimbing'),
                'password' => $request->input('password'),
                'role' => "Pembimbing",
                'id_pembimbing' => $insert
            ]);

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menambah Data Pembimbing");

        if ($insertt) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_pembimbing(Request $request)
    {
        $data = DB::table('ms_users')
            ->join('ms_pembimbing', 'ms_pembimbing.id_pembimbing', '=', 'ms_users.id_pembimbing')
            ->where('ms_users.id_pembimbing', $request->get('id'))
            ->get();
        return $data;
    }

    public function update_pembimbing(Request $request)
    {
        $imgbefore = $this->cek_image($request->input('id_pembimbing'))->img_pembimbing;
        if ($request->hasFile('img_pembimbing')) {
            if ($imgbefore != 'default.png') {
                unlink(storage_path('app/public/pembimbing/' . $imgbefore));
            }

            $extension = $request->file('img_pembimbing')->extension();
            $imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
            Storage::putFileAs('public/pembimbing', $request->file('img_pembimbing'), $imgname);

            $update = DB::table('ms_pembimbing')
                ->where('id_pembimbing', $request->input('id_pembimbing'))
                ->update([
                    'nama_pembimbing' => $request->input('nama_pembimbing'),
                    'tgl_lahir_pembimbing' => $request->input('tgl_lahir_pembimbing'),
                    'agama_pembimbing' => $request->input('agama_pembimbing'),
                    'jenis_kelamin_pembimbing' => $request->input('jenis_kelamin_pembimbing'),
                    'alamat_pembimbing' => $request->input('alamat_pembimbing'),
                    'email_pembimbing' => $request->input('email_pembimbing'),
                    'no_telp_pembimbing' => PhoneHelper::phoneNumber($request->input('no_telp_pembimbing')),
                    'img_pembimbing' => $imgname
                ]);
            $updatet = DB::table('ms_users')
                ->where('id_pembimbing', $request->input('id_pembimbing'))
                ->update([
                    'email' => $request->input('email_pembimbing'),
                    'password' => $request->input('password')
                ]);
        } else {
            $update = DB::table('ms_pembimbing')
                ->where('id_pembimbing', $request->input('id_pembimbing'))
                ->update([
                    'nama_pembimbing' => $request->input('nama_pembimbing'),
                    'tgl_lahir_pembimbing' => $request->input('tgl_lahir_pembimbing'),
                    'agama_pembimbing' => $request->input('agama_pembimbing'),
                    'jenis_kelamin_pembimbing' => $request->input('jenis_kelamin_pembimbing'),
                    'alamat_pembimbing' => $request->input('alamat_pembimbing'),
                    'email_pembimbing' => $request->input('email_pembimbing'),
                    'no_telp_pembimbing' => PhoneHelper::phoneNumber($request->input('no_telp_pembimbing'))
                ]);
            $updatet = DB::table('ms_users')
                ->where('id_pembimbing', $request->input('id_pembimbing'))
                ->update([
                    'email' => $request->input('email_pembimbing'),
                    'password' => $request->input('password')
                ]);
        }

        $h = new History();
        $h->addHistory(Session::get('id_user'), "Merubah Data Pembimbing");

        if ($update || $updatet) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function cek_image($id)
    {
        return DB::table('ms_pembimbing')
            ->where('id_pembimbing', $id)
            ->first();
    }

    public function delete_pembimbing(Request $request)
    {
        $imgbefore = $this->cek_image($request->get('id'))->img_pembimbing;
        if ($imgbefore != 'default.png') {
            unlink(storage_path('app/public/pembimbing/' . $imgbefore));
        }
        $deleted = DB::table('ms_users')
            ->where('id_pembimbing', $request->get('id'))
            ->delete();

        $delete = DB::table('ms_pembimbing')
            ->where('id_pembimbing', $request->get('id'))
            ->delete();


        $h = new History();
        $h->addHistory(Session::get('id_user'), "Menghapus Data Pembimbing");

        if ($deleted < 0 || $delete < 0) {
            return 'error';
        } else {
            return 'success';
        }
    }
}
