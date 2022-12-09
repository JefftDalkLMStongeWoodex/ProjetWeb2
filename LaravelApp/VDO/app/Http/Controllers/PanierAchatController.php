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

class PanierAchatController extends Controller
{
    //
    function index(){
        $voitures = Voiture::where('statut_voitures_id', '1')->get(['id', 'annee', 'prix_paye', 'kilometrage', 'corps_id','modeles_id', 'transmissions_id', 'groupe_motopropulseurs_id', 'carburants_id', 'commandes_id', 'etats_id']);
        foreach($voitures as $voiture) {
            $voiture['prix_paye'] *= 1.25;
        }
        return Inertia::render('voiture/index', [
            'langAppLayout' => Lang::get('app_layout'),
            'langCatalogue' => Lang::get('catalogue'),
            'voitures' => $voitures,
            'modele' => Modele::all(),
            'constructeur' => Constructeur::all(),
            'corps' => Corps::all(),
            'transmissions' => Transmission::all(),
            'groupeMotopropulseurs' => GroupeMotopropulseur::all(),
            'carburants' => Carburant::all(),
            'etats' => Etat::all(),
        ]);
    }



      /**
     * Display the specified resource.
     *
     * @param  \App\Models\Voiture  $voiture
     * @return \Illuminate\Http\Response
     */
    public function panier(Voiture $voiture)
    {
        $voiture->modele;
        $voiture->corps;
        $voiture->transmission;
        $voiture->groupeMotopropulseur;
        $voiture->carburant;
        $voiture->etat;
        $voiture->statut;
        $voiture->utilisateur;
        
        return Inertia::render('voiture/panier', [
            'voiture' => $voiture,
            'langVoiture' => Lang::get('voiture'),
            'langDashboard' => Lang::get('dashboard'),
        ]);
    }

}


