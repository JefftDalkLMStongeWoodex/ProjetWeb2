<script>
import { Link } from '@inertiajs/inertia-vue3';

export default {
    props: {
        data: {
            type: Object,
            default: () => []
        },
        modele: {
            type: String,
            default: ""
        },
        value: {
            default: ""
        }
    },
    components: { Link }
}
</script>
<template>
    <Link class="catalogue__grid__tuile" :href="route('voiture.fiche',data.id)">
        <div class="catalogue__grid__tuile__img-wrapper">
            <img src="../../assets/kiaForte2015.jpg" class="vehicule-img" />
        </div>
        <div class="catalogue__grid__tuile__details">
            <p class="catalogue__grid__tuile_texte">{{data.annee}} {{data.constructeurs}} {{data.modeles}}</p>
            <div class="catalogue__grid__spans">
            <span>{{data.kilometrage}} km</span>
            <span>$ {{data.prix}}</span>
            </div>
        </div>
    </Link>
</template>
<style scoped>
</style>