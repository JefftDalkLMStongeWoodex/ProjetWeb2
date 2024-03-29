<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Lang;
use App\Models\Ville;
use App\Models\User;
class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Inertia\Response
     */
    public function edit(Request $request)
    {
        return Inertia::render('Profile/Edit', [
            'mustVerifyEmail' => $request->user() instanceof MustVerifyEmail,
            'status' => session('status'),
            'langProfil' => Lang::get('profil'),
            'langDashboard' => Lang::get('dashboard'),
            'villes' => Ville::all(),
        ]);
    }

    /**
     * Update the user's profile information.
     *
     * @param  \App\Http\Requests\ProfileUpdateRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(ProfileUpdateRequest $request)
    {
        $request->user()->fill($request->validate([
            'name' => 'required|string|max:255',
            'first_name' => 'required|string|max:255',
            'anniversaire' => 'nullable|date',
            'adresse' => 'required|string|max:45',
            'code_postal' => 'required|string|max:45|regex:"^[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d$"',
            'telephone' => 'required|string|regex:"^[(][0-9]{1,3}[)]\s[\d]{3}-[\d]{4}$"|max:45',
            'telephone_portable' => 'nullable|string|regex:"^[(][0-9]{1,3}[)]\s[\d]{3}-[\d]{4}$"|max:45',
            'villes_id' => 'required|exists:villes,id',
        ]));

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit' , [
            'langProfil' => Lang::get('profil'),
            'langDashboard' => Lang::get('dashboard'),
        ]);
    }

    /**
     * Delete the user's account.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        $request->validate([
            'password' => ['required', 'current-password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
}
