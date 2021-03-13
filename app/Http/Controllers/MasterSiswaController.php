<?php

namespace App\Http\Controllers;

use App\Helpers\PhoneHelper;
use App\History;
use Illuminate\Http\Request;
use DB;
use Storage;
use Session;

class MasterSiswaController extends Controller
{
	public function index(Request $request)
	{
		$s = $request->get('search');
		$kelas = DB::table('ms_kelas')->get();
		$tempat = DB::table('ms_tempat_prakerin')->get();
		if ($s != null) {
			$siswa = DB::table('ms_siswa')
				->select('nis_siswa', 'nama_siswa', 'telp_ortu', 'detail_kelas', 'detail_tempat')
				->join('ms_kelas', 'ms_kelas.id_kelas', '=', 'ms_siswa.id_kelas')
				->leftJoin('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'ms_siswa.id_tempat_prakerin')
				->where('ms_siswa.id_tempat_prakerin', $s)
				->get();
		} else {
			$siswa = [];
		}
		return view('pages.siswa', [
			'kelas' => $kelas,
			'tempat' => $tempat,
			'siswa' => $siswa,
			's' => $s
		]);
	}

	public function add_siswa(Request $request)
	{
		if ($request->hasFile('img_siswa')) {
			$extension = $request->file('img_siswa')->extension();
			$imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
			Storage::putFileAs('public/siswa', $request->file('img_siswa'), $imgname);
		} else {
			$imgname = "default.png";
		}
		$insert = DB::table('ms_siswa')
			->insert([
				'nis_siswa' => $request->input('nis_siswa'),
				'nama_siswa' => $request->input('nama_siswa'),
				'tgl_lahir_siswa' => $request->input('tgl_lahir_siswa'),
				'agama_siswa' => $request->input('agama_siswa'),
				'jenis_kelamin_siswa' => $request->input('jenis_kelamin_siswa'),
				'alamat_siswa' => $request->input('alamat_siswa'),
				'nama_ortu' => $request->input('nama_ortu'),
				'telp_ortu' => PhoneHelper::phoneNumber($request->input('telp_ortu')),
				'id_kelas' => $request->input('id_kelas'),
				'id_tempat_prakerin' => $request->input('id_tempat_prakerin'),
				'img_siswa' => $imgname
			]);

		$h = new History();
		$h->addHistory(Session::get('id_user'), "Menambah Data Siswa");

		if ($insert) {
			return 'success';
		} else {
			return 'error';
		}
	}

	public function get_siswa(Request $request)
	{
		$data = DB::table('ms_siswa')->where('nis_siswa', $request->get('id'))->get();
		return $data;
	}

	public function update_siswa(Request $request)
	{
		if ($request->hasFile('img_siswa')) {
			$imgbefore = $this->cek_image($request->input('nis_siswa'))->img_siswa;
			if ($imgbefore != 'default.png') {
				unlink(storage_path('app/public/siswa/' . $imgbefore));
			}

			$extension = $request->file('img_siswa')->extension();
			$imgname = rand(1, 5000) . '_' . date('dmyHis') . '.' . $extension;
			Storage::putFileAs('public/siswa', $request->file('img_siswa'), $imgname);

			$update = DB::table('ms_siswa')
				->where('nis_siswa', $request->input('nis_siswa'))
				->update([
					'nama_siswa' => $request->input('nama_siswa'),
					'tgl_lahir_siswa' => $request->input('tgl_lahir_siswa'),
					'agama_siswa' => $request->input('agama_siswa'),
					'jenis_kelamin_siswa' => $request->input('jenis_kelamin_siswa'),
					'alamat_siswa' => $request->input('alamat_siswa'),
					'nama_ortu' => $request->input('nama_ortu'),
					'telp_ortu' => PhoneHelper::phoneNumber($request->input('telp_ortu')),
					'id_kelas' => $request->input('id_kelas'),
					'id_tempat_prakerin' => $request->input('id_tempat_prakerin'),
					'img_siswa' => $imgname
				]);
		} else {
			$update = DB::table('ms_siswa')
				->where('nis_siswa', $request->input('nis_siswa'))
				->update([
					'nama_siswa' => $request->input('nama_siswa'),
					'tgl_lahir_siswa' => $request->input('tgl_lahir_siswa'),
					'agama_siswa' => $request->input('agama_siswa'),
					'jenis_kelamin_siswa' => $request->input('jenis_kelamin_siswa'),
					'alamat_siswa' => $request->input('alamat_siswa'),
					'nama_ortu' => $request->input('nama_ortu'),
					'telp_ortu' => PhoneHelper::phoneNumber($request->input('telp_ortu')),
					'id_kelas' => $request->input('id_kelas'),
					'id_tempat_prakerin' => $request->input('id_tempat_prakerin')
				]);
		}

		$h = new History();
		$h->addHistory(Session::get('id_user'), "Merubah Data Siswa");

		if ($update) {
			return 'success';
		} else {
			return 'error';
		}
	}

	public function delete_siswa(Request $request)
	{
		$imgbefore = $this->cek_image($request->get('id'))->img_siswa;
		if ($imgbefore != 'default.png') {
			unlink(storage_path('app/public/siswa/' . $imgbefore));
		}

		$delete = DB::table('ms_siswa')
			->where('nis_siswa', $request->get('id'))
			->delete();

		$cek = $this->cek_user($request->get('id'));

		if ($cek != null || $cek != "") {
			$deleted = DB::table('ms_users')
				->where('id_siswa_detail', $request->get('id'))
				->delete();
		}

		$h = new History();
		$h->addHistory(Session::get('id_user'), "Menghapus Data Siswa");

		if ($delete < 0) {
			return 'error';
		} else {
			return 'success';
		}
	}

	public function cek_user($id)
	{
		return DB::table('ms_users')->where('id_siswa_detail', $id)->first();
	}

	public function cek_image($id)
	{
		return DB::table('ms_siswa')->where('nis_siswa', $id)->first();
	}
}
