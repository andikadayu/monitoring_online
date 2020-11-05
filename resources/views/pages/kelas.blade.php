@extends('master')
@section('kelas-active','active')
@section('masters','menu-open')
@section('title','Kelas')
@section('header','Kelas')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Kelas</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" data-toggle="modal" data-target="#AddKelas">
                    <i class="fas fa-plus"></i> Tambah Data
                </button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th style="width: 8%">#</th>
                                <th>Detail</th>
                                <th>Tahun Ajaran</th>
                                <th>Guru Wali</th>
                                <th style="width: 15%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($kelas as $kls)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$kls->detail_kelas}}</td>
                                <td>{{$kls->tahun_awal}}/{{$kls->tahun_akhir}}</td>
                                <td>{{$kls->nama_guru}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateKelas"
                                        onclick="get_data({{$kls->id_kelas}})">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="delete_data({{$kls->id_kelas}})">
                                        <i class="fas fa-trash">
                                        </i>
                                        Delete
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
<!-- modal add  -->
<div class="modal fade" id="AddKelas">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save_kelas" onsubmit="add_kelas();return false;">
                    {{csrf_field()}}
                    <label for="">Detail Kelas</label>
                    <input type="text" name="detail_kelas" id="detail_kelas" class="form-control" required>
                    <label for="">Tahun Ajaran</label>
                    <select name="id_tahun_ajaran" id="id_tahun_ajaran" class="form-control">
                        @foreach ($tahun as $th)
                        <option value="{{$th->id_tahun_ajaran}}">{{$th->tahun_awal}}/{{$th->tahun_akhir}}</option>
                        @endforeach
                    </select>
                    <label for="">Guru Wali</label>
                    <select name="id_wali_kelas" id="id_wali_kelas" class="form-control">
                        @foreach ($guru as $gr)
                        <option value="{{$gr->id_guru}}">{{$gr->nama_guru}}</option>
                        @endforeach
                    </select>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Edit Modal  -->
<div class="modal fade" id="UpdateKelas">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_kelas" onsubmit="edit_kelas();return false;">
                    {{csrf_field()}}
                    <input type="hidden" class="form-control" name="id_kelas" id="edit_id_kelas" required>
                    <label for="">Detail Kelas</label>
                    <input type="text" name="detail_kelas" id="edit_detail_kelas" class="form-control" required>
                    <label for="">Tahun Ajaran</label>
                    <select name="id_tahun_ajaran" id="edit_id_tahun_ajaran" class="form-control">
                        @foreach ($tahun as $th)
                        <option value="{{$th->id_tahun_ajaran}}">{{$th->tahun_awal}}/{{$th->tahun_akhir}}</option>
                        @endforeach
                    </select>
                    <label for="">Guru Wali</label>
                    <select name="id_wali_kelas" id="edit_id_wali_kelas" class="form-control">
                        @foreach ($guru as $gr)
                        <option value="{{$gr->id_guru}}">{{$gr->nama_guru}}</option>
                        @endforeach
                    </select>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
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

    function add_kelas() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-kelas",
            processData:false,
            contentType:false,
            data:new FormData($('#save_kelas')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add kelas',
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

    function get_data(id) {
        show_loading();
        $.ajax({
            url : 'get-kelas',
            method:'get',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_id_kelas').val(data[0].id_kelas),
            $('#edit_detail_kelas').val(data[0].detail_kelas),
            $('#edit_id_tahun_ajaran').val(data[0].id_tahun_ajaran),
            $('#edit_id_wali_kelas').val(data[0].id_wali_kelas)
        })
    }

    function edit_tempat() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"update-kelas",
            processData:false,
            contentType:false,
            data:new FormData($('#update_kelas')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'update kelas',
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

    function delete_data(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.value) {
                show_loading();
                $.ajax({
                    url: 'delete-kelas',
                    method : 'get',
                    data : {id:id}	
                }).done(function (data) {
                    Swal.close();
                    if (data == 'success') {
                        Swal.fire(
                            'success',
                            'delete kelas',
                            'success'
                            );
                        location.reload();
                    }else{
                        Swal.fire({
                            icon: 'error',
                            title: 'failed',
                            text: 'your imaginary file is safe :)',
                            showconfirmbutton: false,
                            timer: 1500
                        })
                    }
                })

            }else{
                Swal.fire({
                    icon: 'error',
                    title: 'failed',
                    text: 'your imaginary file is safe :)',
                    showconfirmbutton: false,
                    timer: 1500
                })
            }
        });
    }
</script>
@endsection