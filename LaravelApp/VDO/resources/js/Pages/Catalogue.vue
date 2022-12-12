<script setup>
import { Head, useForm } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import Tuile from '@/Components/Tuile.vue';
import SectionFiltres from '@/Components/SectionFiltres.vue';
import FiltreMinMax from '@/Components/FiltreMinMax.vue';
import Select from '@/Components/Select.vue';


const props = defineProps({
  langAppLayout: Object,
  langCatalogue: Object,
  voitures: Object,
  modeles: Object,
  constructeurs: Object,
  corps: Object,
  transmissions: Object,
  groupeMotopropulseurs: Object,
  carburants: Object,
  etats: Object,
})

const form = useForm({
  modeles:[],
  constructeurs:[],
  corps:[],
  transmissions:[],
  groupeMotopropulseurs:[],
  carburants:[],
  etats:[],
  kilometrage:{
    min:'',
    max:''
  },
  prix: {
    min:'',
    max:''
  },
})
</script>
<template>
  <Head title="Catalogue" />
  <AppLayout :lang="langAppLayout">
    <section class="catalogue">
      <aside class="catalogue__sidebar">
        <div class="catalogue__sidebar__contenu">
          <div class="filtreSidebar">
            <div class="filtreSidebar__entete">
              <h4 class="filtreSidebar__titre">Filtres</h4>
              <div class="filtreSidebar__reset">Rénitialiser</div>
            </div>
            <div class="filtreSidebar__contenu">
              <form action="">
                <SectionFiltres
                :options = "$props.constructeurs"
                titre = 'Constructeurs'
                colonneAffichee = 'nom'
                v-model = "form.constructeurs"
                />
                <SectionFiltres
                :options = "$props.groupeMotopropulseurs"
                titre = 'Groupe Motopropulseurs'
                colonneAffichee = 'type'
                v-model = "form.groupeMotopropulseurs"
                />
                <SectionFiltres
                :options = "$props.corps"
                titre = 'Corps'
                colonneAffichee = 'type'
                v-model = "form.corps"
                />
                <SectionFiltres
                :options = "$props.transmissions"
                titre = 'Transmission'
                colonneAffichee = 'type'
                v-model = "form.transmissions"
                />
                <SectionFiltres
                :options = "$props.carburants"
                titre = 'Carburants'
                colonneAffichee = 'type'
                v-model = "form.carburants"
                />
                <SectionFiltres
                :options = "$props.etats"
                titre = 'États'
                colonneAffichee = 'nom'
                v-model = "form.etats"
                />
                <FiltreMinMax
                nom = 'Prix' 
                untite = '$'
                v-model = "form.prix"
                />
                <FiltreMinMax
                nom = 'Kilometrage' 
                untite = 'km'
                v-model = "form.kilometrage"
                />
              </form>
            </div>
          </div>
        </div>
      </aside>
      <section class="catalogue__contenu">
        <h4 class="">CATALOGUE DES VEHICULES</h4>
        <div class="catalogue__contenu__tri">
          <select>
            <option value="" disabled selected>Trier par :</option>
            <option value="1">Prix: bas à élevés</option>
            <option value="2">Prix: élevés à bas</option>
            <option value="3">Année: croissante</option>
            <option value="4">Année: décroissante</option>
            <option value="5">KM: bas à élevés</option>
            <option value="6">KM: élevés à bas</option>
          </select>
        </div>
        <div class="catalogue__grid">
          <slot v-for="voiture in $props.voitures">
            <Tuile
            :data = "voiture"
            />
          </slot>
        </div>
      </section>
    </section>
  </AppLayout>
</template>

<style>
.catalogue {
  display: flex;
  align-items: flex-start;
}

.catalogue__sidebar {
  width: 360px;
  flex-shrink: 0;
  border-right:  1px solid rgba(128, 128, 128, 0.175);;
  position: sticky;
  height: 100vh;
  z-index: 1;
  transition: all 200ms ease;
}

.catalogue__sidebar__contenu {
  position: relative;
  height: 100%;
  transition: opacity 200ms ease-in-out;
  overflow-y: auto;
  position: relative;
}

.filtreSidebar {
  width: 100%;
  height:100%;
}

.filtreSidebar__entete {
  display: flex;
  align-items: center;
  flex-direction: row;
  flex-wrap: nowrap;
  justify-content: space-between;
  padding: 20px 25px 20px;
}

.optionFiltre {
  border-top: 0.04rem solid rgba(128, 128, 128, 0.175);
}

.optionFiltre__entete {
  cursor: pointer;
  display: flex;
  align-items: center;
  padding: 20px 30px;
}


.optionFiltre__titre {
  margin: 0;
  padding-right: 1.25rem;
  flex-grow: 1;
}

.optionFiltre__contenu {
  padding: 0 30px;
  height: auto;
  opacity: 1;
  overflow: visible;
  transition: opacity 200ms ease-in-out,overflow 200ms ease-in-out 300ms;
}


.catalogue__contenu {
  padding-left: 0.6rem;
}

.catalogue__grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(var(--card-width), 1fr));
  gap: 10px;
  margin-top: 1rem;
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

.vehicule-img {
  aspect-ratio: 4/3;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.catalogue__contenu__tri {
  display: flex;
  flex-direction: row-reverse;
}
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


img {
  width: 100%;
  object-fit: contain;
  object-position: center center;
}


@media screen and (max-width: 1439px) {
  .catalogue__sidebar {
    width: 340px;
    flex-shrink: 0;
    border-right:  1px solid gray;
    position: sticky;
    height: 100vh;
    z-index: 1;
    transition: all 200ms ease;
    
  }
}

@media screen and (max-width: 1024px) {
  .catalogue__sidebar {
    width: 100%;
    position: relative;
    height: auto;
    overflow-y: initial;
  }
}



</style>
