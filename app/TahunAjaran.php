<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TahunAjaran extends Model
{
    protected $table = 'ms_tahun_ajaran';
    protected $primaryKey = 'id_tahun_ajaran';
    public $timestamps = null;
}
