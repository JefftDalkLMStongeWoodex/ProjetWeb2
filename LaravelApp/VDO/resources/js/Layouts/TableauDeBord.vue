<script setup>
import { ref } from 'vue';
const showingNavigationDropdown = ref(false);
</script>

<template>
<body>
   
 
        <!-- Page Heading -->
        <header class="barre_latérale" v-if="$slots.header">
             <nav class="header__navigation">
                <div class="">     
                     <div class="">
                        <slot name="header" />
                    </div>
                </div>
            </nav>

        </header>

        <!-- Page Content -->
        <main class="conteneur">
           
                <slot />
        
            
        </main>
   

</body>
   
</template>
<style scoped>



body{
    flex-direction: column;
    


}
.barre_latérale{
    background-color: var(--couleur-secondaire);
}


@media (min-width: 900px) {

    body{
        display: flex;
        min-height: 100vh;
        flex-direction: row;
    }
    
    .conteneur{
    flex-grow: 1;
    min-height: 100%;
    display: flex;
    
    }
}


</style>