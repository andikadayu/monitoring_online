<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\SiswaReg;

class RegisterController extends Controller
{
    public function index()
    {
        return view('register');
    }

    public function post_register(Request $request)
    {
        $reg = new SiswaReg();
        
        $checking = $reg->check_siswa($request->input('id_siswa_detail'));

        if($checking != null){
            $check = $reg->check_user($request->input('id_siswa_detail'));
            if($check == null){
                $data = array();
                $data['email'] = $request->input('email');
                $data['password'] = $request->input('password');
                $data['role'] = "Siswa";
                $data['id_siswa_detail'] = $request->input('id_siswa_detail');

                $insert  = $reg->registrasi($data);

                if ($insert) {
                    echo json_encode(array(
                        'RESULT' => 'success',
                        'msg' => 'Success Registrasi'
                    ));
                } else {
                     echo json_encode(array(
                        'RESULT' => 'Error',
                        'msg' => 'Invalid Form'
                    ));
                }
                
            }else{
                echo json_encode(array(
                    'RESULT' => 'Error',
                    'msg' => 'Akun Siswa Telah Terdaftar'
                ));
            }
        }else{
            return json_encode(array(
                'RESULT' => 'Error',
                'msg' => 'NIS Tidak Terdaftar'
            ));
        }
    }
}
