@extends('master')
@section('users-active','active')
@section('masters','menu-open')
@section('title','Users')
@section('header','Users')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Admin</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" data-toggle="modal" data-target="#AddAdmin">
                    <i class="fas fa-plus"></i> Tambah Data
                </button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th style="width: 8%">#</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($user as $u)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$u->email}}</td>
                                <td>{{$u->role}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateAdmin"
                                        onclick="get_data({{$u->id_user}})">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="delete_data({{$u->id_user}})">
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

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master User Siswa</h3>
            </div>
            <div class="card-body">
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables1">
                        <thead>
                            <tr>
                                <th style="width: 8%">NIS</th>
                                <th>Nama</th>
                                <th>Email</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($siswa as $s)
                            <tr>
                                <td>{{$s->id_siswa_detail}}</td>
                                <td>{{$s->nama_siswa}}</td>
                                <td>{{$s->email}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateSiswa"
                                        onclick="get_data({{$s->id_user}})">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="delete_data({{$s->id_user}})">
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
<div class="modal fade" id="AddAdmin">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Admin</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save_admin" onsubmit="add_admin();return false;">
                    {{csrf_field()}}
                    <label for="">Email</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                    <label for="">Password</label>
                    <input type="password" name="password" id="password" class="form-control" required>

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
<div class="modal fade" id="UpdateAdmin">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Admin</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_admin" onsubmit="edit_admin();return false;">
                    {{csrf_field()}}
                    <input type="hidden" name="id_user" id="edit_id_user">
                    <label for="">Email</label>
                    <input type="email" name="email" id="edit_email" class="form-control" required>
                    <label for="">Password</label>
                    <input type="password" name="password" id="edit_password" class="form-control" required>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="UpdateSiswa">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit User Siswa</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_siswa" onsubmit="edit_siswa();return false;">
                    {{csrf_field()}}
                    <input type="hidden" name="id_user" id="edit_id_user">
                    <label for="">Email</label>
                    <input type="email" name="email" id="edit_email" class="form-control" required>
                    <label for="">Password</label>
                    <input type="password" name="password" id="edit_password" class="form-control" required>
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

    function add_admin() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-admin",
            processData:false,
            contentType:false,
            data:new FormData($('#save_admin')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add admin',
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
            url : 'get-admin',
            method:'get',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_id_user').val(data[0].id_user),
            $('#edit_email').val(data[0].email),
            $('#edit_password').val(data[0].password)
        })
    }

    function edit_admin() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"update-admin",
            processData:false,
            contentType:false,
            data:new FormData($('#update_admin')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'update admin',
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

    function edit_siswa() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"update-user",
            processData:false,
            contentType:false,
            data:new FormData($('#update_siswa')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'update user siswa',
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
                    url: 'delete-user',
                    method : 'get',
                    data : {id:id}	
                }).done(function (data) {
                    Swal.close();
                    if (data == 'success') {
                        Swal.fire(
                            'success',
                            'delete user',
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