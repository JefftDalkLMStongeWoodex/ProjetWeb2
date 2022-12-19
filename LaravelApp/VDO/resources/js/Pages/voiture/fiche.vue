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
            <h1>{{langCatalogue.titre_fiche}}</h1>
            <div class="grid wrapper">
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
                    <Specifications :Specifications="voiture" :lang="langCatalogue"   />   
                </div>
                 
            </div>
            <div class=""> 
                <AppelAction :lang="langCatalogue" />  
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

.wrapper {
    padding-bottom: 6rem; 
}

.grid_item{
    /* background-color: #eee; */
    text-transform: uppercase;
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
    padding-top: 3rem;
}

.grid_item12{
    grid-column: col  / span 12;
    min-height: 400px;
}

@media screen and (max-width: 1020px){
    .grid_item1, .grid_item2 {
        grid-column: col / span 12;
    }
    
}

@media screen  and (max-width: 600px){
    .grid_item1, .grid_item2 {
        grid-column: col / span 12;
    }
    
}

</style>



