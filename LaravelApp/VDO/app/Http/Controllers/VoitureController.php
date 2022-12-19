<?php

namespace App\Http\Controllers;

use App\Models\Voiture;
use App\Models\Modele;
use App\Models\Transmission;
use App\Models\Corps;
use App\Models\GroupeMotopropulseur;
use App\Models\Carburant;
use App\Models\Etat;
use App\Models\StatutVoiture;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;
use Lang;
use Session;

class VoitureController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::check() && Auth::user()->estEmploye()) {
            $langVoiture = Lang::get('voiture');
            $modeleVoiture = new Voiture;
            $voitures = $modeleVoiture->selectVoitureTableauDeBord(session()->get('locale'));
            return Inertia::render('Dashboard/Voiture', [
                'langVoiture' => $langVoiture,
                'voitures' => $voitures,
                'langDashboard' => Lang::get('dashboard'),
            ]);
        } else {
            return redirect(route("dashboard"));
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (Auth::check() && Auth::user()->estEmploye()) {
            return Inertia::render('Dashboard/VoitureAjout', [
                'langVoiture' => Lang::get('voiture'),
                'langDashboard' => Lang::get('dashboard'),
                'modeles' => Modele::all(),
                'corps' => Corps::all(),
                'transmissions' => Transmission::all(),
                'groupeMotopropulseurs' => GroupeMotopropulseur::all(),
                'carburants' => Carburant::all(),
                'etats' => Etat::all(),
                'statuts' => StatutVoiture::all(),
                'users' => User::all()
            ]);
        } else {
            return redirect(route("dashboard"));
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (Auth::check() && Auth::user()->estEmploye()) {
            $request->validate([
                'modeles_id' => 'required|exists:modeles,id',
                'annee' => 'int|min:1901|max:' . date("Y"),
                'prix_paye' => 'required|numeric|min:0',
                'date_arrivee' => 'date',
                'kilometrage' => 'int|min:0',
                'corps_id' => 'exists:corps,id',
                'transmissions_id' => 'exists:transmissions,id',
                'groupe_motopropulseurs_id' => 'exists:groupe_motopropulseurs,id',
                'carburants_id' => 'exists:carburants,id',
                'etats_id' => 'exists:etats,id',
                'statut_voitures_id' => 'exists:statut_voitures,id',
                'reservation_users_id' => 'exists:users,id|nullable|required_if:statut_voitures_id,2',
                'description' => 'string|nullable',
                'description_en' => 'string|nullable'
            ]);
        
            $voiture = Voiture::create([
                'modeles_id' => $request->modeles_id,
                'annee' => $request->annee,
                'prix_paye' => $request->prix_paye,
                'date_arrivee' => $request->date_arrivee,
                'kilometrage' => $request->kilometrage,
                'corps_id' => $request->corps_id,
                'transmissions_id' => $request->transmissions_id,
                'groupe_motopropulseurs_id' => $request->groupe_motopropulseurs_id,
                'carburants_id' => $request->carburants_id,
                'etats_id' => $request->etats_id,
                'statut_voitures_id' => $request->statut_voitures_id,
                'reservation_users_id' => $request->reservation_users_id,
                'description' => $request->description,
                'description_en' => $request->description_en
            ]);

            return redirect(route('voiture.index'));
        } else {
            return redirect(route("dashboard"));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Voiture  $voiture
     * @return \Illuminate\Http\Response
     */
    public function show(Voiture $voiture)
    {
        if (Auth::check() && Auth::user()->estEmploye()) {
            $voiture->modele;
            $voiture->corps;
            $voiture->transmission;
            $voiture->groupeMotopropulseur;
            $voiture->carburant;
            $voiture->etat;
            $voiture->statut;
            $voiture->utilisateur;
            $erreurPrivilege = Session::get('erreurPrivilege');
            return Inertia::render('Dashboard/VoitureDetail', [
                'voiture' => $voiture,
                'langVoiture' => Lang::get('voiture'),
                'langDashboard' => Lang::get('dashboard'),
                'erreurPrivilege' => $erreurPrivilege
            ]);
        } else {
            return redirect(route("dashboard"));
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Voiture  $voiture
     * @return \Illuminate\Http\Response
     */
    public function edit(Voiture $voiture)
    {
        if (Auth::check() && Auth::user()->estEmploye()) {
            return Inertia::render('Dashboard/VoitureModification', [
                'voiture' => $voiture,
                'langVoiture' => Lang::get('voiture'),
                'langDashboard' => Lang::get('dashboard'),
                'modeles' => Modele::all(),
                'corps' => Corps::all(),
                'transmissions' => Transmission::all(),
                'groupeMotopropulseurs' => GroupeMotopropulseur::all(),
                'carburants' => Carburant::all(),
                'etats' => Etat::all(),
                'statuts' => StatutVoiture::all(),
                'users' => User::all()
            ]);
        } else {
            return redirect(route("dashboard"));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Voiture  $voiture
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Voiture $voiture)
    {
        if (Auth::check() && Auth::user()->estEmploye()) {
            $request->validate([
                'modeles_id' => 'required|exists:modeles,id',
                'annee' => 'int|min:1901|max:' . date("Y"),
                'prix_paye' => 'required|numeric|min:0',
                'date_arrivee' => 'date',
                'kilometrage' => 'int|min:0',
                'corps_id' => 'exists:corps,id',
                'transmissions_id' => 'exists:transmissions,id',
                'groupe_motopropulseurs_id' => 'exists:groupe_motopropulseurs,id',
                'carburants_id' => 'exists:carburants,id',
                'etats_id' => 'exists:etats,id',
                'statut_voitures_id' => 'exists:statut_voitures,id',
                'reservation_users_id' => 'exists:users,id|nullable|required_if:statut_voitures_id,2',
                'description' => 'string|nullable',
                'description_en' => 'string|nullable',
            ]);

            $voiture->update([
                'modeles_id' => $request->modeles_id,
                'annee' => $request->annee,
                'prix_paye' => $request->prix_paye,
                'date_arrivee' => $request->date_arrivee,
                'kilometrage' => $request->kilometrage,
                'corps_id' => $request->corps_id,
                'transmissions_id' => $request->transmissions_id,
                'groupe_motopropulseurs_id' => $request->groupe_motopropulseurs_id,
                'carburants_id' => $request->carburants_id,
                'etats_id' => $request->etats_id,
                'statut_voitures_id' => $request->statut_voitures_id,
                'reservation_users_id' => $request->reservation_users_id,
                'description' => $request->description,
                'description_en' => $request->description_en,
            ]);

            return redirect(route('voiture.show', $voiture->id));
        } else {
            return redirect(route("dashboard"));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Voiture  $voiture
     * @return \Illuminate\Http\Response
     */
    public function destroy(Voiture $voiture)
    {
        if (Auth::check() && Auth::user()->estAdmin()) {
            $voiture->delete();
            return redirect(route('voiture.index'));
        } else {
            redirect(route('voiture.show', $voiture))->with(['erreurPrivilege' => true]);
        }
    }
}
