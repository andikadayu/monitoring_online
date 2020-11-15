@extends('master')
@section('jurnal-active','active')
@section('title','Jurnal Harian')
@section('header','Jurnal Harian')
@section('content')
@if (session('role') == 'Siswa' && $last->tgl_jurnal != date('Y-m-d'))
<div class="row" id="AddJurnal">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Jurnal Harian</h3>
            </div>
            <div class="card-body">
                <form id="save_jurnal" onsubmit="add_jurnal();return false;">
                    {{ csrf_field() }}
                    <input type="hidden" name="nis_siswa" id="nis_siswa" value="{{session('nis')}}" required>
                    <div class="row">
                        <div class="col-4">
                            <label for="">Tanggal</label><br>
                            <label for=""><?php echo date('Y-m-d')?></label>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Masuk</label>
                            <input type="time" class="form-control" id="jam_masuk" name="jam_masuk" required>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Keluar</label>
                            <input type="time" class="form-control" id="jam_keluar" name="jam_keluar" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="">Kegiatan Kerja</label>
                            <textarea name="kegiatan_kerja" id="summernote" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Prosedur Pengerjaan</label>
                            <textarea name="prosedur_kerja" id="summernotes" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Spesifikasi Bahan</label>
                            <textarea name="spesifikasi_bahan" id="summernotess" class="form-control"></textarea>
                        </div>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
            </div>
            </form>
        </div>
    </div>
</div>
@endif

<div class="row" id="UpdateJurnal">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Update Jurnal Harian</h3>
            </div>
            <div class="card-body">
                <form id="update_jurnal" onsubmit="edit_jurnal();return false;">
                    {{ csrf_field() }}
                    <input type="hidden" name="id_jurnal" id="id_jurnal" required>
                    <input type="hidden" name="nis_siswa" id="nis_siswa" value="{{session('nis')}}" required>
                    <div class="row">
                        <div class="col-4">
                            <label for="">Tanggal</label>
                            <p id="edit_tgl_jurnal"></p>
                            
                        </div>
                        <div class="col-4">
                            <label for="">Jam Masuk</label>
                            <input type="time" class="form-control" id="edit_jam_masuk" name="jam_masuk" required>
                        </div>
                        <div class="col-4">
                            <label for="">Jam Keluar</label>
                            <input type="time" class="form-control" id="edit_jam_keluar" name="jam_keluar" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <label for="">Kegiatan Kerja</label>
                            <textarea name="kegiatan_kerja" id="summernoteUpdate" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Prosedur Pengerjaan</label>
                            <textarea name="prosedur_kerja" id="summernotesUpdate" class="form-control"></textarea>
                        </div>
                        <div class="col-lg-4">
                            <label for="">Spesifikasi Bahan</label>
                            <textarea name="spesifikasi_bahan" id="summernotessUpdate" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="alert alert-danger alert-dismissible" id="error_log">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        <h5><i class="icon fas fa-ban"></i> Alert!</h5>
                        <h6 id="error_msg"></h6>
                    </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer">
                <input type="submit" value="Submit" class="btn btn-primary">
            </div>
            </form>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Jurnal Harian</h3>
            </div>
            <div class="card-body">
                <button class="btn btn-success" onclick="$('#viewReport').modal('show');"><i class="fas fa-file-pdf">Cetak PDF</i></button>
                {{-- show data  --}}
                <div class="table-responsive">
                    <table class="table table-hover table-striped" id="datatables">
                        <thead>
                            <tr>
                                <th width="5%">#</th>
                                <th width="8%">NIS Siswa</th>
                                <th width="20%">Nama</th>
                                <th width="20%">Tempat</th>
                                <th width="8%">Status</th>
                                <th width="12%">Tgl</th>
                                <th width="10%">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no=1;
                            @endphp
                            @foreach ($jurnal as $j)
                            <tr>
                                <td>{{$no++}}</td>
                                <td>{{$j->nis_siswa}}</td>
                                <td class="text-dikit">{{$j->nama_siswa}}</td>
                                <td class="text-dikit">{{$j->detail_tempat}}</td>
                                <td>
                                    @if ($j->is_valid == '0')
                                    <span class="badge bg-warning">Pending</span>
                                @elseif($j->is_valid == '2')
                                <span class="badge bg-danger">Revision</span></td>
                                @else
                                <span class="badge bg-success">Done</span>
                                @endif
                                </td>
                                <td>{{$j->tgl_jurnal}}</td>
                                <td>
                                    @if (session('role')=='Pembimbing' && $j->is_valid == '0')
                                    <button class="btn btn-success btn-sm" onclick="accept_data({{$j->id_jurnal}});">
                                        <i class="fas fa-thumbs-up
