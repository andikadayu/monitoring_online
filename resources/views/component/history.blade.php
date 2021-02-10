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
    
    <h5>Tanggal : {{$first}} - {{$last}}</h5>

    <table border="1" class="table table-bordered table-sm">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama</th>
                <th>Role</th>
                <th>Kegiatan</th>
                <th>Tanggal</th>
            </tr>
        </thead>
        <tbody>
            @php $no = 1; @endphp
            @foreach ($history as $h)
            <tr>
                <td>{{$no++}}</td>
                <td>
                    @if($h->role == 'Pembimbing')
                    {{$h->nama_pembimbing}}
                    @elseif($h->role == 'Siswa')
                    {{$h->nama_siswa}}
                    @else   
                    Admin
                    @endif
                </td>
                <td>{{$h->role}}</td>
                <td>{{$h->kegiatan}}</td>
                <td>{{\Carbon\Carbon::parse($h->tanggal)->isoFormat('DD MMM gggg hh:kk:ss')}}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <footer></footer>
</body>

</html>