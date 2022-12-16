<script setup>
import { Head } from '@inertiajs/inertia-vue3'
import AppLayout from '@/Layouts/AppLayout.vue'
import ListePanier from '@/Components/Checkout/ListePanier.vue'
import InfoCommande from '@/Components/Checkout/InfoCommande.vue'
const props = defineProps({
    panier: Object,
    taxes: Object,
    provinces: Object,
    langAppLayout: Object,
    langCheckout: Object,
})
let commande = props.panier;
</script>
<template>
    <AppLayout :lang="langAppLayout">
        <Head title="Checkout" />
        <section class="">
            <ListePanier
            :liste = "commande"
            />
            <InfoCommande
            :liste = "commande"
            :taxes = "props.taxes"
            :provinces = "props.provinces"
            />
        </section>
    </AppLayout>
</template>
<style scoped>
</style>