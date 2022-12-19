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
    <aside class="commande__aside">
        <form @submit.prevent="submit">
            <div class="erreur" v-if="form.errors.mode_paiements_id">{{ form.errors.mode_paiements_id }}</div>
            <div class="erreur" v-if="form.errors.mode_expeditions_id">{{ form.errors.mode_expeditions_id }}</div>
            <div class="">
                <div>
                    <p class="aside__titre">{{langCheckout.paiement_titre}}</p>
                    <div v-for="paiement of modePaiement">
                        <input 
                            type="radio" 
                            :id="paiement.id" 
                            name="mode_paiements_id" 
                            :value="paiement.id" 
                            v-model="form.mode_paiements_id"
                        />
                        <label class="label"
                            v-if="$page.props.lang.locale == 'en'" :for="paiement.id"
                        >
                            {{paiement.nom_en}}
                        </label>
                        <label class="label"
                            v-else 
                            :for="paiement.id"
                        >
                            {{paiement.nom}}
                        </label>
                    </div>
                </div>
                <div>
                    <p class="aside__titre">{{langCheckout.expedition_titre}}</p>
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
                            <label 
                                v-if="$page.props.lang.locale == 'en'" 
                                :for="expedition.id"
                            >
                                {{expedition.nom_en}} ({{langCheckout.label_frais}} {{ montantLivraison }}$)
                            </label>
                            <label 
                                v-else
                                :for="expedition.id"
                            >
                                {{expedition.nom}} ({{langCheckout.label_frais}} {{ montantLivraison }}$)
                            </label>
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
                            <label 
                                v-if="$page.props.lang.locale == 'en'" 
                                :for="expedition.id"
                            >
                                {{expedition.nom_en}}
                            </label>
                            <label 
                                v-else
                                :for="expedition.id"
                            >
                                {{expedition.nom}}
                            </label>
                        </template>
                    </div>
                </div>
            </div>
            <div class="aside__recapitulatif">
                <h4 class="aside__titre-recapitulatif">{{langCheckout.recapitulatif}}</h4>
                <dl>
                    <dt>{{langCheckout.montantVoiture}}</dt>
                    <dd>{{sousTotalVoitures.toFixed(2)}}$</dd>
                    <template v-if="form.mode_expeditions_id == 1">
                        <dt>{{langCheckout.fraisLivraison}}</dt>
                        <dd>{{montantLivraison.toFixed(2)}}$</dd>
                    </template>
                    <template v-for="taxe in taxes">
                        <dt v-if="$page.props.lang.locale == 'en'">{{taxe.nom_en}} ({{taxe.taux}}%)</dt>
                        <dt v-else>{{taxe.nom}} ({{taxe.taux}}%)</dt>
                        <dd>{{calculTaxe(taxe.taux).toFixed(2)}}$</dd>
                    </template>
                    <dt>{{langCheckout.montantTotal}}</dt>
                    <dd>{{ calculMontantTotal(livraison).toFixed(2)}}$</dd>
                </dl>
            </div>
            <small>{{langCheckout.politiques_message}}<a :href="route('politique')" target="_blank">{{langCheckout.politiques}}</a>.</small>
            <div v-if="form.mode_paiements_id == 15">
                <PrimaryButton class="aside__cta" :disabled="form.processing">{{langCheckout.paiement_paypal}}</PrimaryButton>
            </div>
            <div v-else>
                <PrimaryButton class="aside__cta" :disabled="form.processing">{{langCheckout.passer_commande}}</PrimaryButton>
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

.aside__titre{
    font-size: 0.85rem ; 
    font-weight: bold ;  
    color: var(--couleur-principale);
    padding-top: 1.2rem;
    margin-bottom: 0.4rem;
}

.aside__cta {
    margin-top: 0.4rem;
}

.aside__recapitulatif {
    padding-bottom: 1.2rem;
}
.aside__titre-recapitulatif {
    margin-bottom: 0.4rem;
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

dl > dd {
    text-align: right;
}

.erreur {
    color: red;
    font-weight: bold;
}

a {
    color: var(--couleur-principale);
}

a:hover {
    text-decoration: underline;
}

input[type=radio] {
    margin-right: 0.2rem;
}

label {
    display: inline-block;
}

label::first-letter {
    text-transform: capitalize;
}
</style>
