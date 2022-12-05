<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import voitureFormulaire from '/resources/assets/voitureFormulaire.jpeg';
import { Link } from '@inertiajs/inertia-vue3';
</script>

<template>
    <div class="conteneur ">
        <div class="conteneur-formulaire wrapper ">
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
</template>
<style scoped>

.conteneur{
    display: flex;
    background: var(--couleur-secondaire);
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

@media screen and (max-width: 1024px){
	.conteneur-formulaire{
		grid-template-columns: 1fr;
	}
	.image{
		width: 100%;
        overflow: hidden;
        order: -1;
	}
}
</style>