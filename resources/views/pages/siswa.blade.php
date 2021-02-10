@extends('master')
@section('siswa-active','active')
@section('datas','menu-open')
@section('title','Siswa')
@section('header','Siswa')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Master Siswa</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <form action="{{url()->current()}}" method="GET">
                            <select name="search" id="search" class="form-control select2">
                                <option value="" selected disabled>Pilih Tempat</option>
                                @foreach ($tempat as $t)
                                    <option value="{{$t->id_tempat_prakerin}}" @if($t->id_tempat_prakerin == $s) selected @endif>{{$t->detail_tempat}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-3">
                            <input type="submit" value="Search" class="btn btn-secondary">
                        </div>
                        </form>
                        <div class="col-md-5 text-right">
                            <button class="btn btn-success" data-toggle="modal" data-target="#AddSiswa">
                                <i class="fas fa-plus"></i> Tambah Data
                            </button>
                        </div>
                </div>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th>NIS</th>
                                <th>Nama</th>
                                <th>Telp Ortu</th>
                                <th>Kelas</th>
                                <th>Tempat Prakerin</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($siswa as $sis)
                            <tr>
                                <td>{{$sis->nis_siswa}}</td>
                                <td>{{$sis->nama_siswa}}</td>
                                <td>{{$sis->telp_ortu}}</td>
                                <td>{{$sis->detail_kelas}}</td>
                                <td>{{$sis->detail_tempat}}</td>
                                <td>
                                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#UpdateSiswa"
                                        onclick="get_data({{$sis->nis_siswa}});">
                                        <i class="fas fa-pencil-alt">
                                        </i>
                                        Edit
                                    </button>
                                    <button class="btn btn-danger btn-sm" onclick="delete_data({{$sis->nis_siswa}});">
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
<div class="modal fade" id="AddSiswa">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Tambah Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="save_siswa" onsubmit="add_siswa();return false;">
                    {{csrf_field()}}
                    <div class="row">
                        <div class="col">
                            <label for="">Nama</label>
                            <input type="text" class="form-control" name="nama_siswa" id="nama_siswa" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">NiS</label>
                            <input type="text" class="form-control" name="nis_siswa" id="nis_siswa" maxlength="5"
                                oninput="this.value = this.value.replace(/[^0-9./]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Foto</label>
                            {{-- <input type="file" class="form-control" name="img_siswa" id="img_siswa" accept="image/*"> --}}
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="img_siswa" name="img_siswa"
                                    accept="image/*">
                                <label class="custom-file-label" for="img_siswa">Choose photo</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Jenis Kelamin</label>
                            <select name="jenis_kelamin_siswa" id="jenis_kelamin_siswa" class="form-control">
                                <option value="Laki-Laki">Laki-Laki</option>
                                <option value="Perempuan">Perempuan</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tanggal Lahir</label>
                            <input type="date" class="form-control" name="tgl_lahir_siswa" id="tgl_lahir_siswa"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Agama</label>
                            <select name="agama_siswa" id="agama_siswa" class="form-control">
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
                            <label>Kelas</label>
                            <select name="id_kelas" id="id_kelas" class="form-control">
                                @foreach($kelas as $kls)
                                <option value="{{$kls->id_kelas}}">{{$kls->detail_kelas}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tempat Prakerin</label>
                            <select name="id_tempat_prakerin" id="id_tempat_prakerin" class="form-control select2">
                                @foreach($tempat as $tpt)
                                <option value="{{$tpt->id_tempat_prakerin}}">{{$tpt->detail_tempat}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>No Telp Ortu</label>
                            <input type="text" class="form-control" name="telp_ortu" id="telp_ortu" maxlength="15"
                                oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Nama Ortu</label>
                            <input type="text" class="form-control" name="nama_ortu" id="nama_ortu" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Alamat</label>
                            <textarea name="alamat_siswa" id="alamat_siswa" rows="1" class="form-control"
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
<div class="modal fade" id="UpdateSiswa">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Edit Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="update_siswa" onsubmit="edit_siswa();return false;">
                    {{csrf_field()}}
                    <div class="row">
                        <div class="col">
                            <label for="">Nama</label>
                            <input type="text" class="form-control" name="nama_siswa" id="edit_nama_siswa" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">NiS</label>
                            <input type="text" class="form-control" name="nis_siswa" id="edit_nis_siswa" maxlength="5"
                                oninput="this.value = this.value.replace(/[^0-9./]/g, '').replace(/(\..*)\./g, '$1');"
                                required readonly>
                        </div>
                        <div class="col">
                            <label for="">Foto</label>
                            {{-- <input type="file" class="form-control" name="img_siswa" id="img_siswa" accept="image/*"> --}}
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="edit_img_siswa" name="img_siswa"
                                    accept="image/*">
                                <label class="custom-file-label" for="img_siswa">Choose photo</label>
                                <small>**Kosongi jika tidak ingin diubah</small>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Jenis Kelamin</label>
                            <select name="jenis_kelamin_siswa" id="edit_jenis_kelamin_siswa" class="form-control">
                                <option value="Laki-Laki">Laki-Laki</option>
                                <option value="Perempuan">Perempuan</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tanggal Lahir</label>
                            <input type="date" class="form-control" name="tgl_lahir_siswa" id="edit_tgl_lahir_siswa"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Agama</label>
                            <select name="agama_siswa" id="edit_agama_siswa" class="form-control">
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
                            <label>Kelas</label>
                            <select name="id_kelas" id="edit_id_kelas" class="form-control">
                                @foreach($kelas as $kls)
                                <option value="{{$kls->id_kelas}}">{{$kls->detail_kelas}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tempat Prakerin</label>
                            <select name="id_tempat_prakerin" id="edit_id_tempat_prakerin" class="form-control select2">
                                @foreach($tempat as $tpt)
                                <option value="{{$tpt->id_tempat_prakerin}}">{{$tpt->detail_tempat}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label>No Telp Ortu</label>
                            <input type="text" class="form-control" name="telp_ortu" id="edit_telp_ortu" maxlength="15"
                                oninput="this.value = this.value.replace(/[^0-9+]/g, '').replace(/(\..*)\./g, '$1');"
                                required>
                        </div>
                        <div class="col">
                            <label for="">Nama Ortu</label>
                            <input type="text" class="form-control" name="nama_ortu" id="edit_nama_ortu" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="">Alamat</label>
                            <textarea name="alamat_siswa" id="edit_alamat_siswa" rows="1" class="form-control"
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

    function add_siswa() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"add-siswa",
            processData:false,
            contentType:false,
            data:new FormData($('#save_siswa')[0]),
            type:'post',
            method:'post'      
        }).done(function (data) {
            Swal.close();
                if (data == 'success') {
                    Swal.fire(
                        'success',
                        'add siswa',
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
            url:'get-siswa',
            data:{id:id}
        }).done(function (data) {
            Swal.close();
            $('#edit_nis_siswa').val(data[0].nis_siswa),
		    $('#edit_nama_siswa').val(data[0].nama_siswa),
            $('#edit_jenis_kelamin_siswa').val(data[0].jenis_kelamin_siswa),
            $('#edit_tgl_lahir_siswa').val(data[0].tgl_lahir_siswa),
            $('#edit_alamat_siswa').val(data[0].alamat_siswa),
            $('#edit_agama_siswa').val(data[0].agama_siswa),
            $('#edit_nama_ortu').val(data[0].nama_ortu),
		    $('#edit_telp_ortu').val(data[0].telp_ortu),
            $('#edit_id_kelas').val(data[0].id_kelas),
            $('#edit_id_tempat_prakerin').val(data[0].id_tempat_prakerin)
        })
    }

    function edit_siswa() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "{{route('update_siswa')}}",
            processData: false,
            contentType : false,
            data: new FormData($('#update_siswa')[0]),
            type: 'post',
            method: 'post',
            }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                    'success',
                    'update siswa',
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
            url: 'delete-siswa',
            method : 'get',
            data : {id:id}
            }).done(function (data) {
                Swal.close();
                if (data == 'success') {
                    Swal.fire(
                    'success',
                    'delete siswa',
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