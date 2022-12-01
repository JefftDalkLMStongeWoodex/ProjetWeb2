<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Inertia\Inertia;
use App\Models\Ville;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Inertia\Response
     */
    public function create()
    {
        $villes = Ville::all();
        return Inertia::render('Auth/Register', ['villes' => $villes]);
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:'.User::class,
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'first_name' => 'required|string|max:255',
            'anniversaire' => 'nullable|date',
            'adresse' => 'required|string|max:45',
            'code_postal' => 'required|string|max:45|regex:"^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$"',
            'telephone' => 'required|string|regex:"^[(][0-9]{1,3}[)]\s[\d]{3}-[\d]{4}$"|max:45',
            'telephone_portable' => 'nullable|string|regex:"^[(][0-9]{1,3}[)]\s[\d]{3}-[\d]{4}$"|max:45',
            'villes_id' => 'required|exists:villes,id',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'first_name' => $request->first_name,
            'anniversaire' => $request->anniversaire,
            'adresse' => $request->adresse,
            'code_postal' => $request->code_postal,
            'telephone' => $request->telephone,
            'telephone_portable' => $request->telephone_portable,
            'villes_id' => $request->villes_id,
            'privileges_id' => '1',
        ]);

        

        event(new Registered($user));

        Auth::login($user);

        return redirect(RouteServiceProvider::HOME);
    }
}
