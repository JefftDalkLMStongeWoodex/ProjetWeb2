<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    langAppLayout: Object,
});
</script>
<template>
    <Head />
    <AppLayout :lang="langAppLayout">
        <div>
            <h1>Ceci est ma page d'accueil</h1>
        </div>
    </AppLayout>
</template>