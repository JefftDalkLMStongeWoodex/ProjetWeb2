<script setup>
import Fiche from '@/Components/voiture/Fiche.vue';
import Gallerie from '@/Components/voiture/Gallerie.vue';
import Specifications from '@/Components/voiture/Specifications.vue';
import AppelAction from '@/Components/SectionAppelAction.vue'; 
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
    langAppLayout: Object,
    langCatalogue: Object,
    voiture: Object,
    modele: Object,
    constructeur: Object,
    corps: Object,
    transmissions: Object,
    groupeMotopropulseurs: Object,
    carburants: Object,
    etats: Object,
    voiture: Object,
});

</script>
<template>
    <AppLayout :lang="langAppLayout">
        <section>
            <h1>Fiche Produit</h1>
            <div class="grid">
                <div class="grid_item grid_item1"> 
                    <Gallerie :imagePrincipale="voiture.imagePrincipale[0]" :images="voiture.images" :lang="langCatalogue"/>
                    <div> <img src="" alt=""></div>
                </div>
                <div class="grid_item grid_item2">   
                    <div> 
                        <Fiche :detailVoiture="voiture" :lang="langCatalogue" />
                    </div>
                </div>

                 <div class="grid_item grid_item3">  
                    <Specifications :Specifications="voiture" />   
                </div>
                 
                <div class="grid_item grid_item12"> 
                    <AppelAction :lang="langCatalogue" />  
                </div>
            </div>
        </section>  
    </AppLayout>
</template>

<style>


.grid{
    display: grid;
    grid-template-columns: repeat(12, [col] 1fr);
    grid-auto-rows: minmax(50px, auto);
    column-gap: 1em;
    row-gap: 15px; 
}


.grid_item{
    /* background-color: #eee; */
    text-transform: uppercase;
    padding: 1em;
    font-size: 15px;
    /* outline: 1px red dashed; */

}
.grid_item1  {
    grid-column: col 1  / span 6;
    
}

.grid_item2 {
    grid-column: col 7 / span 6;
  
}

.grid_item3{
    grid-column: col 1 / span 12;
}

.grid_item12{
    grid-column: col  / span 12;
    min-height: 400px;
}

@media screen and (max-width: 1020px){
    .grid_item1{
        grid-column: col /span 6;
    }

    .grid_item2 {
        grid-column: col 7 /span 6;
    }
    .grid_item3, .grid_item4, .grid_item12{
        grid-column: col /span 12;
    }

}

@media screen  and (max-width: 600px){
    .grid_item1, .grid_item2 {
        grid-column: col / span 12;
    }
    
}

</style>



