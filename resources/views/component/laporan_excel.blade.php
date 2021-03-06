<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<table class="table table-bordered" border="1">
<thead>
    <tr>
        <th>No</th>
        <th>Tempat Prakerin</th>
        <th>Pembimbing</th>
        <th>Tanggal Monitoring</th>
    </tr>
</thead>
<tbody>
    @php $no=1; @endphp
    @foreach($data as $dt)
    <tr>
        <td>{{$no++}}</td>
        <td>{{$dt->detail_tempat}}</td>
        <td>{{$dt->nama_pembimbing}}</td>
        <td>{{\Carbon\Carbon::parse($dt->tgl_monitoring)->isoFormat('DD MMM gggg')}}</td>
    </tr>
    @endforeach
</tbody>
</table>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>