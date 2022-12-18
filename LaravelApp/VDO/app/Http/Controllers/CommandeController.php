<?php

namespace App\Http\Controllers;

use App\Models\Commande;
use Illuminate\Http\Request;
use Inertia\Inertia;

use App\Models\Voiture;
use App\Models\Taxe;
use App\Models\Province;
use App\Models\Ville;
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
        
        $user_ville = $user->ville;
        $user_province = $user_ville->province;
        $user_taxes = $user_province->taxes;

        foreach ($panier as &$voiture) {
            $voiture["prix"] = $voiture["prix_paye"] * 1.25;
        }

        return Inertia::render('Checkout', [
            'langAppLayout' => Lang::get('app_layout'),
            'langCheckout' => Lang::get('checkout'),
            'panier' => $panier,
            'user_ville' => $user_ville,
            'user_province' => $user_province,
            'user_taxes' => $user_taxes
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
