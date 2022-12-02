<script setup>
import { ref } from 'vue';
import LogoVersion2 from '@/Components/LogoVersion2.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';

const showingNavigationDropdown = ref(false);

</script>

<template>
    <div>
        <!-- Page Heading -->
        <header>
            <nav class="header__navigation">
                <div class="wrapper">
                    <div class="header__langSelect">
                        <NavLink class="header__lang" :href="route('lang', 'en')">
                            English
                        </NavLink>

                        <NavLink class="header__lang" :href="route('lang', 'fr')">
                            Français
                        </NavLink>
                    </div>
                    
                    <div class="header__conteneur">
                        <a :href="route('accueil')" aria-label="Lien vers page d'accueil">
                            <LogoVersion2 :href="route('accueil')" class="header__logo" />
                        </a>
                        <div class="header__liens">
                            <NavLink class="header__lien" :href="route('catalogue')">Trouver votre voiture</NavLink>
                            <NavLink class="header__lien" href="/apropos">A propos de Vdo </NavLink>
                            <NavLink class="header__lien" href="/contact">Contactez-nous</NavLink>
                            <template v-if="$page.props.auth.user">
                                <NavLink class="header__lien" :href="route('dashboard')">Tableau de bord</NavLink>
                                <NavLink class="header__lien" :href="route('logout')" method="post">Déconnexion
                                </NavLink>
                            </template>
                            <template v-else>
                                <NavLink class="header__lien" :href="route('register')">Inscription</NavLink>
                                <NavLink class="header__lien" :href="route('login')">Connexion</NavLink>
                            </template>
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
    color: black;
    text-decoration: none;
}

.header__langSelect {
    display: flex;
    justify-content: flex-end;
    padding-top: 10px;
}

.header__conteneur {
    align-items: center;
    display: flex;
    font-family: var(--police-texte);
    justify-content: flex-start;
}

.header__logo {
    min-width: 170px;
    width: 10vw;
}

.header__liens {
    margin-left: auto;
}

.header__lien {
    font-size: 18px;
}
</style>