<script setup>
import { useForm } from '@inertiajs/inertia-vue3'
import Select from '@/Components/Select.vue';
const props = defineProps({
    taxes: Object,
    provinces: Object,
    liste: Object
})
const form = useForm({
  provinces: ''
})
</script>
<script>
</script>
<template>
    <aside class="infoCommande">
        <form action="" @submit.prevent="submit">

            <div class="infoCommande__province"> 

                <label for="provinces_id">
                    Veuillez selectionner votre province:
                </label>

            
                <Select
                :options = "props.provinces"
                colonneAffichee = 'nom'
                v-model = "form.provinces"
                name="provinces_id"
                />

           </div>

            <div class="infoCommande__reception">

               <div class="infoCommande__receptionTitre"> Comment souhaité vous recevoir la commande? </div> 
                <br>
                <!--       Old man Luke Radio    
                <input type="radio" name="livraison" id="">
                <label for="livraison">
                    Expédition au domicile
                </label>
                <br>
                <input type="radio" name="ramassage" id="">
                <label for="ramassage">
                    Ramassage aux concessionnaire 
                </label>
                 -->
                <div class="">
                    <label >
                        <input type="radio" name="reception" id="" class="radio_input">
                        <div class="reception__tuile"> Expédition au domicile </div>
                    </label>
                    <label >
                        <input type="radio" name="reception" id="" class="radio_input">
                        <div class="reception__tuile">Ramassage aux concessionnaire </div>
                    </label>
               </div> 

            </div>
        </form>
        <section>
            
        </section>
    </aside>
</template>
<style scoped>

.infoCommande__province{
    display: flex;
    flex-direction: column;
    padding: 1rem;
}

.infoCommande__province select{ 
    margin-top: 1rem;
    
}

.infoCommande__province label{ 
    font-size: 0.85rem ;   
    font-weight: bold ;
    color: var(--couleur-principale);
    
}

.infoCommande__reception{
    
    display: flex;
    flex-direction: column;
    padding: 1rem;
}

.infoCommande__receptionTitre{
    font-size: 0.85rem ; 
    font-weight: bold ;  
    color: var(--couleur-principale);
}



.reception__tuile{

    display: flex;
    padding: 1rem;
    margin: 1rem 0rem 1rem 0rem;

    cursor: pointer;
    font-size: 1rem;
    font-weight: bolder;
    background-color: var(--couleur-blanc);
    border-width: 0.15rem;
    border-color:    var(--couleur-principale);
    color:   var(--couleur-principale);
} 

.radio_input:checked+ .reception__tuile {

   background-color: var(--couleur-principale);
   color:  var(--couleur-blanc);

}
.radio_input{
display: none; 
}


@media screen  and (max-width: 600px){
    .reception__tuile{
       
        display: flex;
        padding: 0.5rem;
        margin: 1rem 0rem 1rem 0rem;
        cursor: pointer;
        font-size: 1rem;
   
    } 
    
}





</style>
