<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';


defineProps({
    langAppLayout: Object,
});
</script>
<template>
    <Head title="Confirmation achat" />
    <AppLayout :lang="langAppLayout">
        <div class="wrapper py-medium">
            <p class="succes">{{$page.props.flash.succes_achat}}</p>
            Bravo, vous avez acheté une voiture! Vous recevrez dans les prochaines minutes un courriel auquel sera joint une copie de votre facture.
        </div>
    </AppLayout>
</template>
<style scoped>
.succes {
    color: green;
    font-weight: bold;
}

.py-medium {
    padding-top: 3rem;
}
</style>