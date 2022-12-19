<script setup>
import { useForm, Link } from '@inertiajs/inertia-vue3';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import InputLabel from '@/Components/InputLabel.vue'
import InputError from '@/Components/InputError.vue';
import TextInput from '@/Components/TextInput.vue';

const props = defineProps({
    taxes: Object,
    provinces: Object,
    panier: Object,
    modePaiement: Object,
    modeExpedition: Object,
    langCheckout: Object
})

const form = useForm({
    mode_paiements_id: '',
    mode_expeditions_id: '',
    panier: props.panier
})

const submit = () => {
    form.post(route('commande.store'), { preserveState: true})
}
</script>
<script>
export default{
    data() {
        return {
            livraison: false,
            montantLivraison: 300
        }
    },
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
            return this.sousTotalVoitures * taux
        },
        radioLivraison () {
            this.livraison = true
            this.calculMontantTotal()
        },
        radioRamassage () {
            this.livraison = false
            this.calculMontantTotal()
        },
        calculMontantTotal () {
            let total = this.sousTotalVoitures
            for (let taxe of this.taxes) {
                total += (this.sousTotalVoitures * taxe.taux)
            }
            
            if (this.livraison == true) {
                total += 300
            }

            return total
        }
    }
}
</script>
<template>
    <aside class="infoCommande">
        <form @submit.prevent="submit">
            <div class="erreur" v-if="form.errors.mode_paiements_id">{{ form.errors.mode_paiements_id }}</div>
            <div class="erreur" v-if="form.errors.mode_expeditions_id">{{ form.errors.mode_expeditions_id }}</div>
            <div class="infoCommande__reception">
                <div>
                    <p class="infoCommande__receptionTitre">Choisissez un mode de paiement:</p>
                    <div v-for="paiement of modePaiement">
                        <input 
                            type="radio" 
                            :id="paiement.id" 
                            name="mode_paiements_id" 
                            :value="paiement.id" 
                            v-model="form.mode_paiements_id"
                        />
                        <label :for="paiement.id">{{paiement.nom}}</label>
                    </div>
                </div>
                <div>
                    <p class="infoCommande__receptionTitre">Choisissez un mode d'expédition:</p>
                    <div v-for="expedition of modeExpedition">
                        <template v-if="expedition.id == 1">
                            <input 
                                type="radio" 
                                :id="expedition.id" 
                                name="mode_expeditions_id" 
                                :value="expedition.id" 
                                v-model="form.mode_expeditions_id"
                                @click="radioLivraison()"
                            />
                            <label v-if="expedition.id == 1" :for="expedition.id">{{expedition.nom}} (frais de {{ montantLivraison }}$)</label>
                        </template>
                        <template v-else-if="expedition.id == 2">
                            <input 
                                type="radio" 
                                :id="expedition.id" 
                                name="mode_expeditions_id" 
                                :value="expedition.id" 
                                v-model="form.mode_expeditions_id"
                                @click="radioRamassage()"
                            />
                            <label :for="expedition.id">{{expedition.nom}}</label>
                        </template>
                    </div>
                </div>
            </div>
            <div>
                <h4>{{langCheckout.recapitulatif}}</h4>
                <dl>
                    <dt>{{langCheckout.montantVoiture}}</dt>
                    <dd>{{sousTotalVoitures}}</dd>
                    <template v-if="form.mode_expeditions_id == 1">
                        <dt>{{langCheckout.fraisLivraison}}</dt>
                        <dd>{{montantLivraison}} $</dd>
                    </template>
                    <template v-for="taxe in taxes">
                        <dt>{{taxe.nom}} ({{taxe.taux}}%)</dt>
                        <dd>{{calculTaxe(taxe.taux)}}</dd>
                    </template>
                    <dt>{{langCheckout.montantTotal}}</dt>
                    <dd>{{ calculMontantTotal(livraison) }}</dd>
                </dl>
            </div>
            <div v-if="form.mode_paiements_id == 15">
                    <PrimaryButton :disabled="form.processing">Payer via Paypal</PrimaryButton>
                </div>
                <div v-else>
                    <PrimaryButton :disabled="form.processing">Passer la commande</PrimaryButton>
                </div>
        </form>
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

dl {
    display: flex;
    width: 100%;
    flex-wrap: wrap;
    padding-top: 1rem;
}

dl > dt,
dl > dd {
    width: 50%;
}

dl > dt {
    font-weight: bold;
}

.erreur {
    color: red;
    font-weight: bold;
}

</style>
