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
                <h3 id="jPembimbing"></h3>

                <p>Pembimbing</p>
            </div>
            <div class="icon">
                <i class="ion ion-bag"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
            <div class="inner">
                <h3 id="jSiswa"></h3>

                <p>Siswa</p>
            </div>
            <div class="icon">
                <i class="ion ion-stats-bars"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
            <div class="inner">
                <h3 id="jTempat"></h3>

                <p>Tempat Prakerin</p>
            </div>
            <div class="icon">
                <i class="ion ion-person-add"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
            <div class="inner">
                <h3 id="jUser"></h3>

                <p>User</p>
            </div>
            <div class="icon">
                <i class="ion ion-pie-graph"></i>
            </div>
        </div>
    </div>
    <!-- ./col -->
</div>
@endsection
@section('js')
<script>
    $(document).ready(function () {
        $.ajax({
            url : 'get-data-dashboard',
            method : 'GET',
        }).done(function (data) {
            $('#jPembimbing').text(data.pembimbing);
            $('#jSiswa').text(data.siswa);
            $('#jTempat').text(data.tempat);
            $('#jUser').text(data.user);
        })
    })
</script>
@endsection