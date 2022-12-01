<script setup>
import { Head} from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
}); 
</script>
<template>
    <Head title="Accueil" />
    <AppLayout>
        <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
            <h1>Ceci est ma page d'accueil</h1>
        </div>
    </AppLayout>
</template>