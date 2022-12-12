<script setup>
  import TuileIcon from  '@/Components/TuileIcon.vue';
  import km from '/resources/assets/icones/kilometrage.svg';

  const props = defineProps(['specifications', 'active', 'lang']);
</script>

<template>

        <section class="wrapper specification"> 
          <h1 style="">SPÉCIFICATIONS  </h1>
            <div class="grid  ">
                <div class="grid_item grid_item1">                                 
                  <TuileIcon>
                    <!--  Icon -->
                        <template #icon>
                          <img :src="km" alt="logo VDO">
                      </template>
                    <!--  Contenu -->
                      <template #contenu>
                    KM
                    </template>
                  </TuileIcon>              
                </div>
                <div class="grid_item grid_item2">  2  </div>
                <div class="grid_item grid_item3">   3 </div>

                <div class="grid_item grid_item4">  4  </div>
                <div class="grid_item grid_item5">   5 </div>
                <div class="grid_item grid_item6">    6</div>
                    
            </div>
        </section>

</template>

<style scoped>

.specification{
padding-top: 2rem;
padding-bottom: 4rem;

}
.grid{
  display: grid;
  grid-template-columns: repeat(12, [col] 1fr);
  grid-auto-rows: minmax(50px, auto);
  column-gap: 1em;
  row-gap: 15px; 
}


.grid_item{
  background-color: var(--couleur-secondaire);
  text-transform: uppercase;
  padding: 1em;
  font-size: 15px;
 color: white;

}
.grid_item1 , .grid_item4{
  grid-column: col   / span 4;
  
}

.grid_item2 ,.grid_item5 {
  grid-column: col 5 / span 4;

}


.grid_item3 ,.grid_item6{
  grid-column: col 9/ span 4;
}



@media screen and (max-width: 1020px){
  .grid_item{
    grid-column: col / span 12;
  }

 

}

@media screen  and (max-width: 600px){
  .grid_item1, .grid_item2 {
      grid-column: col / span 12;
  }
  
}




</style>