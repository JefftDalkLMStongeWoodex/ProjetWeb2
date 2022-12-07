<script>
  export default {
    name: 'SousMenu',
    provide () {
      return {
        sharedState: this.sharedState
      }
    },
    data () {
      return {
        sharedState:{
          active: false
        } 
      }
    },
    methods: {
      toggle () {
        this.sharedState.active = !this.sharedState.active
      }
    }
}
</script>


<template>
  <div @click="toggle">
    <slot name="toggler">

      <div class="barre-des-filtres__liste">
        <button class="barre-des-filtres__liste">MARQUE & MODELE</button>
        <button class="ml-2">PRIX</button> 
        <button class="ml-2">COULEUR</button>
        <!-- <button>KM</button>
        <button>CARROSSERIE</button>
        <button>TRANSMISSION</button>
        <button>TRACTION</button>
        <button>CONDITION</button> 
        <button><a>CYLINDRE</a></button>
        <button><a>CARBURANT</a></button> -->
      </div>

    </slot>
    <slot/>
  </div>
</template>


<style>
.barre-des-filtres__liste {
  align-items:flex-start;
  cursor: pointer;
  color: var(--couleur-blanc);
  display: flex;
  flex-direction: column;
  gap: 10px;
  justify-content: center;
  padding-left: 10px;
}



.barre-des-filtres__liste {
  min-width: 78px;
}

</style>