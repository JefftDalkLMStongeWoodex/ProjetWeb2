<?php

namespace App\Http\Controllers;

use App\Models\Commande;
use Illuminate\Http\Request;
use Inertia\Inertia;

use App\Models\Voiture;
use App\Models\Taxe;
use App\Models\Province;
use Lang;
use Mail;
use PDF;

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
    public function create()
    {
        $panier = Voiture::where('voitures.id','>', '5')
        ->join('modeles', function($join) {
            $join->on('voitures.modeles_id','=','modeles.id')->join('constructeurs', function($join){
                $join->on('modeles.constructeurs_id','=','constructeurs.id');
            });
        })
        ->get([
            'voitures.id',
            'voitures.prix_paye AS prix',
            'voitures.annee',
            'modeles.nom AS modeles',
            'constructeurs.nom AS constructeurs',
        ]);
        $taxes = Taxe::all();
        $provinces = Province::all();
        foreach($panier as $voiture) {
            $voiture['prix'] *= 1.25;
            $voiture['imagePrincipale'] = $voiture->imagePrincipale($voiture['id']);
        }
        return Inertia::render('Checkout', [
            'langAppLayout' => Lang::get('app_layout'),
            'langCheckout' => Lang::get('checkout'),
            'panier' => $panier,
            'taxes' => $taxes,
            'provinces' => $provinces
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
        //
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
