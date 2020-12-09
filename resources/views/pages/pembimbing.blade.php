@extends('master')
@section('pembimbing-active','active')
@section('datas','menu-open')
@section('title','Pembimbing')
@section('header','Pembimbing')
@section('content')
{{-- Tambah Data  --}}
<div class="row" id="AddPembimibng">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Tambah Data</h3>
            </div>
            <div class="card-body">
                <form id="save_pembimbing" onsubmit="add_pembimbing();return false;">
                    {{ csrf_field() }}
                    <div class="row">
                        <div class="col-6">
                            <label for="">Nama</label>
                            <input type="text" class="form-control" id="nama_pembimbing" name="nama_pembimbing"
                                required>
                        </div>
                        <div class="col-6">
                            <label for="">Tanggal Lahir</label>
                            <input type="date" class="form-control" id="tgl_lahir_pembimbing"
                                name="tgl_lahir_pembimbing" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="">Agama</label>
                            <select name="agama_pembimbing" id="agama_pembimbing" class="form-control">
                                <option value="Islam">Islam</option>
                                <option value="Kristen">Kristen</option>
                                <option value="Katolik">Katolik</option>
                                <option value="Hindu">Hindu</option>
                                <option value="Budha">Budha</option>
                                <option value="Konghucu">Konghucu</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label for="">Jenis Kelamin</label>
                            <select name="jenis_kelamin_pembimbing" id="jenis_kelamin_pembimbing" class="form-control">
                                <option value="Laki-Laki">Laki-Laki</option>
                                <option value="Perempuan">Perempuan</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="">Alamat</label>
                            <textarea name="alamat_pembimbing" id="alamat_pembimbing" rows="1" class="form-control"
                                required></textarea>
                        </div>
                        <div class="col-6">
                            <label for="">No Telp</label>
                            <input type="text" class="form-control" name="no_telp_pembimbing" id="no_telp_pembimbing"
                                maxlength="13"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Email</label>
                            <input type="email" class="form-control" id="email_pembimbing" name="email_pembimbing"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="col">
                            <label for="">Image</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="img_pembimbing" name="img_pembimbing"
                                    accept="image/*">
                                <label class="custom-file-label" for="img_pembimbing">Choose photo</label>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
                <button type="reset" class="btn btn-secondary" onclick="$('#AddPembimibng').hide();">Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
{{-- Update Data  --}}
<div class="row" id="UpdatePembimbing">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Update Data</h3>
            </div>
            <div class="card-body">
                <form id="update_pembimbing" onsubmit="edit_pembimbing();return false;">
                    {{ csrf_field() }}
                    <input type="hidden" name="id_pembimbing" id="edit_id_pembimbing">
                    <div class="row">
                        <div class="col-6">
                            <label for="">Nama</label>
                            <input type="text" class="form-control" id="edit_nama_pembimbing" name="nama_pembimbing"
                                required>
                        </div>
                        <div class="col-6">
                            <label for="">Tanggal Lahir</label>
                            <input type="date" class="form-control" id="edit_tgl_lahir_pembimbing"
                                name="tgl_lahir_pembimbing" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="">Agama</label>
                            <select name="agama_pembimbing" id="edit_agama_pembimbing" class="form-control">
                                <option value="Islam">Islam</option>
                                <option value="Kristen">Kristen</option>
                                <option value="Katolik">Katolik</option>
                                <option value="Hindu">Hindu</option>
                                <option value="Budha">Budha</option>
                                <option value="Konghucu">Konghucu</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label for="">Jenis Kelamin</label>
                            <select name="jenis_kelamin_pembimbing" id="edit_jenis_kelamin_pembimbing"
                                class="form-control">
                                <option value="Laki-Laki">Laki-Laki</option>
                                <option value="Perempuan">Perempuan</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="">Alamat</label>
                            <textarea name="alamat_pembimbing" id="edit_alamat_pembimbing" rows="1" class="form-control"
                                required></textarea>
                        </div>
                        <div class="col-6">
                            <label for="">No Telp</label>
                            <input type="text" class="form-control" name="no_telp_pembimbing"
                                id="edit_no_telp_pembimbing" maxlength="13"
                                oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Email</label>
                            <input type="email" class="form-control" id="edit_email_pembimbing" name="email_pembimbing"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Password</label>
                            <input type="password" class="form-control" id="edit_password" name="password" required>
                        </div>
                        <div class="col">
                            <label for="">Image</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="edit_img_pembimbing"
                                    name="img_pembimbing" accept="image/*">
                                <label class="custom-file-label" for="img_pembimbing">Choose photo</label>
                                <small>*Kosongi Jika Tidak ingin dirubah</small>
                            </div>
                        </div>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
                <button type="reset" class="btn btn-secondary" onclick="$('#UpdatePembimbing').hide();">Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
{{-- Tampil data  --}}
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Pembimbing</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" onclick="Adding()">
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
                            @foreach ($pembimbing as $pb)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$pb->nama_pembimbing}}</td>
                                <td>{{$pb->no_telp_pembimbing}}</td>
                                <td>{{$pb->email_pembimbing}}</td>
                                <td>{{$pb->alamat_pembimbing}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" onclick="get_data({{$pb->id_pembimbing}});">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm"
                                        onclick="delete_data({{$pb->id_pembimbing}});">
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


@endsection
@section('js')
<script>
    function Adding(){
        $('#AddPembimibng').show();
        $('#UpdatePembimbing').hide();
    }

    $(function () {
        $('#AddPembimibng').hide();
        $('#UpdatePembimbing').hide();
    })

    function show_loading() {
        Swal.fire({
            html: 'Loading . . .',
            allowOutsideClick:false,
            onBeforeOpen: function() {
                Swal.showLoading()
            }
        });
    }

    function add_pembimbing() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-pembimbing",
            processData:false,
            contentType:false,
            data:new FormData($('#save_pembimbing')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add pembimbing',
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
        $('#AddPembimibng').hide();
        $('#UpdatePembimbing').show();
        show_loading();
        $.ajax({
            method:'get',
            url:'get-pembimbing',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_id_pembimbing').val(data[0].id_pembimbing),
		    $('#edit_nama_pembimbing').val(data[0].nama_pembimbing),
            $('#edit_jenis_kelamin_pembimbing').val(data[0].jenis_kelamin_pembimbing),
            $('#edit_tgl_lahir_pembimbing').val(data[0].tgl_lahir_pembimbing),
            $('#edit_alamat_pembimbing').val(data[0].alamat_pembimbing),
            $('#edit_agama_pembimbing').val(data[0].agama_pembimbing),
            $('#edit_no_telp_pembimbing').val(data[0].no_telp_pembimbing),
            $('#edit_email_pembimbing').val(data[0].email_pembimbing),
            $('#edit_password').val(data[0].password)
        })
    }

    function edit_pembimbing() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('update_pembimbing')}}",
            processData: false,
            contentType : false,
            data: new FormData($('#update_pembimbing')[0]),
            type: 'post',
            method: 'post',
            }).done(function (data) {
            Swal.close();
            if (data == 'success') {
            Swal.fire(
            'success',
            'update pembimbing',
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
        url: 'delete-pembimbing',
        method : 'get',
        data : {id:id}
    }).done(function (data) {
        Swal.close();
        if (data == 'success') {
        Swal.fire(
        'success',
        'delete pembimbing',
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