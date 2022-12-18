<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ville extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'nom_en',
        'provinces_id'
    ];

    public function province() {
        return $this->hasOne('App\Models\Province', 'id', 'provinces_id');
    }
}
