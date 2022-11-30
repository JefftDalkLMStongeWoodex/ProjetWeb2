<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});

</script>


<template>

    <Head title="Accueil" />

    <div
        class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center sm:pt-0">
        <div v-if="canLogin" class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
            <Link 
                v-if="$page.props.auth.user" 
                :href="route('dashboard')"
                class="text-sm text-gray-700 dark:text-gray-500 underline">
                Dashboard
            </Link>

            <template v-else>
                <Link 
                    href="/" 
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline">
                    Accueil
                </Link>

                <Link 
                    href="/catalogue" 
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline">
                    Trouver une voiture
                </Link>

                <Link 
                    href="/apropos" 
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline">
                    A propos
                </Link>

                <Link 
                    href="/contacte" 
                    class="mr-4 text-sm text-gray-700 dark:text-gray-500 underline">
                    Contacter-nous
                </Link>

                <Link 
                    :href="route('login')" 
                    class="text-sm text-gray-700 dark:text-gray-500 underline">
                    Log in
                </Link>

                <Link 
                    v-if="canRegister" 
                    :href="route('register')"
                    class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Register
                </Link>
            </template>
        </div>

        <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
            <h1>Ceci est ma page d'accueil</h1>
        </div>
    </div>
</template>