">
                                        </i>
                                        Accept
                                    </button>
                                    <button class="btn btn-danger btn-sm mt-1 mb-1"
                                        onclick="reject_data({{$j->id_jurnal}});">
                                        <i class="fas fa-thumbs-down
">
                                        </i>
                                        Reject
                                    </button>
                                    @endif
                                    @if (session('role')=='Siswa' && $j->is_valid == '2')
                                    <button class="btn btn-warning btn-sm" onclick="get_data({{$j->id_jurnal}});">
                                        <i class="fas fa-edit">
                                        </i>
                                        Edit
                                    </button>
                                    @endif
                                    <button class="btn btn-info btn-sm" id="viewData"
                                        onclick="view_data({{$j->id_jurnal}});">
                                        <i class="fas fa-eye">
                                        </i>
                                        View
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

<div class="modal fade" id="viewJurnal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">View Jurnal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-6">
                        <label for="">Nis:</label>
                        <p id="vNis"></p>
                    </div>
                    <div class="col-6">
                        <label for="">Tanggal:</label>
                        <p id="vTanggal"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label for="">Jam Masuk</label>
                        <p id="vJMasuk"></p>
                    </div>
                    <div class="col-6">
                        <label for="">Jam Keluar</label>
                        <p id="vJKeluar"></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <label for="">Kegiatan Kerja</label>
                        <p id="vKegiatan"></p>
                    </div>
                    <div class="col-lg-4">
                        <label for="">Prosedur Pengerjaan</label>
                        <p id="vProsedur"></p>
                    </div>
                    <div class="col-lg-4">
                        <label for="">Spesifikasi Bahan</label>
                        <p id="vSpesifikasi"></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="viewReject">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Reject Jurnal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="FormReject" onsubmit="reject_proses();return false;">
                <div class="modal-body">
                    <input type="hidden" name="id_jurnal" id="id_reject" required>
                    <label for="">Permasalahan :</label><br>
                    <input type="checkbox" name="catatan[]" id="catatan" class="custom-checkbox" value="Penjelasan Kurang Lengkap" multiple>
                    <label for="catatan">Penjelasan Kurang Lengkap</label><br>
                    <input type="checkbox" name="catatan[]" id="catatan1" class="custom-checkbox" value="Bahasa Tidak Sesuai EYD" multiple>
                    <label for="catatan1">Bahasa Tidak Sesuai EYD</label><br>
                    <input type="checkbox" name="catatan[]" id="catatan2" class="custom-checkbox" value="Penulisan Jurnal Tidak Sesuai Format" multiple>
                    <label for="catatan2">Penulisan Jurnal Tidak Sesuai Format</label><br>
                    <input type="checkbox" id="catatanlain" class="custom-checkbox" onclick="click_lainnya();">
                    <label for="catatanlain" onclick="click_lainnya();">lainnya</label>
                    <input type="text" class="form-control" name="catatan[]" id="catatan3" readonly>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="viewReport">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Report Jurnal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                <div class="modal-body">
                    @if (session('role') == 'Pembimbing' || session('role') == 'Admin' )
                        <label for="">Tempat Prakerin</label>
                        <select name="id_tempat" id="s_tempat" class="form-control select2" onchange="c_tempat()">
                            <option value="" selected disabled>--Pilih Tempat--</option>
                            @foreach ($tempat as $tem)
                                <option value="{{$tem->id_tempat_prakerin}}">{{$tem->detail_tempat}}</option>
                            @endforeach
                        </select>
                        <label for="">Nama Siswa</label>
                        <select name="nis_siswa" id="s_siswa" class="form-control select2">
                            <option value="">--Pilih Siswa--</option>
                        </select>
                    @endif
                    @if (session('role') == 'Siswa')
                        <input type="hidden" name="nis_siswa" id="s_siswa" value="{{session('nis')}}">
                    @endif
                    <label for="">Jangka Waktu</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">
                            <i class="far fa-calendar-alt"></i>
                          </span>
                        </div>
                        <input type="text" name="tgl_jurnal"  class="form-control float-right" id="reservation">
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="button" onclick="report_proses()" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
        </div>
    </div>
</div>

