<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Province extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'nom_en'
    ];

    public function taxes() {
        return $this->hasMany('App\Models\Taxe', 'provinces_id', 'id');
    }
}
