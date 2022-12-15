<script setup>
import { ref } from 'vue';
import LogoVersion2 from '@/Components/LogoVersion2.vue';
import NavLink from '@/Components/NavLink.vue';
import Panier from '@/Components/Panier.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';
import iconeBurger from '/resources/assets/icones/material-menu-white.svg';
import MenuPrincipaleVue from '@/Components/MenuPrincipale.vue';
const showingNavigationDropdown = ref(false);

 const props = defineProps(['detailVoiture', 'active', 'lang']);
</script>
<script>
export default {
    data () {
        return {
            affichagePanier: false,
            panier: {}
        }
    },
    methods: {
        afficherPanier () {
            this.affichagePanier = !this.affichagePanier
        },
        ajouterAuPanier (voiture) {
            console.log("Je t'ajoute au panier");
        },
        supprimerDuPanier (voiture) {
            console.log("Je t'enlève du panier");
        }
    }
}
</script>
<template>

    <input class="gachette" type="checkbox">
    <a :href="route('accueil')" aria-label="Lien vers page d'accueil">
        <LogoVersion2 :href="route('accueil')" class="header__logo"/>
    </a>
    <div class="header__conteneur">
        <div class="header__liens">
            <NavLink class="header__lien" :href="route('catalogue')">{{lang.lien_catalogue}}</NavLink>
            <!-- <NavLink class="header__lien" href="/contact">{{lang.lien_contact}}</NavLink> -->
            <template v-if="$page.props.auth.user">
                <NavLink class="header__lien" :href="route('dashboard')">{{lang.lien_tableau_de_bord}}</NavLink>
                <NavLink class="header__lien" :href="route('logout')" method="post" as="button">{{lang.lien_deconnexion}}</NavLink>
            </template>
            <template v-else>
                <NavLink class="header__lien" :href="route('register')">{{lang.lien_inscription}}</NavLink>
                <NavLink class="header__lien" :href="route('login')">{{lang.lien_connexion}}</NavLink>
            </template>
            <NavLink class="header__lang" :href="route('lang', 'en')">EN</NavLink>
            <NavLink class="header__lang" :href="route('lang', 'fr')">FR</NavLink>
            <svg class="header__cart" @click="afficherPanier" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
                <path id="Icon_material-shopping-cart" data-name="Icon material-shopping-cart" d="M10.5,27a3,3,0,1,0,3,3A3,3,0,0,0,10.5,27ZM1.5,3V6h3L9.9,17.385,7.875,21.06A2.9,2.9,0,0,0,7.5,22.5a3.009,3.009,0,0,0,3,3h18v-3H11.13a.371.371,0,0,1-.375-.375l.045-.18L12.15,19.5H23.325a2.986,2.986,0,0,0,2.625-1.545L31.32,8.22a1.465,1.465,0,0,0,.18-.72A1.5,1.5,0,0,0,30,6H7.815L6.405,3Zm24,24a3,3,0,1,0,3,3A3,3,0,0,0,25.5,27Z" transform="translate(-1.5 -3)" fill="#fff"/>
            </svg>
        </div>
        <Panier 
            v-if="affichagePanier"
            :panier="panier"
            :afficherPanier="afficherPanier"
        />
    </div>
                
</template>

<style scoped>

.gachette {
    all: unset;
    appearance: none;
    -moz-appearance: none;
    position: absolute;
    top: 20px;
    right: 20px;
    z-index: 1;
    cursor: pointer;
}

.gachette::before {
    content: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='27' height='18' viewBox='0 0 27 18'%3E%3Cpath fill='white' d='M4.5,27h27V24H4.5Zm0-7.5h27v-3H4.5ZM4.5,9v3h27V9Z' transform='translate(-4.5 -9)'/%3E%3C/svg%3E");
    text-transform: uppercase;
    font-weight: 700;
    width: 100%;
    height: 100%;
}

.header__conteneur {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: fixed;
    justify-content: center;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: var(--couleur-secondaire);
    overflow: auto;
}

.header__liens {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 1em;
}

.header__cart {
    cursor: pointer;
}

.header__logo {
    min-width: 170px;
    max-width: 200px;
}


input.gachette:not(:checked) ~ .header__conteneur {
    opacity: 0;
    pointer-events: none;
}


@media (min-width: 900px) {
    html, body {
        width: 100%;
        height: 100%;
    }
    
    article {
        min-height: 100%;
        display: grid;
        grid-template-rows: auto 1fr auto;
        grid-template-columns: 100%;
    }

    input.gachette:not(:checked) ~ .header__conteneur {
        opacity: 100%;
        pointer-events: auto;
    }

  
    
    .header__conteneur {
        align-items: center;
        display: flex;
        flex-direction: row;
        font-family: var(--police-texte);
        justify-content: flex-start;
        opacity: 100%;
        position: static;
        margin-left: auto;
    }

    .header__liens {
        display: block;
        font-size: 18px;
        display: flex;
        gap: 0.5rem;
        flex-direction: row;
    }

    .gachette {
        display: none;
    }


    
}


</style>