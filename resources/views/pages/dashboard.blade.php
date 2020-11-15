@extends('master')
@section('dash-active','active')
@section('title','Dashboard')
@section('header','Dashboard')
@section('content')
<div class="row">
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
            <div class="inner">
                <h3 id="jPembimbing">{{$pembimbing}}</h3>

                <p>Pembimbing</p>
            </div>
            <div class="icon">
                <i class="fas fa-user-tie"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
            <div class="inner">
                <h3 id="jSiswa">{{$siswa}}</h3>

                <p>Siswa</p>
            </div>
            <div class="icon">
                <i class="fas fa-user-graduate"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
            <div class="inner">
                <h3 id="jTempat">{{$tempat}}</h3>

                <p>Tempat Prakerin</p>
            </div>
            <div class="icon">
                <i class="fas fa-university"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
            <div class="inner">
                <h3 id="jUser">{{$user}}</h3>

                <p>User</p>
            </div>
            <div class="icon">
                <i class="fas fa-users-cog"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
</div>
@if(session('role') == "Siswa")
<div class="row">
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
            <div class="inner">
                <h3 id="jPembimbing">{{$jJurnal}}</h3>

                <p>Jumlah Jurnal</p>
            </div>
            <div class="icon">
                <i class="fas fa-book-open"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
            <div class="inner">
                <h3 id="jSiswa">{{$jAcc}}</h3>

                <p>Jurnal Sudah Di ACC</p>
            </div>
            <div class="icon">
                <i class="fas fa-thumbs-up"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
            <div class="inner">
                <h3 id="jTempat">{{$jBelum}}</h3>

                <p>Jurnal Belum ACC</p>
            </div>
            <div class="icon">
                <i class="fas fa-thumbs-down"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
            <div class="inner">
                <h3 id="jUser">
                    @foreach ($sLaporan as $lp)
                        @if ($lp->lp_valid == 1)
                            Selesai
                        @elseif($lp->lp_valid == 0)
                            Belum
                        @else
                            Ditolak
                        @endif
                    @endforeach
                </h3>

                <p>Status Laporan</p>
            </div>
            <div class="icon">
                <i class="fas fa-file-pdf"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
</div>
@endif

@if(session('role') == 'Pembimbing' || session('role') == 'Admin')
<div class="row">
    {{-- Tabel Monitoring --}}
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-print mr-1"></i>
                    Monitoring
                </h3>
            </div>
            <div class="card-body table-responsive">
                <table class="table table-bordered table-hover table-sm " id="datatables">
                    <thead>
                        <th>No</th>
                        <th>Tempat</th>
                        <th>Pembimbing</th>
                        <th>Tanggal</th>
                        <th class="disabled-sorting text-right" width="5%">Action</th>
                    </thead>
                    <tbody>
                        <?php $no=1; ?>
                        @foreach($monitoring as $dt)
                        <tr>
                            <td>{{$no++}}</td>
                            <td>{{$dt->detail_tempat}}</td>
                            <td>{{$dt->nama_pembimbing}}</td>
                            <td>{{$dt->tgl_monitoring}}</td>
                            <td>
                                <button class='btn btn-warning btn-sm rounded-circle'><i class='fas fa-print' title='Print' onclick="cetak_pdf('{{Crypt::encryptString($dt->id_monitoring)}}')"></i></button>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    {{-- Statistik --}}
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-chart-bar mr-1"></i>
                    Chart Monitoring
                </h3>
            </div>
            <div class="card-body">
                <canvas id="myChart" height="75px" width="100%"></canvas>
            </div>
        </div>
    </div>    
</div>
@endif

@endsection
@section('js')
<script>
    $(document).ready(function () {
        $.ajax({
			url:'get-data-dashboard',
			method:'GET',
			type:'json',
		}).done(function (data) {
			var mnt = data.mnt;
			statistik_monitoring(mnt);
		})
    })

    function show_loading(){
        Swal.fire({
            html: 'Loading . . .',
            allowOutsideClick:false,
            onBeforeOpen: function() {
                Swal.showLoading()
            }
        });
    }

    function cetak_pdf(id) {
        show_loading();
        window.open('cetak-pdf?id='+id, '_blank');
        Swal.close();
    }

    function statistik_monitoring(mnt) {
		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx,{
			type: 'bar',
			data:{
				labels:['Jan','Feb','Mar','Apr','May','Jun','Jul','Agu','Sep','Oct','Nov','Dec'],
				datasets:[{
					label: '# of Monitoring',
					data:mnt,
					backgroundColor:[
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)',
					'rgba(111, 9, 219, 1)'
					],
					borderColor: [
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 162, 235, 1)'
					],
					borderWidth: 1
				}]
			},
			options:{
				animation : {
					animateScale : true,
					animateRotate: true,
					duration : 1500
				},
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true,
                            stepSize: 1,
                            steps : 1,
                            max:10,
                            stepValue:1
						}
					}]
				}
			}
		});
	}
</script>
@endsection