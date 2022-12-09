<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import chevronDroit from '/resources/assets/icones/material-chevron-right-white.svg';


defineProps({
    langAppLayout: Object,
  langCatalogue: Object,
  voitures: Object,
  modele: Object,
  constructeur: Object,
  corps: Object,
  transmissions: Object,
  groupeMotopropulseurs: Object,
  carburants: Object,
  etats: Object,
});



</script>

<template>
  <Head title="Catalogue" />

    <section class="catalogue" v-for="voiture in voitures" :key="voiture.id">    
        <div class="catalogue__grid">
            <div class="tuile-vehicule">
                <div class="tuile-vehicule__img-wrapper">
                    <img src="" class=""/>
                </div>
                <h3 class="titre">
                    2015 Kia Forte LX
                </h3>
                <div class="tuile-vehicule__details">
                    <span>Description</span>
                    <p>   *Traction intégrale, système de navigation, toit ouvrant panoramique, sièges chauffants, sièges mémoire, intérieur en cuir, système de surveillance des angles morts, caméra 360, climatisation 2 zones, démarreur è distance, régulateur de vitesse adaptatif, Bluetooth, jantes en aluminium.*Avec plus de 2000 véhicules en inventaire, Automobile en Direct, c'est un vaste inventaire de véhicules d'occasion, avec toutes les marques et tous les modèles offerts au meilleur rapport qualité/prix sur le marché.Pourquoi acheter chez Automobile En Direct :- Une garantie prolongée unique et exclusive- Un véhicule inspecté en plus de 200  </p>
                    <span> prix :  {{voiture.prix_paye}}    </span>
                </div>
                <div class="">
                    <Link :href="route('voiture.panier', voiture.id)"> Add to cart {{voiture.id}} </Link>
                </div>


            </div>
            </div>
    </section>






</template>

<style>

h1 {
    font-size: 36px;
    font-family: var(--police-titre);
}



</style>



