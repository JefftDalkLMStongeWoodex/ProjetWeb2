<script setup>
  import PrimaryButton from '@/Components/PrimaryButton.vue';
  import { Link } from '@inertiajs/inertia-vue3';

  const props = defineProps(['lang']);

</script>

<template>

  <div class="AppelAction">

    <div class="titre">
      <h3> {{ lang.question }} </h3> </div> 
    <div class="Bouton_fiche"> 
      <PrimaryButton> <Link :href="route('contact')">     {{ lang.telephoner }}   </Link >   </PrimaryButton>
    <PrimaryButton >  <Link :href="route('contact')">{{ lang.discuter }} </Link></PrimaryButton>

    </div>

  </div>
 
</template>

<style scoped>

.AppelAction{
 display: flex;
 flex-direction: column;
  margin: auto 0 ;
  align-items: center;
  background-color: var(--couleur-secondaire);
  color: var(--couleur-blanc);
  padding: 5rem;

}

.titre{
  padding: 2rem;
  text-align: center;
  width: 100vw;

}

.Bouton_fiche {
  display: flex;
  flex-direction: row; 

  


}

.icon-send {
  margin-right: 1rem;
  

}




</style>