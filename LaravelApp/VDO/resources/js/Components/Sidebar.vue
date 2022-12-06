<script setup>
import { computed } from 'vue';
import { Link } from '@inertiajs/inertia-vue3';
import NavLink from '@/Components/NavLink.vue';
import LogoVersion2 from '@/Components/LogoVersion2.vue';

const props = defineProps(['href', 'active', 'lang']);


</script>

<template>
    <aside class="aside">
        <div class="logo">
            <Link :href="route('accueil')">
                <LogoVersion2 />
            </Link>
        </div>
        <div class="menu-laterale">
            <nav class="nav">
                <NavLink :href="route('dashboard')" :active="route().current('dashboard')">
                    {{lang.titre}} 
                </NavLink>
                <!-- à intégrer avec layout dashboard -->
                <!-- <NavLink :href="route('profile.edit')">
                    Profile 
                </NavLink> -->
                <NavLink :href="route('voiture.index')">
                    {{lang.voiture}} 
                </NavLink>
                <NavLink :href="route('logout')" method="post" as="button">
                    {{lang.logout}}
                </NavLink>

                <NavLink :href="route('profile.edit')">
                    Profile 
                </NavLink>

                <NavLink class="header__lang" :href="route('lang', 'en')">EN</NavLink>
                <NavLink class="header__lang" :href="route('lang', 'fr')">FR</NavLink>


            </nav>
        </div>
    </aside>
</template>

<style scoped>
.aside {
    background-color: var( --couleur-secondaire);
}
.logo {
    align-items: center;
}

aside div nav {
    display: flex;
    flex-direction: column;
    color: white;
    font-size: 18px;
    padding: 0rem 4rem 2rem;
    overflow: hidden;
    min-height: 100vh;
    transition: 0.2s ease-out;
    width: calc(2rem+32px);

}

@media (max-width: 768px) {
    aside div nav {
        position: fixed;
    }
}
</style>