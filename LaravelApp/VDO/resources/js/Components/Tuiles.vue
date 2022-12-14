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
    <slot v-for="d of data">
        <Link class="catalogue__grid__tuile" :href="route('voiture.fiche',d.id)">
            <div class="catalogue__grid__tuile__img-wrapper">
                <img v-if="d.imagePrincipale[0] != null" :src="`/storage/${d.imagePrincipale[0].chemin}`" class="vehicule-img" />
                <img v-else src="../../assets/kiaForte2015.jpg" class="vehicule-img" />
            </div>
            <div class="catalogue__grid__tuile__details">
                <p class="catalogue__grid__tuile_texte">{{d.annee}} {{d.constructeurs}} {{d.modeles}}</p>
                <div class="catalogue__grid__spans">
                <span>{{d.kilometrage}} km</span>
                <span>$ {{d.prix}}</span>
                </div>
            </div>
        </Link>
    </slot>
</template>
<style scoped>
</style>