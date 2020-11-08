<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use DB;

class MonitoringExport implements FromView, ShouldAutoSize
{

    use Exportable;

    public function __construct(string $tgl_awal, string $tgl_akhir, string $role, string $id_user)
    {
        $this->tgl_awal = $tgl_awal;
        $this->tgl_akhir = $tgl_akhir;
        $this->role = $role;
        $this->id_user = $id_user;
    }

    public function view(): \Illuminate\Contracts\View\View

    {
        if ($this->role == 'Pembimbing') {
            $data = DB::table('tb_monitoring')
                ->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
                ->join('ms_users', 'ms_users.id_user', '=', 'tb_monitoring.id_user')
                ->join('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
                ->where('tb_monitoring.id_user', 'Like', $this->id_user)
                ->whereBetween('tgl_monitoring', [$this->tgl_awal, $this->tgl_akhir])
                ->get();
        } else {
            $data = DB::table('tb_monitoring')
                ->join('ms_tempat_prakerin', 'ms_tempat_prakerin.id_tempat_prakerin', '=', 'tb_monitoring.id_tempat_prakerin')
                ->join('ms_users', 'ms_users.id_user', '=', 'tb_monitoring.id_user')
                ->join('ms_pembimbing', 'ms_users.id_pembimbing', '=', 'ms_pembimbing.id_pembimbing')
                ->whereBetween('tgl_monitoring', [$this->tgl_awal, $this->tgl_akhir])
                ->get();
        }
        return view('component.laporan_excel', [
            'data' => $data
        ]);
    }
}
