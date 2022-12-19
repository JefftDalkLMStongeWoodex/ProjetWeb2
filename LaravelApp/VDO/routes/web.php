<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\LocalizationController;
use App\Http\Controllers\VoitureController;
use App\Http\Controllers\CatalogueController;
use App\Http\Controllers\PanierAchatController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\CommandeController;
use App\Http\Controllers\UtilisateurController;

use Illuminate\Support\Facades\Lang;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Accueil', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'langAppLayout' => Lang::get('app_layout'),
    ]);
})->name('accueil');


Route::get('/politique', function () {
    return Inertia::render('Politique', [
           'langAppLayout' => Lang::get('app_layout'),
    ]);
})->name('politque');


Route::get('/facturation', function () {
    return Inertia::render('Facturation', [
        'langDashboard' => Lang::get('dashboard'),
    ]);
})->name('facturation');

Route::get('/apropos', function () {
    return Inertia::render('APropos',[
        'langAppLayout' => Lang::get('app_layout'),
    ]); 
})->name('apropos');

Route::get('/contact', function() { 
    return Inertia::render('Contact', [
        'langAppLayout' => Lang::get('app_layout'),
    ]); 
})->name('contact');

Route::get('/catalogue', [CatalogueController::class, 'index'])->name('catalogue');

Route::get('/lang/{locale}', [LocalizationController::class, 'index'])->name('lang');

Route::get('/voiture/index', [PanierAchatController::class, 'index'])->name('voiture.index');

Route::get('/voiture/fiche/{voiture}', [PanierAchatController::class, 'fiche'])->name('voiture.fiche');

Route::post('/panier/achat/', [CommandeController::class, 'create'])->name('voiture.panier');

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard', [
        'langDashboard' => Lang::get('dashboard'),
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';

// Routes en lien avec les voitures dans le dashboard
Route::middleware('auth')->group(function () {
    Route::get('/dashboard/voitures', [VoitureController::class, 'index'])->name('voiture.index');
    Route::get('/dashboard/voitures/ajout', [VoitureController::class, 'create'])->name('voiture.create');
    Route::post('/dashboard/voitures/ajout', [VoitureController::class, 'store'])->name('voiture.store');
    Route::get('/dashboard/voitures/detail/{voiture}', [VoitureController::class, 'show'])->name('voiture.show');
    Route::get('/dashboard/voitures/modifier/{voiture}', [VoitureController::class, 'edit'])->name("voiture.edit");
    Route::put('/dashboard/voitures/modifier/{voiture}', [VoitureController::class, 'update'])->name("voiture.update");
    Route::delete('/dashboard/voitures/modifier/{voiture}', [VoitureController::class, 'destroy'])->name("voiture.destroy");
});

// Routes en lien avec les images dans le dashboard
Route::middleware('auth')->group(function() {
    Route::get('/dashboard/images/{idVoiture}', [ImageController::class, 'index'])->name('image.index');
    Route::get('/dashboard/images/ajout/{idVoiture}', [ImageController::class, 'create'])->name('image.create');
    Route::post('/dashboard/images/ajout/{idVoiture}', [ImageController::class, 'store'])->name('image.store');
});

// Routes en lien avec le panneau utilisateurs du dashboard
Route::middleware('auth')->group(function() {
    Route::get('/dashboard/utilisateurs', [UtilisateurController::class, 'index'])->name('utilisateur.index');
    Route::get('/dashboard/utilisateurs/detail/{utilisateur}', [UtilisateurController::class, 'show'])->name('utilisateur.show');
    Route::get('/dashboard/utilisateurs/modifier/{utilisateur}', [UtilisateurController::class, 'edit'])->name('utilisateur.edit');
    Route::put('/dashboard/utilisateurs/modifier/{utilisateur}', [UtilisateurController::class, 'update'])->name('utilisateur.update');
});

Route::get('test-courriel', [CommandeController::class, 'testCourriel']);
Route::get('/voiture/fiche/{voiture}/PDF', [CommandeController::class, 'testPDF']);