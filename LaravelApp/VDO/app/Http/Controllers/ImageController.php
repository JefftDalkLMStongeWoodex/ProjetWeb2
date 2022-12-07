<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Inertia;
use Lang;

class ImageController extends Controller
{
    //
    function create(){
        $langAjoutImage = Lang::get('ajoutimage');
        return Inertia::render('Dashboard/AjoutImage',[
            'langAjoutImage' => $langAjoutImage,
        ]);
    }
}
