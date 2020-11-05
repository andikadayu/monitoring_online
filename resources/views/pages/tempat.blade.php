@extends('master')
@section('tempat-active','active')
@section('datas','menu-open')
@section('title','Tempat Prakerin')
@section('header','Tempat Prakerin')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Tempat Prakerin</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" data-toggle="modal" data-target="#AddTempat">
                    <i class="fas fa-plus"></i> Tambah Data
                </button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover  table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th style="width: 5%">#</th>
                                <th>Nama</th>
                                <th>Alamat</th>
                                <th>Telp</th>
                                <th>Email</th>
                                <th style="width: 15%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($tempat as $tpt)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$tpt->detail_tempat}}</td>
                                <td>{{$tpt->alamat_tempat}}</td>
                                <td>{{$tpt->telp_kantor}}</td>
                                <td>{{$tpt->email_kantor}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateTempat"
                                        onclick="get_data({{$tpt->id_tempat_prakerin}})">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm"
                                        onclick="delete_data({{$tpt->id_tempat_prakerin}})">
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
<div class="modal fade" id="AddTempat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save_tempat_prakerin" onsubmit="add_tempat();return false;">
                    {{csrf_field()}}
                    <label class="form-group">Nama Tempat</label>
                    <input type="text" class="form-control" name="detail_tempat" id="detail_tempat" required>
                    <label class="form-group">Nomor Telepon</label>
                    <input type="text" class="form-control" name="telp_kantor" id="telp_kantor" required maxlength="15"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                    <label class="form-group">Email</label>
                    <input type="email" class="form-control" name="email_kantor" id="email_kantor" required>
                    <label class="form-group">Alamat (Kota , Provinsi)</label>
                    <textarea name="alamat_tempat" id="alamat_tempat" cols="5" rows="5" class="form-control"
                        required></textarea>
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
<div class="modal fade" id="UpdateTempat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_tempat_prakerin" onsubmit="edit_tempat();return false;">
                    {{csrf_field()}}
                    <input type="hidden" class="form-control" name="id_tempat_prakerin" id="edit_id_tempat_prakerin"
                        required>
                    <label class="form-group">Nama Tempat</label>
                    <input type="text" class="form-control" name="detail_tempat" id="edit_detail_tempat" required>
                    <label class="form-group">Nomor Telepon</label>
                    <input type="text" class="form-control" name="telp_kantor" id="edit_telp_kantor" required
                        maxlength="15"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                    <label class="form-group">Email</label>
                    <input type="email" class="form-control" name="email_kantor" id="edit_email_kantor" required>
                    <label class="form-group">Alamat (Kota , Provinsi)</label>
                    <textarea name="alamat_tempat" id="edit_alamat_tempat" cols="5" rows="5" class="form-control"
                        required></textarea>
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

    function add_tempat() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-tempat",
            processData:false,
            contentType:false,
            data:new FormData($('#save_tempat_prakerin')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add tempat prakerin',
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
            url : 'get-tempat',
            method:'get',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_id_tempat_prakerin').val(data[0].id_tempat_prakerin),
            $('#edit_detail_tempat').val(data[0].detail_tempat),
            $('#edit_alamat_tempat').val(data[0].alamat_tempat),
            $('#edit_telp_kantor').val(data[0].telp_kantor),
            $('#edit_email_kantor').val(data[0].email_kantor)
        })
    }

    function edit_tempat() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"update-tempat",
            processData:false,
            contentType:false,
            data:new FormData($('#update_tempat_prakerin')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'update tempat prakerin',
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
                    url: 'delete-tempat',
                    method : 'get',
                    data : {id:id}	
                }).done(function (data) {
                    Swal.close();
                    if (data == 'success') {
                        Swal.fire(
                            'success',
                            'delete tempat_prakerin',
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