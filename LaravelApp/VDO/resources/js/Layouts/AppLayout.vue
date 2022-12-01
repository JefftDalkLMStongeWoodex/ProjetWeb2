<script setup>
import { ref } from 'vue';
import SidebarVue from '@/Components/Sidebar.vue';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';

const showingNavigationDropdown = ref(false);
</script>

<template>
    <div>
        <!-- Page Heading -->
        <header class="">
            <nav class="relative flex items-top justify-center h-auto bg-gray-100 dark:bg-gray-900 sm:items-center sm:pt-0">
                <NavLink
                    href="/"
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline"
                >
                    Accueil
                </NavLink>
                <Link
                    :href="route('catalogue')"
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline"
                >
                    Trouver une voiture
                </Link>
                <Link
                    href="/apropos"
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline"
                >
                    À propos
                </Link>
                <Link
                    href="/contact"
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline"
                >
                    Contactez-nous
                </Link>
                <template v-if="$page.props.auth.user">
                    <Link 
                        :href="route('dashboard')"
                        class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline"
                    >
                        Tableau de bord
                    </Link>
                    <Link 
                        :href="route('logout')"
                        class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline"
                    >
                        Déconnexion
                    </Link>
                </template>
                <template v-else>
                    <Link 
                        :href="route('register')"
                        class="text-sm text-gray-700 dark:text-gray-500 underline"
                    >
                        Inscription
                    </Link>
                    <Link 
                        :href="route('login')"
                        class="text-sm text-gray-700 dark:text-gray-500 underline"
                    >
                        Connexion
                    </Link>
                </template>

            </nav>
        </header>

        <!-- Page Content -->
        <main>
            <slot />
        </main>
    </div>

</template>
<style scoped>


</style>