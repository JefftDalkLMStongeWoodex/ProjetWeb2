<script setup>
 import PrimaryButton from '@/Components/PrimaryButton.vue';

 const props = defineProps(['detailVoiture', 'active', 'lang']);
</script>
<script>
    export default {
        computed: {
            prix () {
                return this.detailVoiture.prix_paye * 1.25 
            }
        }
    }
</script>
<template>
  <h3>  {{detailVoiture.modele.nom}}   {{detailVoiture.corps.type}}  </h3>
  <h4>{{prix}} $ </h4>

<p> {{detailVoiture.description}} </p>

<div class="Button_fiche">
<PrimaryButton>
    Reserver en ligne
</PrimaryButton>
<PrimaryButton>
    Acheter en ligne
</PrimaryButton>

<PrimaryButton>
    Nous contacter
</PrimaryButton>
</div>

</template>

<style scoped>

.Button_fiche {
    display: flex;
    flex-direction: column;
    padding: 1rem;


}
  .icon-send {
   margin-top: 1rem;

}



</style>