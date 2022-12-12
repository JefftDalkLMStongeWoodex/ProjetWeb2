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
        $voitures = Voiture::where('statut_voitures_id', '1')
        ->join('modeles', function($join) {
            $join->on('voitures.modeles_id','=','modeles.id')->join('constructeurs', function($join){
                $join->on('modeles.constructeurs_id','=','constructeurs.id');
            });
        })
        ->join('groupe_motopropulseurs', function($join) {
            $join->on('voitures.groupe_motopropulseurs_id','=','groupe_motopropulseurs.id');
        })
        ->join('transmissions', function($join) {
            $join->on('voitures.transmissions_id','=','transmissions.id');
        })
        ->join('carburants', function($join) {
            $join->on('voitures.carburants_id','=','carburants.id');
        })
        ->join('corps', function($join) {
            $join->on('voitures.corps_id','=','corps.id');
        })
        ->join('etats', function($join) {
            $join->on('voitures.etats_id','=','etats.id');
        })
        ->get([
            'voitures.id',
            'voitures.prix_paye AS prix',
            'voitures.kilometrage',
            'voitures.annee',
            'modeles.nom AS modeles',
            'constructeurs.nom AS constructeurs',
            'carburants.type AS carburants',
            'groupe_motopropulseurs.type AS groupeMotopropulseurs',
            'transmissions.type AS transmissions',
            'corps.type AS corps',
            'etats.nom AS etats',
        ]);

        // On ajout un taux de 25% pour la  marge de profit
        foreach($voitures as $voiture) {
            $voiture['prix'] *= 1.25;
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
