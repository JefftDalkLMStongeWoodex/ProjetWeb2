<script setup>
  import PrimaryButton from '@/Components/PrimaryButton.vue';
  const props = defineProps(['lang']);

</script>

<template>

  <div class="AppelAction">

    <div class="titre">
      <h3> {{ lang.question }} </h3> </div> 
    <div class="Bouton_fiche"> 
      <PrimaryButton> {{ lang.telephoner }} </PrimaryButton>
    <PrimaryButton> {{ lang.discuter }}</PrimaryButton>

    </div>

  </div>
 
</template>

<style scoped>

.AppelAction{
 display: flex;
 flex-direction: column;
  margin: auto 0 ;
  align-items: center;
  background-color: var(--couleur-secondaire-leger);
  color: var(--couleur-blanc);
  padding-top: 6rem;
  padding-bottom: 6rem;
  gap: 2rem;
}

.titre{
  margin: unset;
  text-align: center;
}

.titre > h3 {
  margin: unset;
}

.Bouton_fiche {
  display: flex;
  flex-direction: row; 

  


}

.icon-send {
  margin-right: 1rem;
  

}




</style>