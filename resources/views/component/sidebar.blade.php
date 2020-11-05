<aside class="main-sidebar sidebar-dark-primary elevation-4">
  <!-- Brand Logo -->
  <a href="{{url()->current()}}" class="brand-link">
    <img src="{{asset('assets/img/sideicon.png')}}" alt="AdminLTE Logo" class="brand-image img-circle">
    <span class="brand-text font-weight-light">Monitoring Online</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
      <div class="image">
        @if (session('role')!= 'Admin')
        @if (session('role') == 'Pembimbing')
        <img src="{{url('storage/app/public/pembimbing/')}}/{{session('photo')}}" class="img-circle elevation-2"
          alt="User Image">
        @else
        <img src="{{url('storage/app/public/siswa/')}}/{{session('photo')}}" class="img-circle elevation-2"
          alt="User Image">
        @endif
        @else
        <img src="{{asset('assets/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image">
        @endif
      </div>
      <div class="info">
        <a href="#" class="d-block text-wrap">{{session('nama_user')}}</a>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
        <li class="nav-item">
          <a href="{{route('dashboard')}}" class="nav-link @yield('dash-active')">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
            </p>
          </a>
        </li>
        @if (session('role') == 'Admin')
        <li class="nav-item has-treeview @yield('datas')">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-network-wired"></i>
            <p>
              Data Prakerin
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="{{route('siswa')}}" class="nav-link @yield('siswa-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Siswa</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('pembimbing')}}" class="nav-link @yield('pembimbing-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Pembimbing</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('tempat_prakerin')}}" class="nav-link @yield('tempat-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Tempat Prakerin</p>
              </a>
            </li>
          </ul>
        </li>
        <li class="nav-item has-treeview @yield('masters')">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-book"></i>
            <p>
              Master Data
              <i class="right fas fa-angle-left"></i>
            </p>
          </a>
          <ul class="nav nav-treeview">
            <li class="nav-item">
              <a href="{{route('guru')}}" class="nav-link @yield('guru-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Guru</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('kelas')}}" class="nav-link @yield('kelas-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Kelas</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('tahun_ajaran')}}" class="nav-link @yield('tahun-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Tahun Ajaran</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="{{route('users')}}" class="nav-link @yield('users-active')">
                <i class="far fa-circle nav-icon"></i>
                <p>Users</p>
              </a>
            </li>
          </ul>
        </li>
        @endif
        @if (session('role') == 'Pembimbing' || session('role') == 'Siswa')
        @if (session('role') == 'Pembimbing')
        <li class="nav-item">
          <a href="{{ route('monitoring')}}" class="nav-link @yield('monitoring-active')">
            <i class="nav-icon fas fa-tv"></i>
            <p>
              Monitoring Prakerin
            </p>
          </a>
        </li>
        @endif
        <li class="nav-item">
          <a href="{{route('jurnal')}}" class="nav-link @yield('jurnal-active')">
            <i class="nav-icon fas fa-book-open"></i>
            <p>
              Jurnal Harian
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{route('laporan')}}" class="nav-link @yield('laporan-active')">
            <i class="nav-icon fas fa-book"></i>
            <p>
              Laporan Prakerin
            </p>
          </a>
        </li>
        @endif
        <li class="nav-item">
          <a href="{{ route('profile') }}" class="nav-link @yield('profile-active')">
            <i class="nav-icon fas fa-key"></i>
            <p>
              Ganti Password
            </p>
          </a>
        </li>
        <li class="nav-item">
          <a href="{{route('logout')}}" class="nav-link">
            <i class="nav-icon fas fa-sign-out-alt"></i>
            <p>
              Logout
            </p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- /.sidebar-menu -->
  </div>
  <!-- /.sidebar -->
</aside>