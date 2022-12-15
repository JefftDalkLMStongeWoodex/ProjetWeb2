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
            <div class="wrapper">
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
    
}
</style>