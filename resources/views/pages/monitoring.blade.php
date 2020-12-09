@extends('master')
@section('monitoring-active','active')
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
                <form action="{{url()->current()}}" method="GET">
                    <div class="row">
                        @if(session('role') != 'Siswa')
                        <div class="col-md-3">
                            <input type="month" name="month" id="month" class="form-control" placeholder="Pilih Bulan" value="{{$m}}" required>
                        </div>
                        <div class="col-md-2">
                            <input type="submit" value="Search" class="btn btn-secondary">
                        </div>
                        @endif
                        <div class="@if(session('role')!='Siswa') col-md-7 text-right @endif ">
                            @if (session('role') == 'Pembimbing')
                            <a href="{{route('form_monitoring')}}" class="btn btn-info"><i class="fas fa-plus"> Tambah Monitoring</i></a>
                            @endif
                            <button class="btn btn-success" onclick="$('#viewReport').modal('show');"><i class="fas fa-file-excel"> Cetak Excel</i></button>
                        </div>
                    </div>
                    </form>
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

<div class="modal fade" id="viewReport">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Report Monitoring</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                <div class="modal-body">
                    <label for="">Jangka Waktu</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">
                            <i class="far fa-calendar-alt"></i>
                          </span>
                        </div>
                        <input type="text" name="tgl"  class="form-control float-right" id="reservation">
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" onclick="report_proses()" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
        </div>
    </div>
</div>
@endsection
@section('js')
<script>
    $(function () {
        $('#reservation').daterangepicker();
    })

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

    function report_proses() {
        var tgl = $('#reservation').val();
        show_loading();
        window.open("monitoring-excel?tgl="+tgl,'_blank');
        Swal.close();
        location.reload();
    }
</script>
@endsection
