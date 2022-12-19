<script setup>
import { useForm } from '@inertiajs/inertia-vue3'
import Select from '@/Components/Select.vue';
const props = defineProps({
    taxes: Object,
    provinces: Object,
    panier: Object
})

const form = useForm({
    provinces: '',
    modeExpedition: ''
})

</script>
<script>
export default{
    computed: {
        sousTotalVoitures: function () {
            let total = 0
            for (let voiture of this.panier) {
                total += voiture.prix
            }
            return total
        }
    },
    methods: {
        calculTaxe (taux) {
            taux = parseFloat(taux)
            console.log(typeof taux)
            return this.sousTotalVoitures * taux
        }
    }
}
</script>
<template>
    <aside class="infoCommande">
        <form action="" @submit.prevent="submit">
            <div>
                <h4>Récapitulatif</h4>
                <dd>
                    <dt>Montant voiture(s):</dt>
                        <dl>{{sousTotalVoitures}}</dl>
                    <dt>Frais de livraison:</dt>
                        <dl></dl>
                    <dt>Sous-total:</dt>
                        <dl></dl>
                    <template v-for="taxe in taxes">
                        <dt>{{taxe.nom}} ({{taxe.taux}}%)</dt>
                            <dl>{{calculTaxe(taxe.taux)}}</dl>
                    </template>
                    <dt>Montant total:</dt>
                        <dl></dl>
                </dd>
            </div>

            <div class="infoCommande__reception">

                <div class="infoCommande__receptionTitre"> Comment souhaité vous recevoir la commande? </div> 
                <br>

                <input type="radio" name="modeExpedition" v-model="modeExpedition" id="livraison" value="1">

                <label for="livraison">
                    Expédition au domicile
                </label>
                <br>
                <input type="radio" name="modeExpedition" v-model="modeExpedition" id="ramassage" value="2">
                <label for="ramassage">
                    Ramassage aux concessionnaire
                </label>

                <div class="">
                    <label >
                        <input type="radio" name="reception" id="" class="radio_input" >
                        <div class="reception__tuile"> Expédition au domicile </div>
                    </label>
                    <label >
                        <input type="radio" name="reception" id="" class="radio_input">
                        <div class="reception__tuile">Ramassage aux concessionnaire </div>
                    </label>


                    <div v-if="form.claimType === 'Option 1'">
                        <span>Show me </span>
                    </div>

               </div> 


            </div>
        </form>
        <section>
            {{form.modeExpedition}}
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
    background-color: rgba(255, 255, 255, 0) ;
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
