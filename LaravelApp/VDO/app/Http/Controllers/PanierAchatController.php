<?php

namespace App\Http\Controllers;

use App\Models\Voiture;
use App\Models\Modele;
use App\Models\Constructeur;
use App\Models\Transmission;
use App\Models\Corps;
use App\Models\GroupeMotopropulseur;
use App\Models\Carburant;
use App\Models\User;
use App\Models\Etat;
use Illuminate\Http\Request;
use Inertia\Inertia;

use Lang;
use Auth;

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
            'langAppLayout' => Lang::get('app_layout'),
            'langVoiture' => Lang::get('voiture'),
            'langDashboard' => Lang::get('dashboard'),
        ]);
    }

      /**
     * Display the specified resource.
     *
     * @param  \App\Models\Voiture  $voiture
     * @return \Illuminate\Http\Response
     */
    public function fiche(Voiture $voiture)
    {
        $voiture->modele;
        $voiture->modele->constructeur;
        $voiture->corps;
        $voiture->transmission;
        $voiture->groupeMotopropulseur;
        $voiture->carburant;
        $voiture->etat;
        $voiture->statut;
        $voiture->utilisateur;
        
        $voiture['imagePrincipale'] = $voiture->imagePrincipale($voiture->id);
        $voiture['images'] = $voiture->images($voiture->id);
        
        return Inertia::render('voiture/fiche', [
            'voiture' => $voiture,
            'langVoiture' => Lang::get('voiture'),
            'langDashboard' => Lang::get('dashboard'),
            'langCatalogue' => Lang::get('catalogue'),
            'langAppLayout' => Lang::get('app_layout'),
        ]);
    }

    public function reservation(Voiture $voiture)
    {
        if(Auth::check()) {
            $user = Auth::user();
            $voiture->update(['statut_voitures_id'=>2,'reservation_users_id'=>$user->id]);
        }
        else {
            return redirect(route("login"));
        }
    }






}



