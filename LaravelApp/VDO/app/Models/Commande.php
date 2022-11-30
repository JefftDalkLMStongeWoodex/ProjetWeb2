<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Commande extends Model
{
    use HasFactory;

    protected $fillable = [
        'users_id',
        'numero_transaction',
        'mode_paiements_id',
        'mode_expeditions_id',
        'statut_commandes_id'
    ];
}
