<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class DashboardController extends Controller
{
    function index()
    {
    	return view('pages.dashboard');
    }

    public function get_data()
    {
        $data['pembimbing'] = DB::table('ms_pembimbing')->count();
        $data['siswa'] = DB::table('ms_siswa')->count();
        $data['tempat'] = DB::table('ms_tempat_prakerin')->count();
        $data['user'] = DB::table('ms_users')->count();

        return $data;
    }
}
