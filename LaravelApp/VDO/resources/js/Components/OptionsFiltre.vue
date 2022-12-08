<script>
export default {
  name: 'OptionsFiltre',
  provide () {
    return {
      sharedState: this.sharedState
    }
  },

}

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
})


</script>

<template>
  <div>
      <div class="barre-des-filtres__liste">
        <div class="checkbox">
          <input type="checkbox">
          <label>Marque</label>
        </div>
        
        <!-- <button class="barre-des-filtres__liste">MARQUE</button> -->
        <!-- <button>MODELE</button> -->
        <!-- <button class="ml-2">PRIX</button> 
        <button class="ml-2">COULEUR</button> -->
        <!-- <button>KM</button>
        <button>CARROSSERIE</button>
        <button>TRANSMISSION</button>
        <button>TRACTION</button>
        <button>CONDITION</button> 
        <button><a>CYLINDRE</a></button>
        <button><a>CARBURANT</a></button> -->
      </div>

    <slot/>
  </div>
</template>

<style>

.barre-des-filtres__liste {
  /* align-items:flex-start;
  cursor: pointer;
  color: var(--couleur-secondaire);
  display: flex;
  flex-direction: column;
  gap: 10px;
  justify-content: center;
  padding-left: 10px; */
}


/* .barre-des-filtres__liste {
  min-width: 78px;
} */

</style>