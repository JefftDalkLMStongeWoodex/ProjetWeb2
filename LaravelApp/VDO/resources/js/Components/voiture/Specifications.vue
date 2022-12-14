<script setup>
  import TuileIcon from  '@/Components/TuileIcon.vue';
  import km from '/resources/assets/icones/kilometrage.svg';

  const props = defineProps(['Specifications', 'active', 'lang']);
</script>

<template>

        <section class="wrapper specification"> 
          <h1 style="">SPÉCIFICATIONS  </h1>
            <div class="grid  ">
                <div class="grid_item grid_item1">                                 
                  <TuileIcon>
                    <!--  Icon -->
                        <template #icon>
                         
                          <svg id="kilometrage" xmlns="http://www.w3.org/2000/svg" width="45.356" height="45.356" viewBox="0 0 30.356 30.356">
                            <path id="Path_9" data-name="Path 9" d="M15.183,0A15.178,15.178,0,1,0,30.356,15.173,15.178,15.178,0,0,0,15.183,0Zm0,28.486a13.3,13.3,0,1,1,13.3-13.3,13.3,13.3,0,0,1-13.3,13.3Z" fill="#fff"/>
                            <path id="Path_10" data-name="Path 10" d="M141.656,75.608a.5.5,0,0,0-.642.3l-2.051,5.617a2.06,2.06,0,0,0-1.371,3.757l-.613,1.687a.5.5,0,0,0,.939.345l.613-1.687a2.06,2.06,0,0,0,1.371-3.757l2.051-5.617A.493.493,0,0,0,141.656,75.608Z" transform="translate(-123.578 -68.333)" fill="#fff"/>
                            <path id="Path_11" data-name="Path 11" d="M51.838,35.275A12.206,12.206,0,0,0,31.594,47.669a.617.617,0,0,0,.767.393l1.812-.594a.282.282,0,0,0,.182-.364c-.067-.192-.134-.393-.192-.594a.291.291,0,0,0-.364-.192l-1.227.4a11.085,11.085,0,0,1-.364-2.818c0-.182,0-.364.01-.546l1.284.134a.291.291,0,0,0,.316-.268c.01-.211.038-.422.067-.623a.292.292,0,0,0-.249-.326l-1.284-.134A10.79,10.79,0,0,1,33.4,38.927l1.112.642a.286.286,0,0,0,.393-.115,6.055,6.055,0,0,1,.316-.537.282.282,0,0,0-.1-.393l-1.112-.642a11,11,0,0,1,2.252-2.5l.757,1.035a.281.281,0,0,0,.4.058c.163-.125.335-.249.508-.364a.282.282,0,0,0,.067-.4l-.757-1.035a11.284,11.284,0,0,1,3.077-1.38l.268,1.256a.292.292,0,0,0,.345.22c.2-.048.4-.1.613-.134a.284.284,0,0,0,.23-.335l-.268-1.256a10.671,10.671,0,0,1,3.374,0L44.611,34.3a.278.278,0,0,0,.23.335c.2.038.412.077.613.134a.28.28,0,0,0,.345-.22l.268-1.256a10.619,10.619,0,0,1,3.077,1.38l-.757,1.035a.289.289,0,0,0,.067.4c.173.115.345.24.508.364a.281.281,0,0,0,.4-.058l.757-1.035a11.244,11.244,0,0,1,2.262,2.5l-1.112.642a.274.274,0,0,0-.1.393c.105.173.211.355.316.537a.286.286,0,0,0,.393.115L53,38.927a10.79,10.79,0,0,1,1.045,3.211l-1.284.134a.279.279,0,0,0-.249.326c.029.2.048.412.067.623a.292.292,0,0,0,.316.268l1.284-.134c.01.182.01.364.01.546a11.14,11.14,0,0,1-.364,2.818l-1.227-.4a.291.291,0,0,0-.364.192c-.058.2-.125.4-.192.594a.279.279,0,0,0,.182.364l1.812.594a.664.664,0,0,0,.192.029.6.6,0,0,0,.575-.422,12.25,12.25,0,0,0,.594-3.776A12.1,12.1,0,0,0,51.838,35.275Zm-4.831,14.56h-7.6a.409.409,0,0,0-.412.412v1.744a.409.409,0,0,0,.412.412h7.6a.409.409,0,0,0,.412-.412V50.247A.409.409,0,0,0,47.007,49.835Zm-6.23,1.121c0,.058-.077.105-.163.105h-.642c-.086,0-.163-.048-.163-.105v-.594c0-.058.077-.105.163-.105h.642c.086,0,.163.048.163.105Zm1.457,0c0,.058-.077.105-.163.105h-.642c-.086,0-.163-.048-.163-.105v-.594c0-.058.077-.105.163-.105h.642c.086,0,.163.048.163.105Zm1.457,0c0,.058-.077.105-.163.105h-.642c-.086,0-.163-.048-.163-.105v-.594c0-.058.077-.105.163-.105h.642c.086,0,.163.048.163.105Zm1.457,0c0,.058-.077.105-.163.105h-.642c-.086,0-.163-.048-.163-.105v-.594c0-.058.077-.105.163-.105h.642c.086,0,.163.048.163.105Zm1.457,0c0,.058-.077.105-.163.105H45.8c-.086,0-.163-.048-.163-.105v-.594c0-.058.077-.105.163-.105h.642c.086,0,.163.048.163.105Z" transform="translate(-28.029 -28.662)" fill="#fff"/>
                          </svg>
                      </template>
                    <!--  Contenu -->
                      <template #contenu>
                        <div class="texte__specification"></div>
                       <p>{{Specifications.kilometrage}}   Km </p> 
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

.specification h1{
  text-align: center;
  

}
.texte__specification p {
font-size: large;
}
svg {
 
 padding: 0.1rem;

}

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

 

  text-transform: uppercase;
  padding: 0em;
  font-size: 15px;
  color: white;
  outline: 2px  solid; 
  outline-color: var(--couleur-secondaire);

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