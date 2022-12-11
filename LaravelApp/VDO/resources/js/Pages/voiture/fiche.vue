<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';



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
});



</script>

<template>
  
    <body>
        <h1 style="">Fiche Produit </h1>
        <section>
            <div class="grid">
                <div class="grid_item grid_item1"> 
                    <div> <img src="" alt=""></div>
                 
                </div>
                <div class="grid_item grid_item2">   
                     <div> 
                        <h3> Nom de voiture </h3>
                        <p>  Description Produits boss </p>
                    </div>
                </div>

                <div class="grid_item grid_item3"> 3 Spec</div>
                <div class="grid_item grid_item4">4 Equipement</div>

                   
                <div class="grid_item grid_item12"> 12:Vous avez des questions </div>
            </div>
        </section>


        
    </body>

</template>

<style>
body{
    font-family: sans-serif;
}

.grid{
    display: grid;
    grid-template-columns: repeat(12, [col] 1fr);
    grid-auto-rows: minmax(50px, auto);
    column-gap: 1em;
    row-gap: 15px; 
}


.grid_item{
    background-color: #eee;
    text-transform: uppercase;
    padding: 1em;
    font-size: 15px;
    outline: 1px red dashed;

}
.grid_item1  {
    grid-column: col 1  / span 6;
    
}

.grid_item2 {
    grid-column: col 7 / span 6;
  
}


.grid_item3{
    grid-column: col 1 / span 6;
}


.grid_item4{
    grid-column: col 7 / span 6;
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



