@extends('master')
@section('jurnal-active','active')
@section('datas','menu-open')
@section('title','Jurnal Harian')
@section('header','Jurnal Harian')
@section('content')
@if (session('role') == 'Siswa' && $last->tgl_jurnal != date('Y-m-d'))
<div class="row" id="AddJurnal">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Jurnal Harian</h3>
            </div>
            <div class="card-body">
                <form id="save_jurnal" onsubmit="add_jurnal();return false;">
                    {{ csrf_field() }}
                    <input type="hidden" name="nis_siswa" id="nis_siswa" value="{{session('nis')}}" required>
                    <div class="row">
                        <div class="col-4">
                            <label for="">Tanggal</label>
                            <input type="date" class="form-control" id="tgl_jurnal" name="tgl_jurnal"
                                value="<?php echo date('Y-m-d');?>" readonly required>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Masuk</label>
                            <input type="time" class="form-control" id="jam_masuk" name="jam_masuk" required>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Keluar</label>
                            <input type="time" class="form-control" id="jam_keluar" name="jam_keluar" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="">Kegiatan Kerja</label>
                            <textarea name="kegiatan_kerja" id="summernote" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Prosedur Pengerjaan</label>
                            <textarea name="prosedur_kerja" id="summernotes" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Spesifikasi Bahan</label>
                            <textarea name="spesifikasi_bahan" id="summernotess" class="form-control"></textarea>
                        </div>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
            </div>
            </form>
        </div>
    </div>
</div>
@endif

<div class="row" id="UpdateJurnal">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Update Jurnal Harian</h3>
            </div>
            <div class="card-body">
                <form id="update_jurnal" onsubmit="edit_jurnal();return false;">
                    {{ csrf_field() }}
                    <input type="hidden" name="id_jurnal" id="id_jurnal" required>
                    <input type="hidden" name="nis_siswa" id="nis_siswa" value="{{session('nis')}}" required>
                    <div class="row">
                        <div class="col-4">
                            <label for="">Tanggal</label>
                            <input type="date" class="form-control" id="edit_tgl_jurnal" name="tgl_jurnal" readonly
                                required>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Masuk</label>
                            <input type="time" class="form-control" id="edit_jam_masuk" name="jam_masuk" required>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Keluar</label>
                            <input type="time" class="form-control" id="edit_jam_keluar" name="jam_keluar" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="">Kegiatan Kerja</label>
                            <textarea name="kegiatan_kerja" id="summernoteUpdate" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Prosedur Pengerjaan</label>
                            <textarea name="prosedur_kerja" id="summernotesUpdate" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Spesifikasi Bahan</label>
                            <textarea name="spesifikasi_bahan" id="summernotessUpdate" class="form-control"></textarea>
                        </div>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
            </div>
            </form>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Jurnal Harian</h3>
            </div>
            <div class="card-body">
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>NIS Siswa</th>
                                <th>Nama</th>
                                <th>Tempat</th>
                                <th>Status</th>
                                <th>Tgl</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($jurnal as $j)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$j->nis_siswa}}</td>
                                <td>{{$j->nama_siswa}}</td>
                                <td>{{$j->detail_tempat}}</td>
                                <td>
                                    @if ($j->is_valid == '0')
                                    <span class="badge bg-warning">Pending</span></td>
                                @else
                                <span class="badge bg-success">Done</span></td>
                                @endif
                                </td>
                                <td>{{$j->tgl_jurnal}}</td>
                                <td>
                                    @if (session('role')=='Pembimbing' && $j->is_valid == '0')
                                    <button class="btn btn-success btn-sm" onclick="accept_data({{$j->id_jurnal}});">
                                        <i class="fas fa-check">
                                        </i>
                                        Accept
                                    </button>
                                    @endif
                                    @if (session('role')=='Siswa' && $j->is_valid == '0')
                                    <button class="btn btn-warning btn-sm" onclick="get_data({{$j->id_jurnal}});">
                                        <i class="fas fa-edit">
                                        </i>
                                        Edit
                                    </button>
                                    @endif
                                    <button class="btn btn-info btn-sm" id="viewData"
                                        onclick="view_data({{$j->id_jurnal}});">
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

<div class="modal fade" id="viewJurnal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">View Jurnal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <label for="">Nis:</label>
                        <p id="vNis"></p>
                    </div>
                    <div class="col-6">
                        <label for="">Tanggal:</label>
                        <p id="vTanggal"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label for="">Jam Masuk</label>
                        <p id="vJMasuk"></p>
                    </div>
                    <div class="col-6">
                        <label for="">Jam Keluar</label>
                        <p id="vJKeluar"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <label for="">Kegiatan Kerja</label>
                        <p id="vKegiatan"></p>
                    </div>
                    <div class="col-lg-4">
                        <label for="">Prosedur Pengerjaan</label>
                        <p id="vProsedur"></p>
                    </div>
                    <div class="col-lg-4">
                        <label for="">Spesifikasi Bahan</label>
                        <p id="vSpesifikasi"></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

@endsection
@section('js')
<script>
    $(function () {
        $('#UpdateJurnal').hide();
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

    function add_jurnal() {
        show_loading();
        $.ajax({
            headers:{
            'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-jurnal",
            processData:false,
            contentType:false,
            data:new FormData($('#save_jurnal')[0]),
            type:'post',
            method:'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                'success',
                'add jurnal',
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
        $('#viewJurnal').modal('show');
        show_loading();
        $.ajax({
            url : 'view-jurnal',
            method:'get',
            data:{id:id},
        }).done(function (data) {
            Swal.close();
            $('#vNis').text(data[0].nis_siswa),
            $('#vTanggal').text(data[0].tgl_jurnal),
            $('#vJMasuk').text(data[0].jam_masuk),
            $('#vJKeluar').text(data[0].jam_keluar),
            $('#vKegiatan').html(data[0].kegiatan_kerja),
            $('#vProsedur').html(data[0].prosedur_kerja),
            $('#vSpesifikasi').html(data[0].spesifikasi_bahan)
        })
    }

    function get_data(id) {
        show_loading();$('#UpdateJurnal').show();$('#AddJurnal').hide();
        $.ajax({
            url:'view-jurnal',
            method:'get',
            data:{id:id},
        }).done(function (data) {
            Swal.close();
            $('#id_jurnal').val(data[0].id_jurnal),
            $('#edit_tgl_jurnal').val(data[0].tgl_jurnal),
            $('#edit_jam_masuk').val(data[0].jam_masuk),
            $('#edit_jam_keluar').val(data[0].jam_keluar),
            $('#summernoteUpdate').summernote('code',data[0].kegiatan_kerja),
            $('#summernotesUpdate').summernote('code',data[0].prosedur_kerja),
            $('#summernotessUpdate').summernote('code',data[0].spesifikasi_bahan)
        })
    }

    function edit_jurnal() {
        show_loading();
        $.ajax({
            headers:{
            'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"edit-jurnal",
            processData:false,
            contentType:false,
            data:new FormData($('#update_jurnal')[0]),
            type:'post',
            method:'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                'success',
                'add jurnal',
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

    function accept_data(id) {
        show_loading();
        $.ajax({
            url:'accept-jurnal',
            method:'GET',
            data:{id:id},
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Toast.fire({
                    icon: 'success',
                    title: 'Success Accept Data'
                })
                $('#datatables').load('jurnal #datatables');
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