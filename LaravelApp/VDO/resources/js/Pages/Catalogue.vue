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
  tri: ''
})
const tri = () => {
  switch (form.tri) {
    case 1:
      triVoitures("prix", "asc")
      break;
    case 2:
      triVoitures("prix", "desc")
      break;
    case 3:
      triVoitures("annee", "asc")
      break;
    case 4:
      triVoitures("annee", "desc")
      break;
    case 5:
      triVoitures("kilometrage", "asc")
      break;
    case 6:
      triVoitures("kilometrage", "desc")
      break;  
    default:
      break;
  }
}
function filtreVoitures(filtre) {
  const data = props.voitures.filter(
    (voiture) => {
      let bool = false
      if(form[filtre].length===0) {
        bool = true
      }
      else{
        for(let f of form[filtre]) {
          if (voiture[filtre] == f) {
            bool = true
          }
        }
      }
      return bool
    }
  )
  console.log(data);
}
function porteVoitures(filtre) {
  const data = props.voitures.filter(
    (voiture)=>{
      let bool = true
      if(form[filtre].min !== '') {
        if(voiture[filtre]<form[filtre].min){
          bool = false
        }
      }
      if(form[filtre].max!=='') {
        if(voiture[filtre]>form[filtre].max) {
          bool = false
        }
      }
      return bool
    }
    )
    console.log(data);
}
function triVoitures(propriete, ordre) {
  props.voitures.sort(function(a, b) {
    if (ordre == "asc") {
      if (a[propriete] < b[propriete]) return -1
      if (a[propriete] > b[propriete]) return 1
      return 0
    } else if (ordre == "desc") {
      if (a[propriete] < b[propriete]) return 1
      if (a[propriete] > b[propriete]) return -1
    }
  })
}
function resetForm() {
  form.reset();
}
function displayFiltres() {
  document.querySelector('.catalogue__sidebar').style.display = 'flex'
}
function hideFiltres() {
  document.querySelector('.catalogue__sidebar').style.display = 'none'
}
</script>
<template>
  <Head title="Catalogue" />
  <AppLayout :lang="langAppLayout">
    <section class="catalogue">
      <aside class="catalogue__sidebar">
        <div class="catalogue__sidebar__contenu">
          <div class="filtreSidebar">
            <div class="filtreSidebar__entete">
              <h4 class="filtreSidebar__titre">{{langCatalogue.filtres}}</h4>
              <div class="filtreSidebar__reset" @click="resetForm">{{langCatalogue.renitialiser}}</div>
              <button @click = "hideFiltres" id="bouttonFermer">
                <i class="fa-solid fa-xmark"></i>
              </button>
            </div>
            <div class="filtreSidebar__contenu">
              <form action="">
                <SectionFiltres
                :options = "$props.constructeurs"
                :titre = "langCatalogue.constructeurs"
                colonneAffichee = 'nom'
                v-model = "form.constructeurs"
                @change="filtreVoitures('constructeurs')"
                />
                <SectionFiltres
                :options = "$props.groupeMotopropulseurs"
                :titre = "langCatalogue.motoprop"
                colonneAffichee = 'type'
                v-model = "form.groupeMotopropulseurs"
                @change="filtreVoitures('groupeMotopropulseurs')"
                />
                <SectionFiltres
                :options = "$props.corps"
                :titre = "langCatalogue.corps"
                colonneAffichee = 'type'
                v-model = "form.corps"
                @change="filtreVoitures('corps')"
                />
                <SectionFiltres
                :options = "$props.transmissions"
                :titre = "langCatalogue.transmission"
                colonneAffichee = 'type'
                v-model = "form.transmissions"
                @change="filtreVoitures('transmissions')"
                />
                <SectionFiltres
                :options = "$props.carburants"
                :titre = "langCatalogue.carburants"
                colonneAffichee = 'type'
                v-model = "form.carburants"
                @change="filtreVoitures('carburants')"
                />
                <SectionFiltres
                :options = "$props.etats"
                :titre = "langCatalogue.etats"
                colonneAffichee = 'nom'
                v-model = "form.etats"
                @change="filtreVoitures('etats')"
                />
                <FiltreMinMax
                :titre = "langCatalogue.prix"
                unite = '$'
                v-model = "form.prix"
                @change="porteVoitures('prix')"
                />
                <FiltreMinMax
                :titre = "langCatalogue.annee"
                untite = ''
                v-model = "form.annee"
                @change="porteVoitures('annee')"
                />
                <FiltreMinMax
                :titre = "langCatalogue.kilometrage"
                unite = 'km'
                v-model = "form.kilometrage"
                @change="porteVoitures('kilometrage')"
                />
              </form>
            </div>
          </div>
        </div>
      </aside>
      <section class="catalogue__contenu">
        <button @click = "displayFiltres" id="bouttonOuvrir">
          <i class="fa-solid fa-filter"></i>
        </button>
        <div class="catalogue__contenu__tri">
          <select v-model.number="form.tri" @change="tri">
            <option value="" disabled selected>{{langCatalogue.trierPar}}</option>
            <option value="1">{{langCatalogue.trierPrixASC}}</option>
            <option value="2">{{langCatalogue.trierPrixDSC}}</option>
            <option value="3">{{langCatalogue.trierAnneeASC}}</option>
            <option value="4">{{langCatalogue.trierAnneeDSC}}</option>
            <option value="5">{{langCatalogue.trierKmASC}}</option>
            <option value="6">{{langCatalogue.trierKmDSC}}</option>
          </select>
        </div>
        <div class="catalogue__grid">
          <slot v-for="voiture in props.voitures">
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
  flex-wrap: wrap;
  gap: 20px;
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
.catalogue__sidebar {
  flex-basis: 20ch;
	flex-grow: 1;
    top: 0;
    padding-top: 1rem;
    align-self: flex-start;
    background-color: inherit;
}
.catalogue__sidebar__contenu {
  height: 100%;
  transition: opacity 200ms ease-in-out;
  overflow-y: auto;
  position: relative;
  width: inherit;
  padding-left: 2em;
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
/* .filtreSidebar {

} */

/* .filtreSidebar__entete {
  display: flex;
  align-items: center;
  flex-direction: row;
  flex-wrap: nowrap;
  padding: 20px 25px 20px;
} */

/* .optionFiltre {
  border-top: 0.04rem solid rgba(128, 128, 128, 0.175);
} */

/* .optionFiltre__entete {
  cursor: pointer;
  display: flex;
  align-items: center;
  padding: 20px 30px;
} */

/* .optionFiltre__titre {
  margin: 0;
  padding-right: 1.25rem;
  flex-grow: 1;
} */

/* .optionFiltre__contenu {
  padding: 0 30px;
  height: auto;
  opacity: 1;
  overflow: visible;
  transition: opacity 200ms ease-in-out,overflow 200ms ease-in-out 300ms;
} */

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
@media screen and (max-width: 1439px) {
  .catalogue__sidebar {
    width: 340px;
    flex-shrink: 0;
    position: sticky;
    height: 100vh;
    z-index: 1;
    transition: all 200ms ease;
  }
}
@media screen and (max-width: 1024px) {
  .catalogue__sidebar {
    width: 100%;
    position: fixed;
    height: 100vh;
    width: 100%;
    top: 0;
    left: 0;
    display: none;
    background-color: var(--couleur-blanc);
  }
  #bouttonOuvrir {
    display: inline;
  }
  #bouttonFermer {
    display: inline;
  }
}
</style>
