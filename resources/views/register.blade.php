<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Monitoring | Register</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{asset('assets/css/fontawesome-free/css/all.min.css')}}">

    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{asset('assets/css/adminlte.min.css')}}">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>Monitoring</b>Online</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Register</p>

                <form onsubmit="login();return false;" method="post">
                    {{ csrf_field() }}
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Nis (ex 11110)" id="id_siswa_detail"
                            name="id_siswa_detail" maxlength="5"
                            oninput="this.value = this.value.replace(/[^0-9./]/g, '').replace(/(\..*)\./g, '$1');"
                            required>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-address-card"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" placeholder="Email" id="email" name="email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Password" id="password"
                            name="password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- /.col -->
                        <div class="col-8">
                            <a href="{{route('login')}}" style="font-size: 12px;">Login?</a>
                        </div>
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <!-- /.social-auth-links -->
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="{{asset('assets/js/jquery.min.js')}}"></script>
    <!-- Bootstrap 4 -->
    <script src="{{asset('assets/js/bootstrap.bundle.min.js')}}"></script>
    <!-- AdminLTE App -->
    <script src="{{asset('assets/js/adminlte.min.js')}}"></script>
    <script src="{{asset('assets/js/sweetalert2.all.min.js')}}"></script>
    <script>
        function login() {
            Swal.fire({
                html: 'Loading . . .',
                allowOutsideClick:false,
                onBeforeOpen: function() {
                    Swal.showLoading()
                }
            });
            var id_siswa_detail = $('#id_siswa_detail').val(); 
            var email = $('#email').val();
            var password = $('#password').val();
            $.ajax({
                url:'{{route('post_register')}}',
                headers: {
                    'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
                },
                method:'POST',
                data:{email : email,password:password,id_siswa_detail:id_siswa_detail}
                }).done(function (data) {
               
            })

            $.ajax({
                url:'{{route('post_register')}}',
                headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
                },
                method:'POST',
                dataType: 'json',
                data:{email : email,password:password,id_siswa_detail:id_siswa_detail},
                success:function (response) {
                    var msg = response.msg;
                    Swal.close();
                    if (response.RESULT == 'success') {
                        Swal.fire(
                        'Success',
                        msg,
                        'success'
                        );
                        location.href='login';
                    }else{
                        Swal.fire(
                        'Error',
                        msg,
                        'error'
                        );
                    }
                }
            })
        }
    </script>
</body>

</html>