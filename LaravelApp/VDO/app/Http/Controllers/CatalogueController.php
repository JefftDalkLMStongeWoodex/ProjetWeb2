<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Voiture;
use App\Models\Modele;
use App\Models\Constructeur;
use App\Models\Transmission;
use App\Models\Corps;
use App\Models\GroupeMotopropulseur;
use App\Models\Carburant;
use App\Models\Etat;
use Inertia\Inertia;

use Lang;

class CatalogueController extends Controller
{
    //
    function index(){
        $voitures = Voiture::where('statut_voitures_id', '1')->join('modeles', function($join) {
            $join->on('voitures.modeles_id','=','modeles.id')->join('constructeurs', function($join){
                $join->on('modeles.constructeurs_id','=','constructeurs.id');
            });
        })->get(['voitures.id','voitures.prix_paye AS prix','voitures.kilometrage','voitures.annee','modeles.nom AS modele','constructeurs.nom as constructeur','voitures.corps_id']);
        // On ajout un taux de 25% pour la  marge de profit
        foreach($voitures as $voiture) {
            $voiture['prix'] *= 1.25;
            $voiture['imagePrincipale'] = $voiture->imagePrincipale($voiture['id']);
        }
        
        return Inertia::render('Catalogue', [
            'langAppLayout' => Lang::get('app_layout'),
            'langCatalogue' => Lang::get('catalogue'),
            'voitures' => $voitures,
            'modeles' => Modele::all(),
            'constructeurs' => Constructeur::all(),
            'corps' => Corps::all(),
            'transmissions' => Transmission::all(),
            'groupeMotopropulseurs' => GroupeMotopropulseur::all(),
            'carburants' => Carburant::all(),
            'etats' => Etat::all(),
        ]);
    }
}
