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
    lang: Object
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
            },
            total () {
                let total = 0
                for (let voiture of this.panier) {
                    total += voiture.prix_paye * 1.25
                }
                return total
            }
        }
    }
</script>
<template>
<div class="panier_achat">
    <header>
        <h4>{{lang.panier_titre}}</h4>
        <div class="fermerPanier" @click="afficherPanier">
            <svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" viewBox="0 0 21 21" fill="white">
                <path id="Icon_material-close" data-name="Icon material-close" d="M28.5,9.615,26.385,7.5,18,15.885,9.615,7.5,7.5,9.615,15.885,18,7.5,26.385,9.615,28.5,18,20.115,26.385,28.5,28.5,26.385,20.115,18Z" transform="translate(-7.5 -7.5)"/>
            </svg>
        </div>
    </header>
    <div>
        <template v-if="panier == null">
            <p>{{lang.panier_vide}}</p>
        </template>
        <template v-else>
            <table>
                <thead>
                    <th>{{lang.constructeur}}</th>
                    <th>{{lang.modele}}</th>
                    <th>{{lang.annee}}</th>
                    <th>{{lang.prix}}</th>
                    <th></th>
                </thead>
                <tbody>
                    <tr v-for="(voiture) in panier">
                        <td>{{voiture.modele.constructeur.nom}}</td>
                        <td>{{voiture.modele.nom}}</td>
                        <td>{{voiture.annee}}</td>
                        <td>{{prix(voiture.prix_paye)}}$</td>
                        <td @click="enleverDuPanier(voiture.id)">
                            <svg xmlns="http://www.w3.org/2000/svg" width="34.095" height="34.095" viewBox="0 0 34.095 34.095">
                                <path id="Icon_material-remove-shopping-cart" data-name="Icon material-remove-shopping-cart" d="M34.1,34.1,4.155,4.155,3,3,1.9,1.9,0,3.81,6.585,10.4,9.9,17.385,7.875,21.06A2.9,2.9,0,0,0,7.5,22.5a3.009,3.009,0,0,0,3,3H21.69l2.07,2.07a2.991,2.991,0,1,0,4.17,4.17L32.19,36l1.9-1.9ZM11.13,22.5a.371.371,0,0,1-.375-.375l.045-.18L12.15,19.5h3.54l3,3Zm12.2-3a2.986,2.986,0,0,0,2.625-1.545L31.32,8.22a1.465,1.465,0,0,0,.18-.72A1.5,1.5,0,0,0,30,6H9.81ZM10.5,27a3,3,0,1,0,3,3A3,3,0,0,0,10.5,27Z" transform="translate(0 -1.905)" fill="#fff"/>
                            </svg>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <th>Total</th>
                    <td></td>
                    <td></td>
                    <td>{{total()}}$</td>
                </tfoot>
            </table>
            <SecondaryButton>
                <Link href="/panier/achat/" method="get" :data="panier" as="button">{{lang.checkout}}</Link>
            </SecondaryButton>
        </template>
    </div>

</div>

</template>
<style scoped>
.panier_achat{
    background-color: var(--couleur-secondaire);
    color: var(--couleur-blanc);
    width: 100%;
    position: fixed;
    top: 0;
    right: 0;
    height: 100vh;
    padding-left: 1rem;
    padding-right: 1rem;
    z-index: 1;
}

@media screen and (min-width: 900px) {
    .panier_achat {
        width: 40%;
        border-left: 1px solid var(--couleur-blanc-opacite-30);
    }
    

}

.panier_achat header {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
}

svg {
    width: 1.2rem;
}

table {
    text-align: left;
    margin-top: 1rem;
    margin-bottom: 1rem;
}

table td, table th {
    padding-right: 0.4rem;
}


</style>