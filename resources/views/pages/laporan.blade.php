@extends('master')
@section('laporan-active','active')
@section('datas','menu-open')
@section('title','Laporan')
@section('header','Laporan')
@section('content')
{{-- Tambah Data  --}}
@if (session('role') == 'Siswa' && $laporan == null)
<div class="row" id="AddLaporan">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Upload Laporan</h3>
            </div>
            <div class="card-body">
                <form id="save_laporan" onsubmit="add_laporan();return false;">
                    {{ csrf_field() }}
                    <input type="hidden" name="nis_siswa" id="nis_siswa" value="{{session('nis')}}" required>
                    <div class="row">
                        <div class="col-6">
                            <label for="">Judul Project</label>
                            <input type="text" class="form-control" id="judul_laporan" name="judul_laporan" required>
                        </div>
                        <div class="col-6">
                            <label for="">Tanggal</label>
                            <input type="date" class="form-control" id="tgl_laporan" name="tgl_laporan"
                                value="<?php echo date('Y-m-d');?>" readonly required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">File</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="file_laporan" name="file_laporan"
                                    accept="application/pdf" required>
                                <label class="custom-file-label" for="file_laporan">Choose File (PDF)</label>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
                <button type="reset" class="btn btn-secondary">Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
@endif


<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Laporan Prakerin</h3>
            </div>
            <div class="card-body">
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>NIS Siswa</th>
                                <th>Judul Laporan</th>
                                <th>Status</th>
                                <th>Tgl Laporan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($laporan as $lp)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$lp->nis_siswa}}</td>
                                <td>{{$lp->judul_laporan}}</td>
                                <td>
                                    @if ($lp->lp_valid == '0')
                                    <span class="badge bg-warning">Pending</span></td>
                                @else
                                <span class="badge bg-success">Done</span></td>
                                @endif
                                </td>
                                <td>{{$lp->tgl_laporan}}</td>
                                <td>
                                    @if (session('role')=='Pembimbing' && $lp->lp_valid == '0')
                                    <button class="btn btn-success btn-sm" onclick="accept_data({{$lp->id_laporan}});">
                                        <i class="fas fa-check">
                                        </i>
                                        Accept
                                    </button>
                                    @endif
                                    <button class="btn btn-info btn-sm" id="viewData" lang="{{url('/').'/'}}"
                                        onclick="view_data({{$lp->id_laporan}});">
                                        <i class="fas fa-eye">
                                        </i>
                                        View
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
    function show_loading() {
    Swal.fire({
        html: 'Loading . . .',
        allowOutsideClick:false,
        onBeforeOpen: function() {
            Swal.showLoading()
        }
    });
    }

    function add_laporan() {
        show_loading();
        $.ajax({
            headers:{
            'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-laporan",
            processData:false,
            contentType:false,
            data:new FormData($('#save_laporan')[0]),
            type:'post',
            method:'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                'success',
                'add laporan',
                'success'
                );
                location.reload();
            }else{
                Swal.fire(
                'error',
                'invalid form',
                'error'
                );
            }
        })
    }

    function view_data(id) {
        var url = $('#viewData').attr('lang');
        show_loading();
        $.ajax({
            url:'get-laporan',
            method: 'GET',
            data:{id:id},
            dataType:'json',
        }).done(function (data) {
            Swal.close();
            window.open(url+data);
        })
    }

    function accept_data(id) {
        show_loading();
        $.ajax({
            url:'accept-laporan',
            method:'GET',
            data:{id:id},
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
               Toast.fire({
                icon: 'success',
                title: 'Success Accept Data'
                })
                $('#datatables').load('laporan #datatables');
            } else {
               Toast.fire({
                icon: 'error',
                title: 'Error Accept Data'
                });
            }
        })
    }
</script>
@endsection