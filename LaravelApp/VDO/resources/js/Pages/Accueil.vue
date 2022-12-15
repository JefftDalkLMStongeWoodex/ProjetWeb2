<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import PageAccueil from '@/Components/PageAccueil.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    langAppLayout: Object,
});
</script>
<template>
    <Head title="Accueil" />
    <AppLayout :lang="langAppLayout">
        <div class="conteneur_accueil">
            <PageAccueil />
        </div>
    </AppLayout>
</template>
<style scoped>

</style>