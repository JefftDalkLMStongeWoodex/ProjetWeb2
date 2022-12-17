<script setup>
import { ref, computed } from 'vue'
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import imgVoiture1 from '/resources/assets/kiaForte2015.jpg';
import taxes from '@/Components/Taxes.vue';

defineProps({
    voiture: Object,
    langVoiture: Object,
    langDashboard: Object,
    afficherPanier: Function,
})
</script>
<script>
    export default {
        data () {
            return {
                panier: JSON.parse(sessionStorage.getItem("panier"))
            }
        },
        methods: {
            prix (prix_paye) {
                return prix_paye * 1.25
            },
            enleverDuPanier (voitureId) {
                let panierId = this.panier.findIndex(element => element.id == voitureId)
                this.panier.splice(panierId, 1)
                sessionStorage.setItem("panier", JSON.stringify(this.panier))
            }
        }
    }
</script>
<template>
<div class="panier_achat">
    <h4>Panier d'achat</h4>
    <div>
        <div class="fermerPanier" @click="afficherPanier">
            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="white">
                <path id="Icon_material-close" data-name="Icon material-close" d="M28.5,9.615,26.385,7.5,18,15.885,9.615,7.5,7.5,9.615,15.885,18,7.5,26.385,9.615,28.5,18,20.115,26.385,28.5,28.5,26.385,20.115,18Z" transform="translate(-7.5 -7.5)"/>
            </svg>
        </div>
        <table>
            <thead>
                <th>Constructeur</th>
                <th>Modèle</th>
                <th>Année</th>
                <th>Prix</th>
                <th></th>
            </thead>
            <tbody>
                <tr v-for="(voiture) in panier">
                    <td>{{voiture.modele.constructeur.nom}}</td>
                    <td>{{voiture.modele.nom}}</td>
                    <td>{{voiture.annee}}</td>
                    <td>{{prix(voiture.prix_paye)}}</td>
                    <td @click="enleverDuPanier(voiture.id)">poubelle</td>
                </tr>
            </tbody>
        </table>
    </div>

</div>

</template>
<style scoped>

.panier_achat{
    background-color: var(--couleur-secondaire);
    border: 1px solid red;
    color: var(--couleur-blanc);
    width: 40vh;
    position: fixed;
    top: 0;
    right: 0;
    height: 100vh;
}
</style>