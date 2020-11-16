<?php

namespace App\Http\Controllers;

use App\SiswaReg;
use Illuminate\Http\Request;
use DB;
use Session;
use Storage;

class ProfileController extends Controller
{
    public function index()
    {
        if (Session::get('role') == 'Pembimbing') {
            $data = DB::table('ms_users')
                ->join('ms_pembimbing', 'ms_pembimbing.id_pembimbing', '=', 'ms_users.id_pembimbing')
                ->where('id_user', Session::get('id_user'))
                ->get();
        } else if (Session::get('role') == 'Siswa') {
            $data = DB::table('ms_users')
                ->join('ms_siswa', 'ms_siswa.nis_siswa', '=', 'ms_users.id_siswa_detail')
                ->join('ms_tempat_prakerin', 'ms_siswa.id_tempat_prakerin', '=', 'ms_tempat_prakerin.id_tempat_prakerin')
                ->where('id_user', Session::get('id_user'))
                ->get();
        } else {
            $data = DB::table('ms_users')
                ->where('id_user', Session::get('id_user'))
                ->get();
        }
        return view('pages.profile', ['data' => $data]);
    }

    public function save_profile(Request $request)
    {
        if ($request->hasFile('image')) {
            $extension = $request->file('image')->extension();

            if (Session::get('role') == 'Siswa') {
                $imgbefore = $this->cek_image_siswa(Session::get('nis'))->img_siswa;
                if ($imgbefore != 'default.png') {
                    unlink(storage_path('app/public/siswa/' . $imgbefore));
                }

                $imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
                Storage::putFileAs('public/siswa', $request->file('image'), $imgname);

                DB::table('ms_siswa')
                    ->where('nis_siswa', Session::get('nis'))
                    ->update([
                        'img_siswa' => $imgname
                    ]);
            } else {
                $imgbefores = $this->cek_image_pembimbing(Session::get('id_pembimbing'))->img_pembimbing;
                if ($imgbefores != 'default.png') {
                    unlink(storage_path('app/public/pembimbing/' . $imgbefores));
                }

                $imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
                Storage::putFileAs('public/pembimbing', $request->file('image'), $imgname);

                DB::table('ms_pembimbing')
                    ->where('id_pembimbing', Session::get('id_pembimbing'))
                    ->update([
                        'img_pembimbing' => $imgname
                    ]);
            }
        }
        $user = SiswaReg::find(Session::get('id_user'));
        $user->email = $request->post('email');
        $user->password = $request->post('password');
        $update = $user->save();

        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function cek_image_siswa($id)
    {
        return DB::table('ms_siswa')->where('nis_siswa', $id)->first();
    }

    public function cek_image_pembimbing($id)
    {
        return DB::table('ms_pembimbing')->where('id_pembimbing', $id)->first();
    }
}
