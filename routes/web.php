<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect('login');
});

// Login
Route::get('login', 'AULoginController@index')->name('login');
Route::post('post-login', 'AULoginController@post_login')->name('post_login');
Route::get('logout', 'AULoginController@logout')->name('logout');

// Register Siswa
Route::get('register', 'RegisterController@index')->name('register');
Route::post('post-register', 'RegisterController@post_register')->name('post_register');

Route::group(['middleware' => ['CekLogin']], function () {
    // Dashboard
    Route::get('dashboard', 'DashboardController@index')->name('dashboard');
    Route::get('get-data-dashboard', 'DashboardController@get_data')->name('get_data_dashboard');

    // User Profile 
    Route::get('user-profile', 'ProfileController@index')->name('profile');
    Route::post('save-profile', 'ProfileController@save_profile')->name('save_profile');

    // Master Tahun Ajaran 
    Route::get('tahun-ajaran', 'MasterTahunController@index')->name('tahun_ajaran');
    Route::post('add-tahun', 'MasterTahunController@add_tahun')->name('add_tahun');
    Route::get('get-tahun', 'MasterTahunController@get_tahun')->name('get_tahun');
    Route::post('update-tahun', 'MasterTahunController@update_tahun')->name('update_tahun');
    Route::get('delete-tahun', 'MasterTahunController@delete_tahun')->name('delete_tahun');

    // Master Tempat Prakerin 
    Route::get('tempat-prakerin', 'TempatPrakerinController@index')->name('tempat_prakerin');
    Route::post('add-tempat', 'TempatPrakerinController@add_tempat')->name('add_tempat');
    Route::get('get-tempat', 'TempatPrakerinController@get_tempat')->name('get_tempat');
    Route::post('update-tempat', 'TempatPrakerinController@update_tempat')->name('update_tempat');
    Route::get('delete-tempat', 'TempatPrakerinController@delete_tempat')->name('delete_tempat');

    // Master Guru
    Route::get('guru', 'MasterGuruController@index')->name('guru');
    Route::post('add-guru', 'MasterGuruController@add_guru')->name('add_guru');
    Route::get('get-guru', 'MasterGuruController@get_guru')->name('get_guru');
    Route::post('update-guru', 'MasterGuruController@update_guru')->name('update_guru');
    Route::get('delete-guru', 'MasterGuruController@delete_guru')->name('delete_guru');

    // Master Kelas
    Route::get('kelas', 'MasterKelasController@index')->name('kelas');
    Route::post('add-kelas', 'MasterKelasController@add_kelas')->name('add_kelas');
    Route::get('get-kelas', 'MasterKelasController@get_kelas')->name('get_kelas');
    Route::post('update-kelas', 'MasterKelasController@update_kelas')->name('update_kelas');
    Route::get('delete-kelas', 'MasterKelasController@delete_kelas')->name('delete_kelas');

    // Master Pembimbing
    Route::get('pembimbing', 'MasterPembimbingController@index')->name('pembimbing');
    Route::post('add-pembimbing', 'MasterPembimbingController@add_pembimbing')->name('add_pembimbing');
    Route::get('get-pembimbing', 'MasterPembimbingController@get_pembimbing')->name('get_pembimbing');
    Route::post('update-pembimbing', 'MasterPembimbingController@update_pembimbing')->name('update_pembimbing');
    Route::get('delete-pembimbing', 'MasterPembimbingController@delete_pembimbing')->name('delete_pembimbing');

    // Master Admin
    Route::get('users', 'MasterAdminController@index')->name('users');
    Route::post('add-admin', 'MasterAdminController@add_admin')->name('add_admin');
    Route::get('get-admin', 'MasterAdminController@get_admin')->name('get_admin');
    Route::post('update-admin', 'MasterAdminController@update_admin')->name('update_admin');
    Route::post('update-user', 'MasterAdminController@update_user')->name('update_user');
    Route::get('delete-user', 'MasterAdminController@delete_user')->name('delete_user');

    // Master Siswa
    Route::get('siswa', 'MasterSiswaController@index')->name('siswa');
    Route::post('add-siswa', 'MasterSiswaController@add_siswa')->name('add_siswa');
    Route::get('get-siswa', 'MasterSiswaController@get_siswa')->name('get_siswa');
    Route::post('update-siswa', 'MasterSiswaController@update_siswa')->name('update_siswa');
    Route::get('delete-siswa', 'MasterSiswaController@delete_siswa')->name('delete_siswa');

    // Laporan Prakerin 
    Route::get('laporan', 'LaporanPrakerinController@index')->name('laporan');
    Route::post('add-laporan', 'LaporanPrakerinController@add_laporan')->name('add_laporan');
    Route::get('get-laporan', 'LaporanPrakerinController@get_laporan')->name('get_laporan');
    Route::get('accept-laporan', 'LaporanPrakerinController@accept_laporan')->name('accept_laporan');
    Route::get('reject-laporan', 'LaporanPrakerinController@reject_laporan')->name('reject_laporan');
    Route::get('reset-laporan', 'LaporanPrakerinController@reset_laporan')->name('reset_laporan');
    Route::get('getting-laporan', 'LaporanPrakerinController@getting_laporan')->name('getting_laporan');
    Route::post('update-laporan', 'LaporanPrakerinController@update_laporan')->name('update_laporan');

    // Jurnal Harian 
    Route::get('jurnal', 'JurnalController@index')->name('jurnal');
    Route::post('add-jurnal', 'JurnalController@add_jurnal')->name('add_jurnal');
    Route::get('view-jurnal', 'JurnalController@view_jurnal')->name('view_jurnal');
    Route::post('edit-jurnal', 'JurnalController@edit_jurnal')->name('edit_jurnal');
    Route::get('accept-jurnal', 'JurnalController@accept_jurnal')->name('accept_jurnal');
    Route::post('reject-jurnal', 'JurnalController@reject_jurnal')->name('reject_jurnal');
    Route::get('c_tempat', 'JurnalController@c_tempat')->name('c_tempat');
    Route::get('report-jurnal', 'JurnalController@report_jurnal')->name('report_jurnal');

    // Monitoring Prakerin 
    Route::get('monitoring', 'MonitoringController@index')->name('monitoring');
    Route::get('monitoring/form-add', 'MonitoringController@form_monitoring')->name('form_monitoring');
    Route::post('monitoring/adding-monitoring', 'MonitoringController@add_monitoring')->name('add_monitoring');
    Route::get('cetak-pdf', 'MonitoringController@cetak_pdf')->name('cetak_pdf');
    Route::get('monitoring-excel', 'MonitoringController@cetak_excel')->name('monitoring_excel');

    // History
    Route::get('history', 'HistoryController@index')->name('history');
    Route::get('cetak-history', 'HistoryController@cetak_history')->name('cetak_history');
});
