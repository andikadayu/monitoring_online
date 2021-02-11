@extends('master')
@section('history-active','active')
@section('title','History')
@section('header','History')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">History</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" onclick="$('#viewReport').modal('show');"><i class="fas fa-file-pdf"> Cetak PDF</i></button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama</th>
                                <th>Role</th>
                                <th>Kegiatan</th>
                                <th>Tanggal</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
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
                                    <td>{{\Carbon\Carbon::parse($h->tanggal)->isoFormat('DD MMM gggg hh:mm:ss')}}</td>
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
                <h4 class="modal-title">Report History</h4>
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
    $('#reservation').daterangepicker();

    function show_loading() {
    Swal.fire({
        html: 'Loading . . .',
        allowOutsideClick:false,
        onBeforeOpen: function() {
            Swal.showLoading()
        }
    });
    }

    function report_proses() {
        var tgl = $('#reservation').val();
        show_loading();
        window.open("cetak-history?tgl="+tgl,'_blank');
        Swal.close();
        location.reload();
    }

    
</script>
@endsection