<?php

namespace App\Http\Controllers;

use App\History;
use PDF;
use Illuminate\Http\Request;

class HistoryController extends Controller
{
    public function index()
    {
        $history = new History();
        return view('pages.history', ['history' => $history->getHistory()]);
    }

    public function cetak_history(Request $request)
    {
        $tanggal = $request->get('tgl');
        $tgl = explode(" - ", $tanggal);
        $time1 = strtotime($tgl[0]);
        $tgl_awal = date('Y-m-d', $time1);
        $time2 = strtotime($tgl[1]);
        $tgl_akhir = date('Y-m-d', $time2);
        $history = new History();
        $pdf = PDF::loadview('component.history', [
            'history' => $history->getCetak($tgl_awal, $tgl_akhir),
            'first' => $tgl_awal,
            'last' => $last
        ]);
        return $pdf->stream();
    }
}
