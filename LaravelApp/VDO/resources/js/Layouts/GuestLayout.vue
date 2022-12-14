<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import voitureFormulaire from '/resources/assets/voitureFormulaire.jpeg';
import { Link } from '@inertiajs/inertia-vue3';
import MenuPrincipaleVue from '@/Components/MenuPrincipale.vue';
import PiedPageVue  from '@/Components/PiedPage.vue';

defineProps({
    lang: Object,

});
</script>


<template>
    

        <!-- Page Heading -->
        <header class="header">
            <nav class="header__navigation">
                <div class="wrapper__navigation wrapper">
                    <MenuPrincipaleVue :lang="lang"  />
                    
                </div>
            </nav>
        </header>

    <div class="conteneur ">
        <div class="conteneur-formulaire  wrapper">
            <div class="">
               
        
                <div class="formulaire">
                    <slot />
                </div>
        
            </div>
    
            <div class="image">
                <img :src="voitureFormulaire" alt="voiture formulaire de creation de compte">
            </div>
    
    

        </div>
        
    </div>

  <!-- Footer -->
  <footer class="footer">

    <PiedPageVue :lang="lang"  />
    
</footer>



</template>
<style scoped>


.conteneur-formulaire{
    grid-template-columns: 1fr;
}
.image{
    width: 100%;
    overflow: hidden;
    order: -1;
}

@media (min-width: 900px) {
	.conteneur{
        display: flex;
        background: var(--couleur-secondaire-leger)
    }
    
    .conteneur-formulaire{
        display: grid;
        margin: 2rem;
        grid-template-columns: 1fr 1fr;
        justify-content: center;
        align-items: center;
    }
    
    .formulaire{
        padding: 40px 40px;
    }
    
    .image{
        width: 100%;
        padding: 25px 20px;
    }
    


    .wrapper__navigation {
        display: flex;
    }

    .header__navigation {
        background-color: var(--couleur-secondaire);
        color: var(--couleur-blanc);
        text-decoration: none;
    }

}


</style>