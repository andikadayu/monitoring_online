@extends('master')
@section('monitoring-active','active')
@section('datas','menu-open')
@section('title','Monitoring')
@section('header','Monitoring')
@section('content')
<div class="row">
    <div class="col-12">

        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Monitoring</h3>
            </div>
            <div class="card-body">
                <a href="{{route('form_monitoring')}}" class="btn btn-info">Tambah Monitoring</a>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Divisi</th>
                                <th>Tempat Prakerin</th>
                                <th>Tanggal</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php $no=1; @endphp
                            @foreach ($monitoring as $mon)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$mon->division}}</td>
                                <td>{{$mon->detail_tempat}}</td>
                                <td>{{$mon->tgl_monitoring}}</td>
                                <td>
                                    <button class="btn btn-success btn-sm"
                                        onclick="cetak_pdf('{{Crypt::encryptString($mon->id_monitoring)}}')">
                                        <i class="fas fa-file-pdf">
                                        </i>
                                        Cetak
                                    </button>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.card-body -->
        </div>
    </div>
</div>
@endsection
@section('js')
<script>
    function show_loading(){
        Swal.fire({
            html: 'Loading . . .',
            allowOutsideClick:false,
            onBeforeOpen: function() {
                Swal.showLoading()
            }
        });
    }

    function cetak_pdf(id) {
        show_loading();
        window.open('cetak-pdf?id='+id, '_blank');
        Swal.close();
    }
</script>
@endsection