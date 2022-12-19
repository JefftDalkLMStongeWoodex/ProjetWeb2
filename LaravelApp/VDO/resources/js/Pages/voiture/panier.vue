<script setup>
 import PrimaryButton from '@/Components/PrimaryButton.vue';

 
</script>

<template>
    <AppLayout :lang="langAppLayout">
        <section>
            <h1>Fiche Produit</h1>
            <div class="grid">
                <div class="grid_item grid_item1"> 
                   
                
                </div>
                <div class="grid_item grid_item2">   
                    <div> 
                    </div>
                </div>

                
            </div>
        </section>  
    </AppLayout>
</template>

<style scoped>


.grid{
    display: grid;
    grid-template-columns: repeat(12, [col] 1fr);
    grid-auto-rows: minmax(50px, auto);
    column-gap: 1em;
    row-gap: 10px; 
    margin: 2em ;
    background-color: var(--couleur-secondaire-leger);
}


.grid_item{
    background-color: #eee; 
    text-transform: uppercase;
    padding: 1em;
    font-size: 15px;
     outline: 1px red dashed; 

}
.grid_item1  {
    grid-column: col 1/ span 8;
    min-height: 400px;
}

.grid_item2 {
    grid-column: col 9 / span 4;
  
}

.grid_item3{
    grid-column: col 9 / span 4;
}

.grid_item4{
    grid-column: col 9 / span 4;
   
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