<script setup>
import { Head, useForm } from '@inertiajs/inertia-vue3'
import { ref } from 'vue'
import AppLayout from '@/Layouts/AppLayout.vue'
import Tuiles from '@/Components/Tuiles.vue'
import SectionFiltres from '@/Components/SectionFiltres.vue'
import FiltreMinMax from '@/Components/FiltreMinMax.vue'
import Select from '@/Components/Select.vue'
import Pagination from '@/Components/Pagination.vue'



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
  paginer: Object, 
})
let voitures = props.voitures
const clefTuiles = ref(0)
const moteurRendu = () => {
  clefTuiles.value += 1;
};
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
      break
    case 2:
      triVoitures("prix", "desc")
      break
    case 3:
      triVoitures("annee", "asc")
      break;
    case 4:
      triVoitures("annee", "desc")
      break
    case 5:
      triVoitures("kilometrage", "asc")
      break
    case 6:
      triVoitures("kilometrage", "desc")
      break
    default:
      break
  }
}
function filtreVoitures(filtre) {
  const newData = props.voitures.filter(
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
  voitures = newData
  moteurRendu()
}
function porteVoitures(filtre) {
  const newData = props.voitures.filter(
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
  voitures = newData
  moteurRendu();
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
function reinitialisationForm() {
  form.reset()
  voitures = props.voitures
  moteurRendu()
}

function displayFiltres(){
  document.querySelector('.filtreSidebar__contenu').style.display = 'flex'
  document.querySelector('.boutonOuvert').style.display = 'none'
  document.querySelector('.boutonFermer').style.display = 'block'
}

function hideFiltres(){
  document.querySelector('.filtreSidebar__contenu').style.display = 'none'
  document.querySelector('.boutonOuvert').style.display = 'block'
  document.querySelector('.boutonFermer').style.display = 'none'

}
</script>
<template>
  <Head title="Catalogue" />
  <AppLayout :lang="langAppLayout">
    <section class="catalogue wrapper">
      <aside class="catalogue__sidebar">
          <div class="filtreSidebar">
            <div class="filtreSidebar__entete">
              <h4 class="filtreSidebar__titre">{{langCatalogue.filtres}}</h4>
              <div class="catalogue__sidebar-actions">
                <!-- <div class="filtreSidebar__reset" @click="resetForm">{{langCatalogue.renitialiser}}</div> -->
                <div class="catalogue__sidebar-toggle-mobile">
                  <button @click = "hideFiltres" id="boutonFermer" class="boutonFermer">
                    <i class="fa-solid fa-xmark"></i>
                  </button>
                  <button @click = "displayFiltres" id="boutonOuvrir" class="boutonOuvert">
                    <i class="fa-solid fa-filter"></i>
                  </button>
                </div>
              </div>
            </div>
            <div class="filtreSidebar__contenu">
              <form action="">
                <input type="reset" :value="langCatalogue.renitialiser" @click="reinitialisationForm">
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
      </aside>
      <section class="catalogue__contenu">
        <header>
          <h4>{{langCatalogue.resultats}}</h4> 
          
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
        </header>

     

        <div class="catalogue__grille">
           
          <Tuiles
            :data = "paginer.data"
            :key = "clefTuiles"
          />

          
        </div>

              <!--  Pagination -->
              <pagination :paginer="paginer" />

          


      </section>
    </section>
  </AppLayout>
</template>

<style scoped>
  html {
    --card-width: 25ch;
  }

  .catalogue__grille {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(var(--card-width), 1fr));
    gap: 10px;
    padding-top: 2rem;
    padding-bottom: 2rem;
  }

  .catalogue {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
  }

  .catalogue > * {
    flex-grow: 1;
  }

  .catalogue__sidebar {
    flex-basis: 20ch;
    flex-grow: 1;
  }

  .catalogue__contenu {
    flex-basis: 40ch;
    flex-grow: 5;
  }



  .catalogue__sidebar-actions {
    display: flex;
    flex-direction: row; 
    justify-content: flex-end;
    gap: 1rem;
  }

  .boutonFermer {
    display: none;
  }

  .boutonOuvert {
    display: block;
  }

  .filtreSidebar__reset {
    margin-right: auto;
  }

  .filtreSidebar__contenu {
    display: none;
  }

  @media screen and (min-width: 800px) {
    .catalogue__sidebar-toggle-mobile {
      display: none;
    }
    .filtreSidebar__contenu {
      display: block !important;
    }
  }

</style>