@endsection
@section('js')
<script>
    $(function () {
        $('#UpdateJurnal').hide();
        $('#error_log').hide();
        $('#reservation').daterangepicker();
    })

    function c_tempat() {
        var id = $('#s_tempat').val();
        show_loading();
        $.ajax({
            url:'c_tempat',
            method:'GET',
            data:{id:id},
        }).done(function (data) {
            Swal.close();   
            $('#s_siswa').html(data);
        })
    }

    function show_loading() {
        Swal.fire({
            html: 'Loading . . .',
            allowOutsideClick: false,
            onBeforeOpen: function () {
                Swal.showLoading()
            }
        });
    }

    function add_jurnal() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "add-jurnal",
            processData: false,
            contentType: false,
            data: new FormData($('#save_jurnal')[0]),
            type: 'post',
            method: 'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                    'success',
                    'add jurnal',
                    'success'
                );
                location.reload();
            } else {
                Swal.fire(
                    'error',
                    'invalid form',
                    'error'
                );
            }
        })
    }

    function view_data(id) {
        $('#viewJurnal').modal('show');
        show_loading();
        $.ajax({
            url: 'view-jurnal',
            method: 'get',
            data: { id: id },
        }).done(function (data) {
            Swal.close();
            $('#vNis').text(data[0].nis_siswa),
                $('#vTanggal').text(data[0].tgl_jurnal),
                $('#vJMasuk').text(data[0].jam_masuk),
                $('#vJKeluar').text(data[0].jam_keluar),
                $('#vKegiatan').html(data[0].kegiatan_kerja),
                $('#vProsedur').html(data[0].prosedur_kerja),
                $('#vSpesifikasi').html(data[0].spesifikasi_bahan)
        })
    }

    function get_data(id) {
        show_loading(); $('#UpdateJurnal').show(); $('#AddJurnal').hide();
        $.ajax({
            url: 'view-jurnal',
            method: 'get',
            data: { id: id },
        }).done(function (data) {
            $('#error_log').show();
            Swal.close();
            $('#id_jurnal').val(data[0].id_jurnal),
                $('#edit_tgl_jurnal').text(data[0].tgl_jurnal),
                $('#edit_jam_masuk').val(data[0].jam_masuk),
                $('#edit_jam_keluar').val(data[0].jam_keluar),
                $('#summernoteUpdate').summernote('code', data[0].kegiatan_kerja),
                $('#summernotesUpdate').summernote('code', data[0].prosedur_kerja),
                $('#summernotessUpdate').summernote('code', data[0].spesifikasi_bahan),
                $('#error_msg').text(data[0].catatan)
        })
    }

    function edit_jurnal() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "edit-jurnal",
            processData: false,
            contentType: false,
            data: new FormData($('#update_jurnal')[0]),
            type: 'post',
            method: 'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Swal.fire(
                    'success',
                    'udpate jurnal',
                    'success'
                );
                location.reload();
            } else {
                Swal.fire(
                    'error',
                    'invalid form',
                    'error'
                );
            }
        })
    }

    function accept_data(id) {
        show_loading();
        $.ajax({
            url: 'accept-jurnal',
            method: 'GET',
            data: { id: id },
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Toast.fire({
                    icon: 'success',
                    title: 'Success Accept Data'
                })
                $('#datatables').load('jurnal #datatables');
            } else {
                Toast.fire({
                    icon: 'error',
                    title: 'Error Accept Data'
                });
            }
        })
    }

    function reject_data(id) {
        $('#viewReject').modal('show');
        $('#id_reject').val(id);
    }

    function reject_proses() {
        show_loading();
        $.ajax({
            headers: {
                'x-csrf-token': $('meta[name="csrf-token"]').attr('content')
            },
            url: "reject-jurnal",
            processData: false,
            contentType: false,
            data: new FormData($('#FormReject')[0]),
            type: 'post',
            method: 'post'
        }).done(function (data) {
            Swal.close();
            if (data == 'success') {
                Toast.fire({
                    icon: 'success',
                    title: 'Success Reject Data'
                })
                setTimeout(function () {
                    location.reload();
                },1500);
            } else {
                Toast.fire({
                    icon: 'error',
                    title: 'Error Reject Data'
                });
            }
        })
    }

    function report_proses() {
        show_loading();
        var nis_siswa = $('#s_siswa').val();
        var tgl_jurnal = $('#reservation').val();
        $.ajax({
            url: "report-jurnal",
            data: {
                nis_siswa:nis_siswa,
                tgl_jurnal : tgl_jurnal
            },
            method: 'GET'
        }).done(function (data) {
            Swal.close();
            window.open("report-jurnal?nis_siswa="+nis_siswa+"&tgl_jurnal="+tgl_jurnal,"_blank");
            location.reload();
        })

    }



    function click_lainnya() {
        if ($('#catatanlain').is(':checked')) {
            $('#catatan3').removeAttr('readonly');
            $('#catatan3').val('');
        } else {
            $('#catatan3').attr('readonly',true);
            $('#catatan3').val('');
        }
    }
</script>
@endsection