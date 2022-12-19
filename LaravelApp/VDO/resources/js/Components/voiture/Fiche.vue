<script setup>
 import PrimaryButton from '@/Components/PrimaryButton.vue';
 import { Link } from '@inertiajs/inertia-vue3';

 const props = defineProps(['detailVoiture', 'active', 'lang']);
</script>
<script>
    export default {
        computed: {
            prix () {
                return this.detailVoiture.prix_paye * 1.25 
            }
        }, 
        methods: {
            ajouterAuPanier () {
                if (sessionStorage.getItem("panier") == null) {
                    sessionStorage.setItem("panier", "[]")
                }
                let panier = JSON.parse(sessionStorage.panier)
                panier = [...panier, this.detailVoiture]                
                panier = JSON.stringify(panier)
                sessionStorage.setItem("panier", panier)
            },
            reserverVoiture (id) {
                console.log('balls');
                window.location.replace(`/voiture/reservation/${id}`)
            }
            
        }
    }
</script>
<template>
  
  <template v-if="$page.props.lang.locale == 'en'">
    <h3>  {{detailVoiture.annee}} {{detailVoiture.modele.constructeur.nom}} {{detailVoiture.corps.type_en}}</h3>
    <h4>{{prix}} $ </h4>

    <p> {{detailVoiture.description_en}} </p>
   </template>
   <template v-else="$page.props.lang.locale == 'fr'">
    <h3>  {{detailVoiture.annee}} {{detailVoiture.modele.constructeur.nom}} {{detailVoiture.corps.type}}</h3>

    <h4>{{prix}} $ </h4>

    <p> {{detailVoiture.description}} </p>

  </template>

  


<div class="Button_fiche">
    <PrimaryButton @click="reserverVoiture(detailVoiture.id)">
        {{lang.reserve}}
    </PrimaryButton>

    <PrimaryButton @click="ajouterAuPanier">
        {{lang.ajouter_panier}}
    </PrimaryButton>

    <Link :href="route('contact')">  <PrimaryButton>
      {{lang.contacter}}
    </PrimaryButton></Link> 
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