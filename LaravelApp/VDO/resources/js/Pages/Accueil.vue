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
        <div class="conteneur_accueil">
            <h1>Ceci est ma page d'accueil</h1>
        </div>
    </AppLayout>
</template>
<style scoped>
.conteneur_accueil {
    margin-bottom: auto;
    background-color: var(--couleur-blanc);
}
</style>