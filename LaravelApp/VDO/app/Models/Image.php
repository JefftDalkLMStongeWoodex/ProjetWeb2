<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'nom_en',
        'chemin',
        'alt',
        'alt_en',
        'image_principale',
        'voitures_id'
    ];
}
