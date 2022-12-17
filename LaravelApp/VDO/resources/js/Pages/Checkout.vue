<script setup>
import { Head } from '@inertiajs/inertia-vue3'
import AppLayout from '@/Layouts/AppLayout.vue'
import ListePanier from '@/Components/Checkout/ListePanier.vue'
import InfoCommande from '@/Components/Checkout/InfoCommande.vue'
const props = defineProps({
    panier: Object,
    taxes: Object,
    provinces: Object,
    langAppLayout: Object,
    langCheckout: Object,
})
let commande = props.panier;
</script>
<template>
    <AppLayout :lang="langAppLayout">
        <body>
            <Head title="Checkout" />
            <section class="wrapper__checkout">
                <h1>Passer à la caisse</h1>

                <div class="grid">

                    <div class="grid_item grid_item1"> 

                        <ListePanier
                        :liste = "commande"
                        />

                    </div>
                    <div class="grid_item grid_item2">   
                            
                        <InfoCommande
                        :liste = "commande"
                        :taxes = "props.taxes"
                        :provinces = "props.provinces"
                        />
                            
                    </div>

                </div>
            
            </section>
        </body>
        
    </AppLayout>
</template>
<style scoped>
body{
    
    background-color: var(--couleur-secondaire-leger)
}

body h1{
text-align: center;
padding: 1rem;
color: var(--couleur-principale);    
}
.wrapper__checkout{
    margin: 0rem 2rem ;
  
}
.grid{
    display: grid;
    grid-template-columns: repeat(12, [col] 1fr);
    grid-auto-rows: minmax(50px, auto);
    column-gap: 1em;
    row-gap: 10px;
 
}


.grid_item{
   /* background-color: #eee; */
    background-color:  var(--couleur-secondaire);
    text-transform: uppercase;
    padding: 1em;
    font-size: 15px;


}
.grid_item1  {
    grid-column: col 1/ span 8;
    min-height: 400px;
}

.grid_item2 {
    grid-column: col 9 / span 4;
  
}



@media screen and (max-width: 1025px){
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