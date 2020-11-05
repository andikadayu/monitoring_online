@extends('master')
@section('tahun-active','active')
@section('masters','menu-open')
@section('title','Tahun Ajaran')
@section('header','Tahun Ajaran')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Tahun Ajaran</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" data-toggle="modal" data-target="#AddTahun">
                    <i class="fas fa-plus"></i> Tambah Data
                </button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Tahun Awal</th>
                                <th>Tahun Akhir</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($tahun as $th)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$th->tahun_awal}}</td>
                                <td>{{$th->tahun_akhir}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateTahun"
                                        onclick="get_data({{$th->id_tahun_ajaran}});">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm"
                                        onclick="delete_data({{$th->id_tahun_ajaran}});">
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
<div class="modal fade" id="AddTahun">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save_tahun_ajaran" onsubmit="add_tahun();return false;">
                    {{csrf_field()}}
                    <label class="form-group">Tahun Awal</label>
                    <input type="text" class="form-control" name="tahun_awal" id="tahun_awal" maxlength="4"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                    <label class="form-group">Tahun Akhir</label>
                    <input type="text" class="form-control" name="tahun_akhir" id="tahun_akhir" required maxlength="4"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
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
<div class="modal fade" id="UpdateTahun">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_tahun_ajaran" onsubmit="EditTahun();return false;">
                    {{csrf_field()}}
                    <input type="hidden" class="form-control" name="id_tahun_ajaran" id="edit_id_tahun_ajaran" required>
                    <label class="form-group">Tahun Awal</label>
                    <input type="text" class="form-control" name="tahun_awal" id="edit_tahun_awal" required
                        maxlength="4"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <label class="form-group">Tahun Akhir</label>
                    <input type="text" class="form-control" name="tahun_akhir" id="edit_tahun_akhir" required
                        maxlength="4"
                        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
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

    function add_tahun() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-tahun",
            processData:false,
            contentType:false,
            data:new FormData($('#save_tahun_ajaran')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add tahun ajaran',
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
            method:'get',
            url:'get-tahun',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_id_tahun_ajaran').val(data[0].id_tahun_ajaran),
		    $('#edit_tahun_awal').val(data[0].tahun_awal),
		    $('#edit_tahun_akhir').val(data[0].tahun_akhir)
        })
    }

    function EditTahun() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('update_tahun')}}",
            processData: false,
            contentType : false,
            data: new FormData($('#update_tahun_ajaran')[0]),
            type: 'post',
            method: 'post',
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                    'success',
                    'update tahun ajaran',
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
                    url: 'delete-tahun',
                    method : 'get',
                    data : {id:id}	
                }).done(function (data) {
                    Swal.close();
                    if (data == 'success') {
                        Swal.fire(
                            'success',
                            'delete tahun ajaran',
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