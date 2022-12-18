<script setup>
import { Link } from '@inertiajs/inertia-vue3';
import photoKia from '/resources/assets/kiaForte2015.jpg';
const emit = defineEmits(['suppressionItem'])
</script>
<script>
export default{
    methods:{
        suppressionItem(id) {
            this.$emit('suppressionItem', id);
        }
    }
}
</script>
<template>
    <ul>
        <li v-for="item of $attrs.liste" class="liste_Panier">
            <div class="liste_Panier__image">
                <img v-if="item.imagePrincipale[0] != null" :src="`/storage/${item.imagePrincipale[0].chemin}`" class="vehicule-img" />
                <img v-else src="../../../assets/kiaForte2015.jpg" class="vehicule-img" />
            </div>

            <div class="liste_Panier__details">
                <div class="liste_Panier__nom"> 
                    <Link :href="route('voiture.fiche',item.id)">
                        <p>{{item.annee}} {{item.constructeurs}} {{item.modeles}}</p>
                    </Link>
                </div>  
                <div class="liste_Panier__prix"> 
                    <p>
                        ${{item.prix}}
                    </p>
                </div>
                <div class="liste_Panier__button">
                    <button @click="suppressionItem(item.id)">
                        <i class="fa-solid fa-trash-can"></i>
                    </button>
                </div>
            </div>     
        </li>
    </ul>
</template>
<style scoped>
.liste_Panier{
    display: flex;
    flex-wrap: wrap;
    flex-basis: 100%;
    
}


.liste_Panier:nth-of-type(even){
background-color: rgba(221, 40, 40, 0.137);

  
}

.liste_Panier__image{
    margin-top: 0;
    padding: 2rem;
    margin-right: 0.62rem ;
    width: 25%;
   
}
.liste_Panier__details{
   
    display: flex;
   
    color: var(--couleur-blanc);
    flex-wrap: wrap;
    align-content: space-around;
    justify-content: space-between;
    width: 60%;
   
   
}

.fa-trash-can{
    padding: 0.15rem;
   
    


}



@media (min-width: 900px) {
 

    .fa-trash-can{
        font-size: 1.15rem;
       
        
    
    }

    .fa-trash-can:hover{
        color: var(--couleur-principale);
       
        
    
    }



    .liste_Panier__image{
        margin-top: 0;
        padding: 2rem;
        margin-right: 0.62rem ;
        width: 25%;
       
    }

    
    .liste_Panier:nth-of-type(even){
    
    background-color: rgba(221, 40, 40, 0.014);
  
}


}







</style>
