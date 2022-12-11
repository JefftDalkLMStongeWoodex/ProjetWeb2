<?php

namespace App\Http\Controllers;

use App\Models\Image;
use App\Models\Voiture;
use Illuminate\Http\Request;
use Inertia\Inertia;

use Lang;

class ImageController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($idVoiture)
    {
        $modeleImage = new Image;
        $images = $modeleImage->selectImageTableauDeBoard($idVoiture, session()->get('locale'));
        return Inertia::render('Dashboard/Image', [
            'langImage' => Lang::get('image'),
            'langDashboard' => Lang::get('dashboard'),
            'idVoiture' => $idVoiture,
            'images' => $images
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($idVoiture)
    {
        return Inertia::render('Dashboard/ImageAjout', [
            'langImage' => Lang::get('image'),
            'langDashboard' => Lang::get('dashboard'),
            'idVoiture' => $idVoiture,
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
        if ($request->image_principale) {
            $testImagePrincipale = Image::where('image_principale', '1')->get();
            if ($testImagePrincipale->count() >= 1) {
                return Inertia::render('Dashboard/ImageAjout', [
                    'erreur_image' => 'Une image principale existe déjà pour cette voiture.',
                    'langImage' => Lang::get('image'),
                    'langDashboard' => Lang::get('dashboard'),
                    'idVoiture' => $request->voitures_id,
                ]);
            } 
        } else {
            $request->image_principale = false;
        }

        $request->validate([
            'nom' => 'string|max:100|nullable',
            'nom_en' => 'string|max:100|nullable', 
            'alt' => 'string|max:100|nullable',
            'alt_en' => 'string|max:100|nullable',
            'image_principale' => 'required|boolean',
            'image' => 'required|image|max:2048',
            'voitures_id' => 'exists:voitures,id'
        ]);

        $nom_fichier = 'voiture_' . $request->voitures_id . '_' . $_SERVER['REQUEST_TIME'];
        $chemin = $request->file('image')->storeAs('images', $nom_fichier, 'public');

        $image = Image::create([
            'nom' => $request->nom,
            'nom_en' => $request->nom_en,
            'chemin' => $chemin,
            'alt' => $request->alt,
            'alt_en' => $request->alt_en,
            'image_principale' => $request->image_principale,
            'voitures_id' => $request->voitures_id,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function show(Image $image)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function edit(Image $image)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Image $image)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Image  $image
     * @return \Illuminate\Http\Response
     */
    public function destroy(Image $image)
    {
        //
    }
}
