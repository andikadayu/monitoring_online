<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class MasterAdminController extends Controller
{
    public function index()
    {
        $user=DB::table("ms_users")
            ->where('role','Admin')
            ->get();
        $siswa=DB::table('ms_users')
            ->join('ms_siswa','ms_siswa.nis_siswa','=','ms_users.id_siswa_detail')
            ->where('ms_users.role','Siswa')
            ->get();
        return view("pages.admin",["user"=>$user,"siswa"=>$siswa]);
    }

    public function add_admin(Request $request)
    {
        $insert=DB::table('ms_users')
            ->insert([
                'email' => $request->input('email'),
                'password' => $request->input('password'),
                'role' => 'Admin'
            ]);
        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function get_admin(Request $request)
    {
        $data=DB::table('ms_users')->where('id_user',$request->get('id'))->get();
        return $data;
    }

    public function update_admin(Request $request)
    {
        $update=DB::table('ms_users')
            ->where('id_user',$request->input('id_user'))
            ->update([
                'email' => $request->input('email'),
                'password' => $request->input('password'),
                'role' => 'Admin'
            ]);
        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function update_user(Request $request)
    {
         $update=DB::table('ms_users')
            ->where('id_user',$request->input('id_user'))
            ->update([
                'email' => $request->input('email'),
                'password' => $request->input('password')
            ]);
        if ($update) {
            return 'success';
        } else {
            return 'error';
        }
    }

    public function delete_user(Request $request)
    {
         $delete=DB::table('ms_users')
            ->where('id_user',$request->get('id'))
            ->delete();
        if ($delete < 0) {
            return 'error';
        } else {
            return 'success';
        }
        
    }
}
