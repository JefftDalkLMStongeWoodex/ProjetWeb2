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
import PiedPageVue  from '@/Components/PiedPage.vue';
const showingNavigationDropdown = ref(false);

defineProps({
    lang: Object,
});
</script>
<template>
    <div class="layout__conteneur">
        
        <!-- Page Heading -->
        <header class="header">
            <nav class="header__navigation">
                <div class="wrapper">
                    <MenuPrincipaleVue :lang="lang"  />
                    
                </div>
            </nav>
        </header>
        <!-- Page Content -->
        <main class="content">
            <div class="wrapper-contenu">
                <slot />
            </div>
        </main>
        <!-- Footer -->
        <footer class="footer">
            <PiedPageVue :lang="lang"  />
        </footer>
    </div>
</template>
<style scoped>
.layout__conteneur {
    min-height: 100vh;
    display: grid;
    grid-template-rows: auto 1fr auto;
    position: static;
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

.footer__conteneur {
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
    .wrapper {
        display: flex;
    }

    .header__navigation {
        background-color: var(--couleur-secondaire);
        color: var(--couleur-blanc);
        text-decoration: none;
    }
    .footer__conteneur{
        background-color: var(--couleur-secondaire);
        display: flex;
        flex-direction: row;
        color: white;
        justify-content: center;
        align-items: center;
        gap: 4rem;
        padding-top: 0;
        padding-bottom: 0;
    }
    
}
</style>