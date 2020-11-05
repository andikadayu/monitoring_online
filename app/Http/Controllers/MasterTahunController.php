<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class MasterTahunController extends Controller
{
    public function index()
    {
        $tahun=DB::table('ms_tahun_ajaran')->get();
        return view('pages.tahun',['tahun'=>$tahun]);
    }

    public function add_tahun(Request $request)
    {
        $insert=DB::table('ms_tahun_ajaran')
            ->insert([
                'tahun_awal' => $request->input('tahun_awal'),
                'tahun_akhir'=> $request->input('tahun_akhir')
            ]);
        if ($insert) {
            return 'success';
        } else {
            return 'error';
        }
        
    }
    
    public function get_tahun(Request $request)
    {
        $data=DB::table('ms_tahun_ajaran')
            ->where('id_tahun_ajaran',$request->get('id'))
            ->get();
        return $data;
    }

    public function update_tahun(Request $request)
    {
        $update=DB::table('ms_tahun_ajaran')
            ->where('id_tahun_ajaran',$request->input('id_tahun_ajaran'))
            ->update([
                'tahun_awal' => $request->input('tahun_awal'),
                'tahun_akhir'=> $request->input('tahun_akhir')
            ]);
        
            if ($update) {
                return 'success';
            } else {
                return 'error';
            }
    }

    public function delete_tahun(Request $request)
    {
        $delete=DB::table('ms_tahun_ajaran')
            ->where('id_tahun_ajaran',$request->get('id'))
            ->delete();
        if ($delete < 0) {
            return 'error';
        } else {
            return 'success';
        }   
    }
}
