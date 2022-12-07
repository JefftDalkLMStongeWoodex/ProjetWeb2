<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Voiture;
use App\Models\Modele;
use App\Models\Constructeur;

use Lang;

class CatalogueController extends Controller
{
    //
    function index(){
        $voiture = Voiture::where('statut_voitures_id', 1)->limit(25);
        $modele = Modele::all();
        $constructeur = Constructeur::all();
        $langCatalogue = Lang::get('catalogue');
        
        return Inertia::render('Dashboard/Voiture', [
            'langCatalogue' => $langCatalogue,
            'voitures' => $voiture,
            'modele' => $modele,
            'constructeur' => $constructeur,
        ]);
    }
}
