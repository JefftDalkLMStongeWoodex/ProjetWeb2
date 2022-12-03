<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use App\Http\Controllers\LocalizationController;
use App\Http\Controllers\VoitureController;
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
    return Inertia::render('Homepage', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/accueil', function () {
    return Inertia::render('Accueil', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
        'langAppLayout' => Lang::get('app_layout'),
    ]);
})->name('accueil');


Route::get('/apropos', function () {return Inertia::render('APropos'); })->name('apropos');

Route::get('/catalogue', function() { return Inertia::render('Catalogue'); })->name('catalogue');

Route::get('/contact', function() { return Inertia::render('Contact'); })->name('contact');


Route::get('/lang/{locale}', [LocalizationController::class, 'index'])->name('lang');

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

Route::get('/dashboard/voitures', [VoitureController::class, 'index'])->middleware(['auth', 'verified'])->name('voiture.index');

Route::get('/catalogue', function() { 
    return Inertia::render('Catalogue', [
        'langAppLayout' => Lang::get('app_layout'),
    ]); 
})->name('catalogue');