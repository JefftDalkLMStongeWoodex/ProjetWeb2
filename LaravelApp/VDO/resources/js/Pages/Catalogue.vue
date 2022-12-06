<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
  langAppLayout: Object,
})
</script>

<template>

  <Head title="Catalogue" />
  <AppLayout :lang="langAppLayout">
    <div class=" mt-8 m-auto grid md:grid-cols-3 lg:grid-cols-5 gap-4">
      <aside class="tile row-span-6">

        <div class="flex items-center justify-around">
          <span class="font-bold uppercase">Filtres</span>
          <span class="font-bold uppercase">Rénitialiser</span>
        </div>

        <div class="tile__filtre">
          <a href="">MARQUE & MODELE</a>
        </div>

        <div class="tile__filtre">
          <a href="">PRIX</a>
        </div>
        <div class="tile__filtre">
          <a href="">ANNEE</a>
        </div>
        <div class="tile__filtre">
          <a href="">KM</a>
        </div>
        <div class="tile__filtre">
          <a href="">CARROSSERIE</a>
        </div>
        <div class="tile__filtre">
          <a href="">TRANSMISSION</a>
        </div>
        <div class="tile__filtre">
          <a href="">TRACTION</a>
        </div>
        <div class="tile__filtre">
          <a href="">CYLINDRE</a>
        </div>
        <div class="tile__filtre">
          <a href="">COULEUR</a>
        </div>
        <div class="tile__filtre">
          <a href="">PASSAGER</a>
        </div>
      </aside>

      <div class="rounded-md shadow hover:shadow-black cursor-pointer">
          <div class="tile-head">
            <img src="../../assets/kiaForte2015.jpg" class="tile-head__img">
          </div>
          <div class="tile-body">
            <h3 class="tile-body__title">2015 Kia Forte LX</h3>
            <span class="tile-body__price">$13998</span>
            <span class="tile-body__km">79 364 km</span>
          </div>
      </div>
      
      <div class="tile bg-principale">
        <h1 class="tile-marker">THREE</h1>
      </div>

      <div class="tile bg-principale">
        <h1 class="tile-marker">FOUR</h1>
      </div>

      <div class="tile bg-principale">
        <h1 class="tile-marker">FIVE</h1>
      </div>

    </div>
  </AppLayout>

</template>

<style>
.tile {
  cursor: pointer;
  max-height: 100vh;
}

.tile-body__title {
  margin-top: 10px;
  margin-bottom: 10px;
}

.tile-body {
  margin-left: 10px;
  margin-bottom: 10px;
}

.tile-body__price {
  margin-top: 10px;
  font-size: 20px;
}

.tile-body__km {
  margin-left: 10px;
  font-size: 20px;
}

.tile-head__img {
 width: 100%;
 
}

.tile-head__img:hover{

}

.tile__filtre {
  padding: 15px 40px;
  border: 1px solid black;
}


.bg-principale {
  background-color: var(--couleur-principale);
}
.bg-secondaire {
  background-color: var(--couleur-secondaire);
}

</style>