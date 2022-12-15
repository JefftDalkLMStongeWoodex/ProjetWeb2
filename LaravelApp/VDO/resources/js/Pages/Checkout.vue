<script setup>
import { Head } from '@inertiajs/inertia-vue3'
import AppLayout from '@/Layouts/AppLayout.vue'
const props = defineProps({
    panier: Object,
    langAppLayout: Object,
    langCheckout: Object,
})
</script>
<template>
    <AppLayout :lang="langAppLayout">
        <Head title="Checkout" />
        <h1>{{langCheckout.test}}</h1>
    </AppLayout>
</template>
<style scoped>
</style>