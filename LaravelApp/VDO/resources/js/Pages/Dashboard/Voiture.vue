<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import chevronDroit from '/resources/assets/icones/material-chevron-right-white.svg';
import PrimaryButton from '@/Components/PrimaryButton.vue';

defineProps({
    voitures: Object,
    langVoiture: Object,
    langDashboard: Object
});
</script>

<template>

        <Head :title="langVoiture.head_titre"/>
        <div class="flex">
            <SidebarVue :lang="langDashboard"/>
            <div class="voitures__conteneur">
                <h1>{{langVoiture.titre.toUpperCase()}}</h1>
                <Link :href="route('voiture.create')">
                    <PrimaryButton>
                        {{langVoiture.ajout}}
                    </PrimaryButton>
                </Link>
                <div class="tableau__conteneur">
                    <table class="tableau">
                        <thead class="tableau__en-tete">
                            <th class="en-tete__cellule">ID</th>
                            <th class="en-tete__cellule">{{langVoiture.constructeur}}</th>
                            <th class="en-tete__cellule">{{langVoiture.modele}}</th>
                            <th class="en-tete__cellule">{{langVoiture.prix_paye}}</th>
                            <th class="en-tete__cellule">{{langVoiture.statut}}</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <tr class="tableau__rangee" v-for="voiture in voitures" :key="voiture.id">
                                <td class="tableau__cellule">{{voiture.id}}</td>
                                <td class="tableau__cellule">{{voiture.constructeur}}</td>
                                <td class="tableau__cellule">{{voiture.modele }}</td>
                                <td class="tableau__cellule">{{voiture.prix_paye ? `${voiture.prix_paye} $` : langVoiture.non_disponible}}</td>
                                <td class="tableau__cellule">{{$page.props.lang.locale == "en" ? voiture.statut_en : voiture.statut}}</td>
                                <td class="tableau__cellule"><img class="" :src="chevronDroit"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>    
        </div>
</template>
<style scoped>
h1 {
    font-size: 36px;
    font-family: var(--police-titre);
}
.voitures__conteneur {
    background-color: var(--couleur-secondaire);
    border-left: var(--couleur-blanc-opacite-50) solid 1px;
    color: var(--couleur-blanc);
    flex-grow: 1;
    font-family: var(--police-texte);
    padding: 3rem 2rem 0rem 2rem;
}

.tableau__conteneur {
    border: var(--couleur-blanc-opacite-50) solid 1px;
    border-radius: 0.375rem;
    margin-top: 2rem;
}
.tableau {
    white-space: nowrap;
    width: 100%;
}

.tableau__rangee, .tableau__en-tete {
    text-align: left;
}

.tableau__cellule, .en-tete__cellule {
    padding: 0.5rem;
}

.tableau__cellule {
    border-top: var(--couleur-blanc-opacite-30) solid 1px;
}
</style>