<?php

namespace App\Http\Controllers;

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
                ->select('nama_pembimbing as nama','no_telp_pembimbing as no','alamat_pembimbing as alamat','password','id_user','email','ms_pembimbing.id_pembimbing')
                ->join('ms_pembimbing','ms_pembimbing.id_pembimbing','=','ms_users.id_pembimbing')
                ->where('id_user',Session::get('id_user'))
                ->get();
        } else if (Session::get('role') == 'Siswa') {
            $data = DB::table('ms_users')
                ->select('nama_siswa as nama','telp_ortu as no','alamat_siswa as alamat','password','email','id_user','nis_siswa','detail_tempat')
                ->join('ms_siswa','ms_siswa.nis_siswa','=','ms_users.id_siswa_detail')
                ->join('ms_tempat_prakerin','ms_siswa.id_tempat_prakerin','=','ms_tempat_prakerin.id_tempat_prakerin')
                ->where('id_user',Session::get('id_user'))
                ->get();
        }else{
            $data = DB::table('ms_users')
                ->select('email','password')
                ->where('id_user',Session::get('id_user'))
                ->get();
        }
        return view('pages.profile',['data'=>$data]);
    }

    public function save_profile(Request $request)
    {
        if ($request->hasFile('image')) {
            $extension=$request->file('image')->extension();

            if (Session::get('role') == 'Siswa') {
                $imgbefore = $this->cek_image($request->input('id'))->img_siswa;
                if ($imgbefore != 'default.png') {unlink(storage_path('app/public/siswa/'.$imgbefore));}

                $imgname=rand(1,5000).'_'.date('dmyHis').'.'.$extension;
                Storage::putFileAs('public/siswa', $request->file('image'),$imgname);

               $updates = DB::table('ms_siswa')
                    ->where('nis_siswa',$request->input('id'))
                    ->update([
                        'img_siswa' => $imgname
                    ]);

            } else {
                $imgbefores = $this->cek_image($request->input('id'))->img_pembimbing;
                if ($imgbefore != 'default.png') {unlink(storage_path('app/public/pembimbing/'.$imgbefores));}

                $imgname=rand(1,5000).'_'.date('dmyHis').'.'.$extension;
                Storage::putFileAs('public/pembimbing', $request->file('image'),$imgname);

                $updates = DB::table('ms_pembimbing')
                    ->where('id_pembimbing',$request->input('id'))
                    ->update([
                        'img_pembimbing' => $imgname
                    ]);
            }
            

            $update = DB::table('ms_users')
                ->where('id_user',Session::get('id_user'))
                ->update([
                    'password' => $request->input('password')
                ]);
            
        }else{
            $update = DB::table('ms_users')
                ->where('id_user',Session::get('id_user'))
                ->update([
                    'password' => $request->input('password')
                ]);
        }

        if($update){
            return 'success';
        }else{  
            return 'error';
        }
    }

    public function cek_image($id)
    {
        $tabel = null; $i = null;
        if(Session::get('role') == 'Siswa'){$tabel = 'ms_siswa';$i = 'nis_siswa';}else{$tabel = 'ms_pembimbing'; $i = 'id_pembimbing';}
        return DB::table($tabel)->where($i,$id)->first();
    }
}
