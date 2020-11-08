@extends('master')
@section('monitoring-active','active')
@section('datas','menu-open')
@section('title','Form Monitoring')
@section('header','Form Monitoring')
@section('content')
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Form Monitoring</h3>
            </div>
            <div class="card-body">
                <form action="{{url()->current()}}" method="get">
                    <div class="row">
                        <div class="col-5">
                            <label>Nama Tempat</label><br>
                            <select id="s_tempat_prakerin" name="tempat_prakerin" class="form-control">
                                <option value="">All</option>
                                @foreach ($tempat as $t)
                                <option value="{{base64_encode(($t->id_tempat_prakerin))}}">{{$t->detail_tempat}}
                                </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-6">
                            <label>Tahun Ajaran</label><br>
                            <select id="s_tahun_ajaran" name="tahun_ajaran" class="form-control">
                                <option value="">All</option>
                                @foreach ($tahun as $t)
                                <option value="{{base64_encode(($t->id_tahun_ajaran))}}">
                                    {{$t->tahun_awal}}/{{$t->tahun_akhir}} </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-1">
                            <label for=""></label><br>
                            <button type="submit" class="btn btn-secondary">Search</button>
                        </div>
                        <br>
                    </div>
                </form>
                <form action="POST" id="saveMonitoring" onsubmit="save_monitoring();return false;">
                    {{ csrf_field() }}
                    @php
                    $co = 0;
                    @endphp
                    @foreach ($siswa as $s)
                    <?php if($co == 1) break; ?>
                    <input type="hidden" name="id_tempat_prakerin" class="form-control" readonly=""
                        id="i_id_tempat_prakerin" required="" value="{{$s->id_tempat_prakerin}}">
                    <?php $co++; ?>
                    @endforeach
                    <div class="row">
                        <div class="col">
                            <label for="">Division</label>
                            <select name="division[]" id="division" multiple class="form-control select2"
                                style="width: 100%" required>
                                <option value="TIK">TIK</option>
                                <option value="Otomotif">Otomotif</option>
                                <option value="Elektro">Elektro</option>
                                <option value="Mesin">Mesin</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="">Tanggal Monitoring</label>
                            <input type="date" name="tgl_monitoring" id="tgl_monitoring" class="form-control"
                                value="<?php echo date('Y-m-d'); ?>" readonly required>
                        </div>
                    </div>
                    <br>
                    <h5>Rekap Permasalahan</h5>
                    <div class="row">
                        <div class="col">
                            <label for="">Evaluasi Hasil Kunjungan</label>
                            <textarea name="evaluasi_hasil" id="summernote" cols="30" rows="10"></textarea>
                        </div>
                        <div class="col">
                            <label for="">Penyelesaian</label>
                            <textarea name="penyelesaian" id="summernotes" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                    <h5>Rekap Monitoring Siswa Prakerin</h5>
                    <div class="row">
                        <table class="table table-bordered" id="datasiswa">
                            <thead>
                                <tr>
                                    <th width='11%'>NIS</th>
                                    <th width='35%'>Nama</th>
                                    <th width='35%'>Checklist Monitoring</th>
                                    <th width='19%'>Alpa Siswa</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($siswa as $dt)
                                <tr>
                                    <td>
                                        <input type='number' name='nis_siswa{{$dt->nis_siswa}}' readonly
                                            class='form-control' value='{{$dt->nis_siswa}}'>
                                    </td>
                                    <td>
                                        <label>{{$dt->nama_siswa}}</label>
                                    </td>
                                    <td>
                                        <div class='row'>
                                            <div class='col'>
                                                <input type='checkbox' name='check_jurnal{{$dt->nis_siswa}}'
                                                    id='check_jurnal_{{$dt->nis_siswa}}' class='custom-checkbox'
                                                    value='1'>
                                                <label class='form-check-label'
                                                    for='check_jurnal_{{$dt->nis_siswa}}'>Jurnal</label>
                                            </div>
                                            <div class='col'>
                                                <input type='checkbox' name='check_apd{{$dt->nis_siswa}}'
                                                    id='check_apd_{{$dt->nis_siswa}}' class='custom-checkbox' value='1'>
                                                <label class='form-check-label'
                                                    for='check_apd_{{$dt->nis_siswa}}'>APD</label>
                                            </div>
                                            <div class='col'>
                                                <input type='checkbox' name='check_rambut{{$dt->nis_siswa}}'
                                                    id='check_rambut_{{$dt->nis_siswa}}' class='custom-checkbox'
                                                    value='1'>
                                                <label class='form-check-label'
                                                    for='check_rambut_{{$dt->nis_siswa}}'>Rambut</label>
                                            </div>
                                        </div>
                                        <div class='row'>
                                            <div class='col'>
                                                <input type='checkbox' name='check_lksp{{$dt->nis_siswa}}'
                                                    id='check_lksp_{{$dt->nis_siswa}}' class='custom-checkbox'
                                                    value='1'>
                                                <label class='form-check-label'
                                                    for='check_lksp_{{$dt->nis_siswa}}'>LKSP</label>
                                            </div>
                                            <div class='col'>
                                                <input type='checkbox' name='check_kinerja{{$dt->nis_siswa}}'
                                                    id='check_kinerja_{{$dt->nis_siswa}}' class='custom-checkbox'
                                                    value='1'>
                                                <label class='form-check-label'
                                                    for='check_kinerja_{{$dt->nis_siswa}}'>Kinerja</label>
                                            </div>
                                            <div class='col'>
                                                <input type='checkbox' name='check_penampilan{{$dt->nis_siswa}}'
                                                    id='check_penampilan_{{$dt->nis_siswa}}' class='custom-checkbox'
                                                    value='1'>
                                                <label class='form-check-label'
                                                    for='check_penampilan_{{$dt->nis_siswa}}'>Penampilan</label>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <textarea name="alpa_siswa{{$dt->nis_siswa}}" id="alpa_siswa{{$dt->nis_siswa}}"
                                            cols="3" class="form-control" rows="3"></textarea>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
            </div>
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
                <a href="{{route('monitoring')}}" class="btn btn-danger">Back</a>
            </div>
            </form>
            <!-- /.card-body -->
        </div>
    </div>
</div>
@endsection
@section('js')
<script>
    $(function () {
        $('#s_tempat_prakerin').val("{{$request->get('tempat_prakerin')}}");
        $('#s_tahun_ajaran').val("{{$request->get('tahun_ajaran')}}");
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

    function save_monitoring() {
        show_loading();
        $.ajax({
            headers:{
            'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url:"{{route('add_monitoring')}}",
            processData:false,
            contentType:false,
            data:new FormData($('#saveMonitoring')[0]),
            type:'post',
            method:'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
            Swal.fire(
            'success',
            'add monitoring',
            'success'
            );
            location.href = '../monitoring';
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