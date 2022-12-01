<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
});
</script>
<template>
    <Head title="Accueil" />
    <AppLayout>
        <div>
            <h1>Ceci est ma page d'accueil</h1>
        </div>
    </AppLayout>
</template>