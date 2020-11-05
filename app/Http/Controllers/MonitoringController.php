<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\TempatPrakerin;
use App\TahunAjaran;
use App\Monitoring;
use App\MonitoringDetail;
use DB;
use Session;
use PDF;
use Crypt;

class MonitoringController extends Controller
{
    public function index()
    {
        $mon = new Monitoring();
        $monitoring = $mon->getMonitoring(); 
        return view('pages.monitoring',['monitoring'=>$monitoring]);
    }

    public function form_monitoring(Request $request)
    {
        if($request->get('tempat_prakerin') != null || $request->get('tahun_ajaran') != null){
            $tempat =base64_decode($request->get('tempat_prakerin'));$tahun = base64_decode($request->get('tahun_ajaran'));
        }else{
            $tempat = 0;$tahun = 0;
        }
        $mon = new Monitoring();
        $data['tempat'] = TempatPrakerin::get();
        $data['tahun'] = TahunAjaran::get();
        $data['request'] = $request;
        $data['siswa'] = $mon->get_siswa($tempat,$tahun);
        return view('pages.formAdd',$data);
    }

    public function add_monitoring(Request $request)
    {
        $mon = new Monitoring();
        $mon->id_user = Session::get('id_user');
        $mon->tgl_monitoring = $request->input('tgl_monitoring');
        $mon->division =  $request->input('division');
        $mon->evaluasi_hasil = $request->input('evaluasi_hasil');
        $mon->penyelesaian = $request->input('penyelesaian');
        $mon->id_tempat_prakerin = $request->input('id_tempat_prakerin');
        $FirstInsert = $mon->save();
        $IdFirst = $mon->id_monitoring;
     
        $query = DB::table('ms_siswa')->where('id_tempat_prakerin',$request->input('id_tempat_prakerin'))->get();

        foreach ($query as $list) {
            $data[] = array(
				'id_monitoring' 	=> $IdFirst,
				'nis_siswa' 		=> $request->input('nis_siswa'.$list->nis_siswa),
				'check_jurnal' 		=> $request->input('check_jurnal'.$list->nis_siswa),
				'check_apd' 		=> $request->input('check_apd'.$list->nis_siswa),
				'check_rambut' 		=> $request->input('check_rambut'.$list->nis_siswa),
				'check_lksp' 		=> $request->input('check_lksp'.$list->nis_siswa),
				'check_kinerja' 	=> $request->input('check_kinerja'.$list->nis_siswa),
				'check_penampilan' 	=> $request->input('check_penampilan'.$list->nis_siswa),
				'alpa_siswa' 		=> $request->input('alpa_siswa'.$list->nis_siswa)
			);		
        }
        DB::table('tb_monitoring_detail')->insert($data);

        if($FirstInsert){
            return 'success';
        }else{
            return 'error';
        }
    }

    public function cetak_pdf(Request $request)
    {
        $mon = new Monitoring();
        $det = new MonitoringDetail();
        $id = Crypt::decryptString($request->get('id'));
        $pdf = PDF::loadview('component.record',[
            'monitoring' => $mon->getCetak($id),
            'detail' => $det->getCetak($id)
        ]);
        return $pdf->stream();
    }    
}