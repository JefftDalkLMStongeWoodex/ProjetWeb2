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
    .catalogue__grid__tuile__details {
        margin: 0;
        padding: 0px 15px;
    }

    .catalogue__grid__spans {
        font-size: 20px;
    }

    .catalogue__grid__spans span + span  {
        margin-left: 25px;
    }

    .vehicule-img {
        aspect-ratio: 4/3;
        display: flex;
        justify-content: center;
        align-items: center;
        overflow: hidden;
    }


    img {
        width: 100%;
        object-fit: contain;
        object-position: center center;
    }

    .catalogue__grid__tuile {
        border: solid 1px var(--couleur-secondaire);
        border-radius: 8px;
        padding-top: 1rem;
        padding-bottom: 1rem;
        display: flex;
        flex-direction: column;
        gap: 1rem;
        justify-content: space-between;
    }
</style>