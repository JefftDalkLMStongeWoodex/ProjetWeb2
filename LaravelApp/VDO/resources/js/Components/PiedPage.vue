<script setup>
import { ref } from 'vue';
import LogoVersion2 from '@/Components/LogoVersion2.vue';
import NavLink from '@/Components/NavLink.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';
import iconeBurger from '/resources/assets/icones/material-menu-white.svg';
import MenuPrincipaleVue from '@/Components/MenuPrincipale.vue';
const showingNavigationDropdown = ref(false);

 const props = defineProps(['detailVoiture', 'active', 'lang']);
</script>

<template>
    <div class="footer__conteneur wrapper ">
        <div class="footer__logo">
            <a :href="route('accueil')" aria-label="Lien vers page d'accueil">
                <LogoVersion2 :href="route('accueil')" class="footer__logo"/>
            </a>
        </div>
        <div class="footer__liens">
            <h4>{{lang.explorer}}</h4>
            <div class="footer__liste-liens">
                <NavLink class="footer__lien" :href="route('catalogue')">{{lang.lien_catalogue}}</NavLink>
                <NavLink class="footer__lien" :href="route('politique')">{{lang.lien_politiques}} </NavLink>
                <template v-if="$page.props.auth.user">
                    <NavLink class="footer__lien" :href="route('dashboard')">{{lang.lien_tableau_de_bord}}</NavLink>
                    <NavLink class="footer__lien" :href="route('logout')" method="post" as="button">{{lang.lien_deconnexion}}</NavLink>
                </template>
                <template v-else>
                    <NavLink class="footer__lien" :href="route('register')">{{lang.lien_inscription}}</NavLink>
                    <NavLink class="footer__lien" :href="route('login')">{{lang.lien_connexion}}</NavLink>
                </template>
            </div>
            
        </div>
        <div class="footer__joindre">
            <h4>{{lang.joindre_titre}}</h4>
            <div class="footer__liste-liens">
                <NavLink class="footer__lien" :href="route('catalogue')">{{lang.contact_titre}}</NavLink>
            
                <NavLink class="footer__lien" :href="route('catalogue')">(514) 584-4546</NavLink>
                <NavLink class="footer__lien" :href="route('catalogue')">info@vdo.ca</NavLink>
            </div>
        </div>   
    </div>
</template>

<style scoped>
.layout__conteneur {
    min-height: 100vh;
    display: grid;
    grid-template-rows: auto 1fr auto;
}

.header {
    grid-row-start: 1;
    grid-row-end: 2;
}

.content {
    grid-row-start: 2;
    grid-row-end: 3;
}

.footer {
    grid-row-start: 3;
    grid-row-end: 4;
}

.header__navigation {
    background-color: var(--couleur-secondaire);
}

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

.header__langSelect {
    display: flex;
    justify-content: flex-end;
    padding-top: 10px;
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

.header__logo {
    min-width: 170px;
    max-width: 200px;
}

.footer__logo {
    min-width: 170px;
    max-width: 200px;
}


input.gachette:not(:checked) ~ .header__conteneur {
    opacity: 0;
    pointer-events: none;
}

.footer__conteneur{
    background-color: var(--couleur-secondaire);
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 4rem;
    padding-bottom: 4rem;
}

.footer__joindre h4, .footer__liens h4 {
    text-align: center;
}

.footer__liste-liens {
    display: flex;
    flex-direction: column;
    align-items: center;
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

    .wrapper {
        display: flex;
    }

    .header__navigation {
        background-color: var(--couleur-secondaire);
        color: var(--couleur-blanc);
        text-decoration: none;
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


    .footer__conteneur{
        background-color: var(--couleur-secondaire);
        display: flex;
        flex-direction: row;
        color: white;
        justify-content: center;
        align-items: flex-start;
        gap: 4rem;
        padding-top: 0;
        padding-bottom: 0;
    }

    .footer__liens,
    .footer__joindre {
        padding-top: 2rem;
    }

    .footer__liste-liens{
        display: flex;
        flex-direction: column;    
        align-items: flex-start;    
    }

    .footer__joindre{
        display: flex;
        flex-direction: column;        
    }

    .footer__joindre h4, .footer__liens h4{
        text-align: left;
    }

    .footer__logo {
        min-width: 325px;
        max-width: 380px;
    }
    
}
</style>