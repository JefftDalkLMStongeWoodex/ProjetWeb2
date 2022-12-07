<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import SousMenu from '@/Components/SousMenu.vue';
import SousMenuCorps from '@/Components/SousMenuCorps.vue';
import SousMenuItem from '@/Components/SousMenuItem.vue';

defineProps({
  langAppLayout: Object,
})
</script>

<template>
  <Head title="Catalogue" />
  <AppLayout :lang="langAppLayout">
    <aside class="filtre-conteneur">
        <h3 class="">Filtres</h3>
        <SousMenu>
          <template slot="toggler">
            <button></button>
          </template>
          <SousMenuCorps>
            <SousMenuItem><a>Acura</a></SousMenuItem>
            <SousMenuItem><a>Chevrolet</a></SousMenuItem>
            <SousMenuItem><a>Chrysler</a></SousMenuItem>
          </SousMenuCorps>
        </SousMenu>
      </aside>

      <section class="catalogue">
        <h4 class="">CATALOGUE DES VEHICULES</h4>
        <select class="tri">
            <option value="" disabled selected>Trier par</option>
            <option>Prix: bas à élevés</option>
            <option>Prix: élevés à bas</option>
            <option>Année: croissante</option>
            <option>Année: décroissante</option>
            <option>KM: bas à élevés</option>
            <option>KM: élevés à bas</option>
        </select>
        <div class="catalogue__grid">
            <div class="tuile-vehicule">
              <div class="tuile-vehicule__img-wrapper">
                <img src="../../assets/kiaForte2015.jpg" class="tuile-vehicule-img"/>
              </div>
              <h5 class="">
                2015 Kia Forte LX
              </h5>
              <div class="tuile-vehicule__details">
                  <span>79 364 km</span>
              </div>
            </div>
            <div class="tuile-vehicule">
              <div class="tuile-vehicule__img-wrapper">
                <img src="../../assets/kiaForte2015.jpg" class="tuile-vehicule-img"/>
              </div>
              <h5 class="">
                2015 Kia Forte LX
              </h5>
              <div class="tuile-vehicule__details">
                  <span>79 364 km</span>
              </div>
            </div>
            <div class="tuile-vehicule">
              <div class="tuile-vehicule__img-wrapper">
                <img src="../../assets/kiaForte2015.jpg" class="tuile-vehicule-img"/>
              </div>
              <h5 class="">
                2015 Kia Forte LX
              </h5>
              <div class="tuile-vehicule__details">
                  <span>79 364 km</span>
              </div>
            </div>
            <div class="tuile-vehicule">
              <div class="tuile-vehicule__img-wrapper">
                <img src="../../assets/kiaForte2015.jpg" class="tuile-vehicule-img"/>
              </div>
              <h5 class="">
                2015 Kia Forte LX
              </h5>
              <div class="tuile-vehicule__details">
                  <span>79 364 km</span>
              </div>
            </div>
        </div>
    </section>

  </AppLayout>

</template>

<style>
.filtre-conteneur {
  position: fixed; 
  height: 100%;
  background-color: var(--couleur-principale);
}

.catalogue__grid {
  display: grid;
	grid-template-columns: repeat(auto-fit, minmax(var(--card-width), 1fr));
	gap: 10px;
  margin-top: 1rem;
}

.tuile-vehicule {
  border: solid 1px var(--couleur-secondaire);
  border-radius: 8px;
  padding-top: 1rem;
  padding-bottom: 1rem;
  display: flex;
  flex-direction: column;
  gap: 1rem;
  justify-content: space-between;
}

.tuile-vehicule-img {
  aspect-ratio: 4/3;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}
.tuile-vehicule__details {

}

img {
  width: 100%;
  object-fit: contain;
  object-position: center center;
}
</style>




    <!-- <div class=" mt-8 m-auto grid md:grid-cols-3 lg:grid-cols-5 gap-4">
      <aside class="tile row-span-6">

          
    <section>
      <div class="flex justify-between">
        <h1 class="text-3xl mb-6">Catalogue</h1>
        <input type="search" placeholder="Search"/>
      </div>

    </section>


        <div class="grid md:grid-cols-3 lg:grid-cols-5 gap-4">
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
      </div>


        <div class="flex items-center justify-around">
          <span class="font-bold uppercase">Filtres</span>
          <span class="font-bold uppercase">Rénitialiser</span>
        </div>
        
      </aside>

      <div class="flex  justify-between">
        <h1 class="text-3xl mb-6">Autos usagées à vendre</h1>
        <input type="search" placeholder="search">
      </div>

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

    </div> -->