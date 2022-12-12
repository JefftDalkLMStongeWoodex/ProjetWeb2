<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

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

    public function selectImageTableauDeBoard($idVoiture, $locale) {
        $colonne_nom = "nom";
        $colonne_alt = "alt";
        
        if ($locale == "en") {
            $colonne_nom .= "_en";
            $colonne_alt .= "_en";
        }

        return DB::select(
            'SELECT id, ' . $colonne_nom . ', chemin, ' . $colonne_alt . ', image_principale, voitures_id
            FROM images
            WHERE voitures_id = ' . $idVoiture
        );
    }
}
