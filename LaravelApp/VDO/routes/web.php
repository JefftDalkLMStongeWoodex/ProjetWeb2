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

// Route::get('/homepage', function () {
//     return Inertia::render('Homepage', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// });

Route::get('/', function () {
    return Inertia::render('Accueil', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'langAppLayout' => Lang::get('app_layout'),
    ]);
})->name('accueil');

// Route::get('/apropos', function () {return Inertia::render('APropos'); })->name('apropos');

Route::get('/catalogue', [CatalogueController::class, 'index'])->name('catalogue');

// Route::get('/contact', function() { return Inertia::render('Contact'); })->name('contact');

Route::get('/lang/{locale}', [LocalizationController::class, 'index'])->name('lang');

Route::get('/voiture/index', [PanierAchatController::class, 'index'])->name('voiture.index');


Route::get('/voiture/fiche/{voiture}', [PanierAchatController::class, 'fiche'])->name('voiture.fiche');

Route::get('/panier/achat/', [CommandeController::class, 'create'])->name('voiture.panier');

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

Route::middleware('auth')->group(function () {
    Route::get('/dashboard/voitures', [VoitureController::class, 'index'])->name('voiture.index');
    Route::get('/dashboard/voitures/ajout', [VoitureController::class, 'create'])->name('voiture.create');
    Route::post('/dashboard/voitures/ajout', [VoitureController::class, 'store'])->name('voiture.store');
    Route::get('/dashboard/voitures/detail/{voiture}', [VoitureController::class, 'show'])->name('voiture.show');
    Route::get('/dashboard/voitures/modifier/{voiture}', [VoitureController::class, 'edit'])->name("voiture.edit");
    Route::put('/dashboard/voitures/modifier/{voiture}', [VoitureController::class, 'update'])->name("voiture.update");
    Route::delete('/dashboard/voitures/modifier/{voiture}', [VoitureController::class, 'destroy'])->name("voiture.destroy");
});

Route::middleware('auth')->group(function() {
    Route::get('/dashboard/images/{idVoiture}', [ImageController::class, 'index'])->name('image.index');
    Route::get('/dashboard/images/ajout/{idVoiture}', [ImageController::class, 'create'])->name('image.create');
    Route::post('/dashboard/images/ajout/{idVoiture}', [ImageController::class, 'store'])->name('image.store');
});