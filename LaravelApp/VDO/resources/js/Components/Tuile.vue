<script>
export default {
    props:{
        data: {
            type: Object,
            default: () => []
        },
        modele:{
            type: String,
            default: () => ''
        },
        value:{
            default: ''
        }
    },
}
</script>
<template>
    <div class="catalogue__grid__tuile">
        <div class="catalogue__grid__tuile__img-wrapper">
            <img src="../../assets/kiaForte2015.jpg" class="vehicule-img" />
        </div>
        <div class="catalogue__grid__tuile__details">
            <p class="catalogue__grid__tuile_texte">{{data.annee}} {{data.constructeur}} {{data.modele}}</p>
            <div class="catalogue__grid__spans">
            <span>{{data.kilometrage}} km</span>
            <span>$ {{data.prix}}</span>
            </div>
        </div>
    </div>
</template>
<style scoped>
</style>