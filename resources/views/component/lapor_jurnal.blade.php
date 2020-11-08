<!DOCTYPE html>
<html lang="en">
<head>
    <title>Laporan</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        .page-break {
        page-break-after: always;
    }

    @page {
        margin: 0cm 0cm;
    }

    body {
        margin-top: 2cm;
        margin-left: 2cm;
        margin-right: 2cm;
        margin-bottom: 2cm;
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

    </style>
</head>
<body>
    <h4 align="center">Laporan Jurnal Harian Siswa</h4>
    @foreach ($siswa as $sis)
    <h4 align="center">{{$sis->nama_siswa}}</h4>
    <h4 align="center">{{$sis->detail_tempat}}</h4>
    <h4 align="right">{{$first}} s/d {{$last}}</h4>
    @endforeach

    @foreach ($jurnal as $jur)
        <p>Hari, tgl-bln-th : {{\Carbon\Carbon::parse($jur->tgl_jurnal)->isoFormat(' dddd, DD-MMMM-YYYY')}} </p>
        <p>Waktu Kerja : {{$jur->jam_masuk}} s/d {{$jur->jam_keluar}}</p>

        <table class="table table-bordered table-sm" border="1">
            <tbody>
                <tr>
                    <th>Kegiatan Kerja</th>
                    <th>Prosedur Pengerjaan</th>
                    <th>Spesifikasi Bahan </th>
                </tr>
            </tbody>
            <tbody>
                <tr>
                    <td>@php echo $jur->kegiatan_kerja; @endphp</td>
                    <td>@php echo $jur->prosedur_kerja; @endphp</td>
                    <td>@php echo $jur->spesifikasi_bahan; @endphp</td>
                </tr>
            </tbody>
        </table>

        <br>
    @endforeach
</body>
</html>