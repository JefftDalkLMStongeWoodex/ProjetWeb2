<script setup>
import { ref } from 'vue';
import LogoVersion2 from '@/Components/LogoVersion2.vue';
import NavLink from '@/Components/NavLink.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';
import iconeBurger from '/resources/assets/icones/material-menu-white.svg'

const showingNavigationDropdown = ref(false);

defineProps({
    lang: Object,
});
</script>

<template>
    <div>
        <!-- Page Heading -->
        <header>
            <nav class="header__navigation">
                <div class="wrapper">
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
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Page Content -->
        <main>
            <div class="wrapper">
                <slot />
            </div>
        </main>
    </div>

</template>
<style scoped>
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

input.gachette:not(:checked) ~ .header__conteneur {
    opacity: 0;
    pointer-events: none;
}

@media (min-width: 900px) {
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
    }

    .gachette {
        display: none;
    }
}
</style>