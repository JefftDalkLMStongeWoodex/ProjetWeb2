<script setup>
import { Head, usePage } from '@inertiajs/inertia-vue3'
import AppLayout from '@/Layouts/AppLayout.vue'
import ListePanier from '@/Components/Checkout/ListePanier.vue'
import InfoCommande from '@/Components/Checkout/InfoCommande.vue'
import { computed } from 'vue'


const props = defineProps({
    panier: Object,
    taxes: Object,
    provinces: Object,
    langAppLayout: Object,
    langCheckout: Object,
    user_ville: Object,
    user_province: Object,
    user_taxes: Object,
    modePaiement: Object,
    modeExpedition: Object,
    erreurs: Array
})

let commande = props.panier;

const user = computed(() => usePage().props.value.auth.user)

</script>
<template>
    <AppLayout :lang="langAppLayout">
        <body>
            <Head title="Checkout" />
            <section class="wrapper__checkout">
                <h1>Passer à la caisse</h1>
                <template v-if="$page.props.flash.erreurs_checkout">
                    <p class="erreur" v-for="erreur in $page.props.flash.erreurs_checkout">
                        {{erreur}}
                    </p>
                </template>
                <div class="grid">
                    <div class="grid_item grid_item1"> 
                        <section>
                            <h5>Information client</h5>
                            <strong>Vérifiez les informations. S'il y a des erreurs, veuillez les corriger dans le tableau de bord avant de passer votre commande.</strong>
                            <dl class="information-utilisateur">
                                <dt>Nom</dt>
                                <dd>{{user.name}}</dd>
                                <dt>Prénom</dt>
                                <dd>{{user.first_name}}</dd>
                                <dt>Courriel</dt>
                                <dd>{{user.email}}</dd>
                                <dt>Adresse</dt>
                                <dd>{{user.adresse}}</dd>
                                <template v-if="$page.props.lang.locale == 'fr'">
                                    <dt>Ville</dt>
                                    <dd>{{user_ville.nom}}</dd>
                                    <dt>Province</dt>
                                    <dd>{{user_province.nom}}</dd>
                                </template>
                                <template v-else>
                                    <dt>Ville</dt>
                                    <dd>{{user_ville.nom_en}}</dd>
                                    <dt>Province</dt>
                                    <dd>{{user_province.nom_en}}</dd>
                                </template>
                                <dt>Code postal</dt>
                                <dd>{{user.code_postal}}</dd>
                                <dt>Téléphone (maison)</dt>
                                <dd>{{user.telephone}}</dd>
                                <dt>Téléphone (cellulaire)</dt>
                                <dd>{{user.telephone_portable}}</dd>
                            </dl>
                        </section>
                        <section>
                            <h5>Revoir les voitures</h5>
                            <table class="recapitulatif">
                                <thead>
                                    <th>Image</th>
                                    <th>ID</th>
                                    <th>Constructeur</th>
                                    <th>Modèle</th>
                                    <th>Année</th>
                                    <th>Kilométrage</th>
                                    <th>Prix</th>
                                </thead>
                                <tbody>
                                    <tr v-for="voiture in panier">
                                        <td class="recapitulatif__conteneur-img">
                                            <template v-if="voiture.images != null">
                                                <img :src="`/storage/${voiture.imagePrincipale[0].chemin}`" :alt="(voiture.alt || voiture.alt_en)">
                                            </template>
                                            <img v-else src="../../assets/kiaForte2015.jpg" class="vehicule-img" />
                                        </td>
                                        <td>{{voiture.id}}</td>
                                        <td>{{voiture.modele.constructeur.nom}}</td>
                                        <td>{{voiture.modele.nom}}</td>
                                        <td>{{voiture.annee}}</td>
                                        <td>{{voiture.kilometrage}}</td>
                                        <td>{{voiture.prix}}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </section>
                    </div>
                    <div class="grid_item grid_item2">   
                        <InfoCommande
                            :panier = "panier"
                            :taxes = "user_taxes"
                            :modePaiement = "modePaiement"
                            :modeExpedition = "modeExpedition"
                            :langCheckout = "langCheckout"
                        />
                    </div>
                </div>
            </section>
        </body>
    </AppLayout>
</template>
<style scoped>
body {
    background-color: var(--couleur-secondaire-leger);
    color: var(--couleur-blanc);
}

body h1 {
text-align: center;
padding: 1rem;
color: var(--couleur-principale);    
}

.wrapper__checkout {
    margin: 0rem 2rem;
}

.grid {
    display: grid;
    grid-template-columns: repeat(12, [col] 1fr);
    grid-auto-rows: minmax(50px, auto);
    column-gap: 1em;
    row-gap: 10px;
}

.grid_item {
   /* background-color: #eee; */
    background-color:  var(--couleur-secondaire);
    /* text-transform: uppercase; */
    padding: 1em;
    font-size: 15px;
}

.grid_item1  {
    grid-column: col 1/ span 8;
    width: 100%;
}

.grid_item2 {
    grid-column: col 9 / span 4;
}

@media screen and (max-width: 1025px){
    .grid_item1, .grid_item2 {
        grid-column: col / span 12;
    }
}

@media screen  and (max-width: 600px){
    .grid_item1, .grid_item2 {
        grid-column: col / span 12;
    }
}

.information-utilisateur {
    display: flex;
    width: 100%;
    flex-wrap: wrap;
    padding-top: 1rem;
}

.information-utilisateur > dt,
.information-utilisateur > dd {
    width: 50%;
}

.information-utilisateur > dt {
    font-weight: bold;
}

.recapitulatif {
    border: unset;
    border-collapse: unset;
    border: var(--couleur-blanc-opacite-50) solid 1px;
    border-radius: 0.375rem;
    text-align: left;
}
.recapitulatif th,
.recapitulatif td {
    padding: 0.5rem;
}

.recapitulatif__conteneur-img {
    width: 20%;
}

.erreur {
    color: red;
    font-weight: bold;
}
</style>