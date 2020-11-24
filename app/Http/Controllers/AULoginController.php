<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Session;
use Auth;

class AULoginController extends Controller
{
	function index()
	{
		if (Session::get('is_login') == true) {
			return redirect('dashboard');
		} else {
			return view('login');
		}
	}

	function post_login(Request $request)
	{
		$user = DB::table('ms_users')->where('email', $request->input('email'))->first();
		$condition = false;

		if ($user != null) {
			if ($user->email == $request->input('email') && $user->password == $request->input('password')) {
				$condition = true;
			}
		}

		if ($condition) {
			Session::put('is_login', true);
			Session::put('id_user', $user->id_user);
			if ($user->role == 'Pembimbing') {
				$bim = $this->cek_pembimbing($user->id_pembimbing);
				Session::put('id_pembimbing', $bim->id_pembimbing);
				Session::put('nama_user', $bim->nama_pembimbing);
				Session::put('role', $user->role);
				Session::put('photo', $bim->img_pembimbing);
			} else if ($user->role == 'Siswa') {
				$siswa = $this->cek_siswa($user->id_siswa_detail);
				Session::put('nama_user', $siswa->nama_siswa);
				Session::put('role', $user->role);
				Session::put('photo', $siswa->img_siswa);
				Session::put('nis', $siswa->nis_siswa);
			} else {
				Session::put('nama_user', 'Administrator');
			}
			Session::put('role', $user->role);
			return 'success';
		} else {
			return "error";
		}
	}

	function logout()
	{
		Auth::logout();
		Session::flush();
		return redirect('login');
	}

	public function cek_siswa($id)
	{
		return DB::table('ms_siswa')->where('nis_siswa', $id)->first();
	}

	public function cek_pembimbing($id)
	{
		return DB::table('ms_pembimbing')->where('id_pembimbing', $id)->first();
	}
}
