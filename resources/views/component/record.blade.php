<!DOCTYPE html>
<html>

<head>
    <title>Laporan</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<style>
    .page-break {
        page-break-after: always;
    }

    @page {
        margin: 0cm 0cm;
    }

    /** Define now the real margins of every page in the PDF **/
    body {
        margin-top: 3.2cm;
        margin-left: 2cm;
        margin-right: 2cm;
        margin-bottom: 2cm;
    }

    /** Define the header rules **/
    header {
        position: fixed;
        top: 0cm;
        left: 0cm;
        right: 0cm;
        height: 3cm;

        /** Extra personal styles **/
        background-image: url("<?php echo public_path().'/assets/img/header.png'; ?>");
        background-repeat: no-repeat;
        background-position: center;
    }


    footer {
        position: fixed; 
        bottom: 0cm; 
        left: 0cm; 
        right: 0cm;
        height: 0.5cm;

        background-image: url("<?php echo public_path().'/assets/img/image.png'; ?>");
    }

    table {
        border-collapse: collapse;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
    }

    .tables {
        width: 100%;
        margin-bottom: 1rem;
        color: #212529;
    }

    .tables td,
    .tables th {
        padding: .75rem;
        vertical-align: top;
        border-top: 0px solid #000000;
    }

    .tables thead th {
        vertical-align: bottom;
        border-bottom: 0px solid #000000;
    }

    .tables tbody+tbody {
        border-top: 0px solid #000000;
    }

    .table td,
    .table th {
        padding: .75rem;
        vertical-align: top;
        border-top: 1px solid #000000
    }

    .table thead th {
        vertical-align: bottom;
        border-bottom: 2px solid #000000
    }

    .table tbody+tbody {
        border-top: 2px solid #000000
    }


    .table-borderless tbody+tbody,
    .table-borderless td,
    .table-borderless th,
    .table-borderless thead th {
        border: 0
    }

    .custom-checkbox .custom-control-label::before {
        border-radius: .25rem;
    }

    label {
        display: inline-block;
        margin-bottom: .5rem;
    }

    body {
        font-size: 14px;
        font-family: Century;
    }

    th {
        text-align: inherit;
    }

    h4 {
        margin: 8px;
    }

</style>

<body>
    <header>

    </header>
    <hr>
    @php \Carbon\Carbon::setLocale('id'); @endphp
    <h4 align="center">RECORDING KUNJUNGAN SISWA PRAKERIN</h4>
    @foreach($monitoring as $mnt)
    <h4 align="center">{{$mnt->detail_tempat}}</h4>
    <h4 align="center"><small>{{$mnt->alamat_tempat}}-Telp:{{$mnt->telp_kantor}}</small></h4>
    <br>
    <b style="font-size: 14px"> {{$mnt->division}} DIVISION</b>
    <p style="font-size: 14px">
        Hari/Tanggal/Bulan/Tahun:{{\Carbon\Carbon::parse($mnt->tgl_monitoring)->isoFormat(' dddd, DD / MMMM / YYYY')}}
    </p>
    <p>1.Rekap Permasalahan</p>
    <table border="1" class="table table-bordered table-sm">
        <tr>
            <th width="50%">Evaluasi Hasil Kunjungan</th>
            <th width="50%">Penyelesaian</th>
        </tr>
        <tr>
            <td>
                <p>
                    @php
                    echo $mnt->evaluasi_hasil;
                    @endphp
            </td>
            <td>
                <p>
                    @php
                    echo $mnt->penyelesaian;
                    @endphp
            </td>
        </tr>
    </table>
    <p>2.Rekap Monitoring Siswa Prakerin</p>
    <table border="1" class="table table-bordered table-sm">
        <tr>
            <th width="8%">NIS</th>
            <th width="30%">NAMA</th>
            <th width="35%">CHECKLIST MONITORING</th>
            <th width="15%">ALPA SISWA</th>
            <th width="12%">TTD</th>
        </tr>
        @foreach($detail as $dt)
        @php $no=1;@endphp
        <tr>
            <td>{{$dt->nis_siswa}}</td>
            <td>{{$dt->nama_siswa}}
                <br><small>{{$dt->telp_ortu}}</small>
                <br><small>{{$dt->nama_ortu}}</small>
            </td>
            <td>
                <input type="checkbox" name="check_jurnal" id="check_jurnal" class="custom-checkbox" value="1"
                    @if($dt->check_jurnal==1) checked @endif>
                <label class="form-check-label" for="check_jurnal">Jurnal</label>

                <input type="checkbox" name="check_apd" id="check_apd" class="custom-checkbox" value="1"
                    @if($dt->check_apd==1) checked @endif>
                <label class="form-check-label" for="check_apd">APD</label>

                <input type="checkbox" name="check_rambut" id="check_rambut" class="custom-checkbox" value="1"
                    @if($dt->check_rambut==1) checked @endif>
                <label class="form-check-label" for="check_rambut">Rambut</label>
                <br>
                <input type="checkbox" name="check_lksp" id="check_lksp" class="custom-checkbox" value="1"
                    @if($dt->check_lksp==1) checked @endif>
                <label class="form-check-label" for="check_lksp">LKSP</label>

                <input type="checkbox" name="check_kinerja" id="check_kinerja" class="custom-checkbox" value="1"
                    @if($dt->check_kinerja==1) checked @endif>
                <label class="form-check-label" for="check_kinerja">Kinerja</label>

                <input type="checkbox" name="check_penampilan" id="check_penampilan" class="custom-checkbox" value="1"
                    @if($dt->check_penampilan==1) checked @endif>
                <label class="form-check-label" for="check_penampilan">Penapilan</label>
            </td>
            <td>{{$dt->alpa_siswa}}</td>
            <td></td>
        </tr>
        @endforeach
    </table>
    <p style="font-size: 12px;">Notifikasi Perijinan:(SMS: {{$mnt->telp_kantor}}), (EMAIL:
        {{$mnt->email_kantor}})</p>
    <br>
    <table class="tables" border="0">
        <tr>
            <td width="50%">Diketahui Oleh</td>
            <td width="50%">
                ........................,{{\Carbon\Carbon::parse($mnt->tgl_monitoring)->isoFormat(' dddd, DD / MMMM / gggg')}}
            </td>
        </tr>
        <tr>
            <td>
                <br><br><br><br>
                <hr>Perusahaan
            </td>
            <td>
                <br><br><br>Staff Prakerin
                <hr>Pembimbing Sekolah
                <br>FR/PRAK{{$mnt->id_monitoring}},{{\Carbon\Carbon::parse($mnt->tgl_monitoring)->isoFormat('DD/MMMM/gggg')}}
            </td>
        </tr>
    </table>

    @endforeach

    <footer>

    </footer>
</body>

</html>