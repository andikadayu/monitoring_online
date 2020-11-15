@extends('master')
@section('profile-active','active')
@section('title','Profile')
@section('header','Profile - Ganti Password')
@section('content')
<div class="row">
    <div class="col-lg-7">
        <div class="card">
            <div class="card-header">
                <div class="card-title">
                    Form Ganti Password dan Gambar
                </div>
            </div>
            <form id="save_profile" method="POST" onsubmit="save_profile();return false;">
                <div class="card-body">
                    {{ csrf_field() }}
                    <input type="hidden" name="id" id="id"
                        value="@if(session('role')=='Siswa') {{$data[0]->nis_siswa}} @elseif(session('role')=='Pembimbing') {{$data[0]->id_pembimbing}} @endif">
                    <label for="">Email</label>
                    <input type="email" name="email" id="email" value="{{$data[0]->email}}" class="form-control"
                        readonly>
                    <label for="">Password</label>
                    <input type="password" name="password" id="password" value="{{$data[0]->password}}"
                        class="form-control" required>
                    <label for="">Profile</label>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="image" name="image" accept="image/*">
                        <label class="custom-file-label" for="img_siswa">Choose photo</label>
                        <small>**Kosongi jika tidak ingin diubah</small>
                    </div>
                </div>
                <div class="card-footer">
                    <input type="submit" value="Submit" class="btn btn-success">
                </div>
            </form>
        </div>
    </div>
    <div class="col-lg-5">
        <div class="card">
            <div class="card-header">
                <div class="card-title">
                    User Profile
                </div>
            </div>
            <div class="card-body">
                <div class="image text-center">
                    @if (session('role')!= 'Admin')
                    @if (session('role') == 'Pembimbing')
                    <img src="{{url('storage/pembimbing/')}}/{{session('photo')}}"
                        class="img-circle elevation-2" alt="User Image" style="height: 128px;width: 128px;">
                    @else
                    <img src="{{url('storage/siswa/')}}/{{session('photo')}}" class="img-circle elevation-2"
                        alt="User Image" style="height: 128px;width: 128px;">
                    @endif
                    @else
                    <img src="{{asset('assets/img/user2-160x160.jpg')}}" class="img-circle elevation-2"
                        alt="User Image" style="height: 128px;width: 128px;">
                    @endif
                    <h5>
                        @if(session('role') == 'Siswa' || session('role')=='Pembimbing')
                        {{$data[0]->nama}}
                        @elseif(session('role')=='Admin')
                        Administrator
                        @endif
                    </h5>
                    @if (session('role')=='Siswa')
                    <h6>{{$data[0]->nis_siswa}}</h6>
                    @endif
                </div>
                <div class="info">
                    <table class="table table-borderless">
                        <tr>
                            <td>Email</td>
                            <td>:</td>
                            <td>{{$data[0]->email}}</td>
                        </tr>
                        @if(session('role') == 'Siswa' || session('role')=='Pembimbing')
                        <tr>
                            <td>No Telp @if(session('role')=='Siswa')Ortu @endif</td>
                            <td>:</td>
                            <td>{{$data[0]->no}}</td>
                        </tr>
                        <tr>
                            <td>Alamat</td>
                            <td>:</td>
                            <td>{{$data[0]->alamat}}</td>
                        </tr>
                        @if(session('role')=='Siswa')
                        <tr>
                            <td>Tempat Prakerin</td>
                            <td>:</td>
                            <td>{{$data[0]->detail_tempat}}</td>
                        </tr>
                        @endif
                        @endif
                    </table>
                </div>
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

    function save_profile() {
        show_loading();
        $.ajax({
            headers:{
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"save-profile",
            processData:false,
            contentType:false,
            data:new FormData($('#save_profile')[0]),
            type:'post',
            method:'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                    'success',
                    'update profile',
                    'success'
                );
                location.href = 'logout';
            }else{
                Swal.fire(
                    'error',
                    'invalid form',
                    'error'
                );
            }
        })
    }

</script>
@endsection