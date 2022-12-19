<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\DB;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'first_name',
        'email',
        'password',
        'anniversaire',
        'adresse',
        'code_postal',
        'telephone',
        'telephone_portable',
        'villes_id',
        'privileges_id'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function estAdmin () {
        return $this->privileges_id == 3;
    }

    public function estEmploye () {
        return ($this->privileges_id == 3 || $this->privileges_id == 2); 
    }

    public function selectUtilisateurTableauDeBord($locale) {
        $colonne_privilege = "";
        ($locale == "en") ? ($colonne_privilege = "privileges.nom_en") : ($colonne_privilege = "privileges.nom");
        return DB::select(
            'SELECT users.id, name, first_name, email, telephone, telephone_portable, '. $colonne_privilege .' AS privilege
            FROM users
            JOIN privileges ON users.privileges_id = privileges.id'
        );
    }

    public function ville() {
        return $this->hasOne('App\Models\Ville', 'id', 'villes_id');
    }
}
