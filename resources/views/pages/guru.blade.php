@extends('master')
@section('guru-active','active')
@section('masters','menu-open')
@section('title','Guru')
@section('header','Guru')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Guru</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" data-toggle="modal" data-target="#AddGuru">
                    <i class="fas fa-plus"></i> Tambah Data
                </button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nama</th>
                                <th>No Telp</th>
                                <th>Email</th>
                                <th>Alamat</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($guru as $gr)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$gr->nama_guru}}</td>
                                <td>{{$gr->no_telp_guru}}</td>
                                <td>{{$gr->email_guru}}</td>
                                <td>{{$gr->alamat_guru}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateGuru"
                                        onclick="get_data({{$gr->id_guru}});">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="delete_data({{$gr->id_guru}});">
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
<div class="modal fade" id="AddGuru">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save_guru" onsubmit="add_guru();return false;">
                    {{csrf_field()}}
                    <div class="row">
                        <div class="col">
                            <label for="">Nama</label>
                            <input type="text" class="form-control" name="nama_guru" id="nama_guru" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Nik</label>
                            <input type="text" class="form-control" name="nik_guru" id="nik_guru" maxlength="16"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Foto</label>
                            {{-- <input type="file" class="form-control" name="img_guru" id="img_guru" accept="image/*"> --}}
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="img_guru" name="img_guru"
                                    accept="image/*">
                                <label class="custom-file-label" for="img_guru">Choose photo</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Jenis Kelamin</label>
                            <select name="jenis_kelamin_guru" id="jenis_kelamin_guru" class="form-control">
                                <option value="Laki-Laki">Laki-Laki</option>
                                <option value="Perempuan">Perempuan</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tanggal Lahir</label>
                            <input type="date" class="form-control" name="tgl_lahir_guru" id="tgl_lahir_guru" required>
                        </div>
                        <div class="col">
                            <label for="">Agama</label>
                            <select name="agama_guru" id="agama_guru" class="form-control">
                                <option value="Islam">Islam</option>
                                <option value="Kristen">Kristen</option>
                                <option value="Katolik">Katolik</option>
                                <option value="Hindu">Hindu</option>
                                <option value="Budha">Budha</option>
                                <option value="Konghucu">Konghucu</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>No Telp</label>
                            <input type="text" class="form-control" name="no_telp_guru" id="no_telp_guru" maxlength="13"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Email</label>
                            <input type="email" class="form-control" name="email_guru" id="email_guru" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Alamat</label>
                            <textarea name="alamat_guru" id="alamat_guru" rows="3" class="form-control"
                                required></textarea>
                        </div>
                    </div>
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
<div class="modal fade" id="UpdateGuru">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_guru" onsubmit="edit_guru();return false;">
                    {{csrf_field()}}
                    <input type="hidden" name="id_guru" id="edit_id_guru" required>
                    <div class="row">
                        <div class="col">
                            <label for="">Nama</label>
                            <input type="text" class="form-control" name="nama_guru" id="edit_nama_guru" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Nik</label>
                            <input type="text" class="form-control" name="nik_guru" id="edit_nik_guru" maxlength="16"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Foto</label>
                            {{-- <input type="file" class="form-control" name="img_guru" id="img_guru" accept="image/*"> --}}
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="edit_img_guru" name="img_guru"
                                    accept="image/*">
                                <label class="custom-file-label" for="img_guru">Choose photo</label>
                                <small>**Kosongi jika tidak ingin diubah</small>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Jenis Kelamin</label>
                            <select name="jenis_kelamin_guru" id="edit_jenis_kelamin_guru" class="form-control">
                                <option value="Laki-Laki">Laki-Laki</option>
                                <option value="Perempuan">Perempuan</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tanggal Lahir</label>
                            <input type="date" class="form-control" name="tgl_lahir_guru" id="edit_tgl_lahir_guru"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Agama</label>
                            <select name="agama_guru" id="edit_agama_guru" class="form-control">
                                <option value="Islam">Islam</option>
                                <option value="Kristen">Kristen</option>
                                <option value="Katolik">Katolik</option>
                                <option value="Hindu">Hindu</option>
                                <option value="Budha">Budha</option>
                                <option value="Konghucu">Konghucu</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>No Telp</label>
                            <input type="text" class="form-control" name="no_telp_guru" id="edit_no_telp_guru"
                                maxlength="13"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Email</label>
                            <input type="email" class="form-control" name="email_guru" id="edit_email_guru" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Alamat</label>
                            <textarea name="alamat_guru" id="edit_alamat_guru" rows="3" class="form-control"
                                required></textarea>
                        </div>
                    </div>
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

    function add_guru() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-guru",
            processData:false,
            contentType:false,
            data:new FormData($('#save_guru')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add guru',
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
            url:'get-guru',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_id_guru').val(data[0].id_guru),
		    $('#edit_nik_guru').val(data[0].nik_guru),
		    $('#edit_nama_guru').val(data[0].nama_guru),
            $('#edit_jenis_kelamin_guru').val(data[0].jenis_kelamin_guru),
            $('#edit_tgl_lahir_guru').val(data[0].tgl_lahir_guru),
            $('#edit_alamat_guru').val(data[0].alamat_guru),
            $('#edit_agama_guru').val(data[0].agama_guru),
            $('#edit_no_telp_guru').val(data[0].no_telp_guru),
            $('#edit_email_guru').val(data[0].email_guru)
        })
    }

    function edit_guru() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('update_guru')}}",
            processData: false,
            contentType : false,
            data: new FormData($('#update_guru')[0]),
            type: 'post',
            method: 'post',
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                    'success',
                    'update guru',
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
                    url: 'delete-guru',
                    method : 'get',
                    data : {id:id}	
                }).done(function (data) {
                    Swal.close();
                    if (data == 'success') {
                        Swal.fire(
                            'success',
                            'delete guru',
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