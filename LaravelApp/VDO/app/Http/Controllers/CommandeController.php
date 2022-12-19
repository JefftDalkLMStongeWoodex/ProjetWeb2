<?php

namespace App\Http\Controllers;

use App\Models\Commande;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

use App\Models\Voiture;
use App\Models\Taxe;
use App\Models\Province;
use App\Models\Ville;
use App\Models\ModePaiement;
use App\Models\ModeExpedition;
use Lang;
use Mail;
use PDF;
use Auth;

class CommandeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $panier)
    {
        $user = Auth::user();
        $panier = $panier->all();
        $villes = Ville::all();
        $provinces = Province::all();
        $taxes = Taxe::all();
        $modePaiement = ModePaiement::all(); 
        $modeExpedition = ModeExpedition::all();
        
        $user_ville = $user->ville;
        $user_province = $user_ville->province;
        $user_taxes = $user_province->taxes;

        $modeleVoiture = new Voiture;

        foreach ($panier as &$voiture) {
            $voiture["prix"] = $voiture["prix_paye"] * 1.25;
            $voiture["imagePrincipale"] = $modeleVoiture->imagePrincipale($voiture["id"]);
        }

        return Inertia::render('Checkout', [
            'langAppLayout' => Lang::get('app_layout'),
            'langCheckout' => Lang::get('checkout'),
            'panier' => $panier,
            'user_ville' => $user_ville,
            'user_province' => $user_province,
            'user_taxes' => $user_taxes,
            'modePaiement' => $modePaiement,
            'modeExpedition' => $modeExpedition
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $users_id = Auth::user()->id;
        $panier = $request->panier;
        $modeleVoiture = new Voiture;
        $erreurs = [];
        
        foreach($panier as $voiture) {
            if (!$modeleVoiture->estDisponible($voiture["id"])) {
                $erreurs[] = "La voiture " . $voiture["id"] . " n'est pas présentement disponible.";
            }
        }
        
        if (count($erreurs) == 0) {
            foreach ($panier as $voiture) {
                $request->validate([
                    'mode_paiements_id' => 'required|exists:mode_paiements,id',
                    'mode_expeditions_id' => 'required|exists:mode_expeditions,id'
                ]);
                
                $commande = Commande::create([
                    'users_id' => $users_id,
                    'mode_paiements_id' => $request->mode_paiements_id,
                    'mode_expeditions_id' => $request->mode_expeditions_id,
                    'statut_commandes_id' => 2
                ]);

                $modeleVoiture->vendue($voiture["id"], $commande->id);
            }



            return Redirect::route('commande.confirmation')->with('succes_achat', 'L\'achat a été complété avec succès!');
        } else {
            return Redirect::back()->with('erreurs_checkout', $erreurs);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\commande  $commande
     * @return \Illuminate\Http\Response
     */
    public function show(commande $commande)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\commande  $commande
     * @return \Illuminate\Http\Response
     */
    public function edit(commande $commande)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\commande  $commande
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, commande $commande)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\commande  $commande
     * @return \Illuminate\Http\Response
     */
    public function destroy(commande $commande)
    {
        //
    }

    public function testCourriel() {
        $to_name = "Mathieu";
        $to_emails = ["vdomaisonneuve@gmail.com", "stng.mathieu@gmail.com"];
        $body = "Allo Mathieu, voici un courriel";

        Mail::send('email', $data = ['name'=>$to_name, 'body'=>$body], function ($message) use ($to_name, $to_emails) {
            $message->to($to_emails, $to_name)->subject("Courriel de test VDO");

            $pdf = PDF::loadView('facture', ['voiture' => 'Wow une voiture, bravo pour votre achat']);
            $message->attachData($pdf->output(), 'facture.pdf');
        });

        return redirect("/");
    }

    public function testPDF(voiture $voiture) {
        $pdf = PDF::loadView('facture', ['voiture' => 'Wow une voiture, bravo pour votre achat']);
        return $pdf->download('facture.pdf');
    }
}
