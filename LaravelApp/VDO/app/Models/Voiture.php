<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Voiture extends Model
{
    use HasFactory;

    protected $fillable = [
        'annee',
        'date_arrivee',
        'prix_paye',
        'kilometrage',
        'description',
        'date_heure_reservation',
        'corps_id',
        'modeles_id',
        'transmissions_id',
        'groupe_motopropulseurs_id',
        'carburants_id',
        'commandes_id',
        'statut_voitures_id',
        'etats_id',
        'reservation_users_id'
    ];
}
