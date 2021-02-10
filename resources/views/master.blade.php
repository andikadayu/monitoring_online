<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Monitoring | @yield('title')</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <link rel="icon" href="{{asset('assets/img/favicon.ico')}}" type="image/x-icon">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{asset('assets/css/fontawesome-free/css/all.min.css')}}">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  {{-- <link rel="stylesheet" href="{{asset('assets/css/tempusdominus-bootstrap-4.min.css')}}"> --}}
  <!-- Theme style -->
  <link rel="stylesheet" href="{{asset('assets/css/adminlte.min.css')}}">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="{{asset('assets/css/OverlayScrollbars.min.css')}}">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <link rel="stylesheet" href="{{asset('assets/css/dataTables.bootstrap4.min.css')}}">
  <link rel="stylesheet" href="{{asset('assets/summernote/summernote-bs4.min.css')}}">
  <link rel="stylesheet" href="{{asset('assets/select2/css/select2.min.css')}}">
  <link rel="stylesheet" href="{{asset('assets/select2/css/select2-bootstrap4.min.css')}}">
  <link rel="stylesheet" href="{{asset('assets/css/main.css')}}">
  <link rel="stylesheet" href="{{asset('assets/css/daterangepicker.css')}}">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">

    <!-- Navbar -->
    @include('component.navbar')
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    @include('component.sidebar')

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">@yield('header')</h1>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          @yield('content')
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    @include('component.footer')

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
      <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
  </div>
  <!-- ./wrapper -->

  <!-- jQuery -->
  <script src="{{asset('assets/js/jquery.min.js')}}"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="{{asset('assets/js/jquery-ui.min.js')}}"></script>
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <script>
    $.widget.bridge('uibutton', $.ui.button)
  </script>
  <!-- Bootstrap 4 -->
  <script src="{{asset('assets/js/bootstrap.bundle.min.js')}}"></script>

  <script src="{{asset('assets/js/date.js')}}"></script>
  <!-- ChartJS -->
  <script src="{{asset('assets/js/Chart.min.js')}}"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  {{-- <script src="{{asset('assets/js/tempusdominus-bootstrap-4.min.js')}}"></script> --}}
  <!-- overlayScrollbars -->
  <script src="{{asset('assets/js/jquery.overlayScrollbars.min.js')}}"></script>
  <!-- AdminLTE App -->
  <script src="{{asset('assets/js/adminlte.min.js')}}"></script>
  <script src="{{asset('assets/js/sweetalert2.all.min.js')}}"></script>
  <script src="{{asset('assets/js/jquery.dataTables.min.js')}}"></script>
  <script src="{{asset('assets/js/dataTables.bootstrap4.min.js')}}"></script>
  <script src="{{asset('assets/js/bs-custom-file-input.min.js')}}"></script>
  <script src="{{asset('assets/js/darkmode.min.js')}}"></script>
  <script src="{{asset('assets/summernote/summernote-bs4.min.js')}}"></script>
  <script src="{{asset('assets/select2/js/select2.full.min.js')}}"></script>
  <script src="{{asset('assets/js/moment.min.js')}}"></script>
  <script src="{{asset('assets/js/daterangepicker.js')}}"></script>
  <script>
    $(document).ready( function () {

    $('#datatables').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
    $('#datatables1').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
    bsCustomFileInput.init();

    $('.select2').select2({
      theme: 'bootstrap4'
    })

    $('#summernote').summernote({
      toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ],
      height:200
    });
    $('#summernotes').summernote({
      toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ],
      height:200
    });
    $('#summernotess').summernote({
      toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ],
      height:200
    });

    $('#summernoteUpdate').summernote({
      toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ],
      height:200
    });
    $('#summernotesUpdate').summernote({
      toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ],
      height:200
    });
    $('#summernotessUpdate').summernote({
      toolbar: [
      ['font', ['bold', 'underline', 'clear']],
      ['para', ['ul', 'ol', 'paragraph']],
      ],
      height:200
    });
} );
  </script>
  <script>
    new Darkmode({  label: '🌓'}).showWidget();
    const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
    });
  </script>
  @yield('js')
</body>

</html>