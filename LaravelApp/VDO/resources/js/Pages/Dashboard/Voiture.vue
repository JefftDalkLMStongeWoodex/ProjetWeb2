<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import Tableau from '@/Components/Tableau.vue';
import chevronDroit from '/resources/assets/icones/material-chevron-right-white.svg';

import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';


const props = defineProps({
    voitures: Object,
    langVoiture: Object,
    langDashboard: Object
});

const tableau_th = [
    'ID',
    props.langVoiture.constructeur,
    props.langVoiture.modele,
    props.langVoiture.prix_paye,
    props.langVoiture.statut
]
</script>

<template>

        <Head :title="langVoiture.head_titre"/>

        <TableauDeBordLayout>
            <template #header>
                <SidebarVue :lang="langDashboard"/>
            </template>

            <div class="voitures__conteneur">
                <h2 class="titre">{{langVoiture.titre}}</h2>
                <Link :href="route('voiture.create')">
                    <PrimaryButton>
                        {{langVoiture.ajout}}
                    </PrimaryButton>
                </Link>
                <Tableau 
                    :tableau = voitures
                    :tableau_th = tableau_th
                    :route_detail = true
                    route_nom = "voiture.show"
                />
            </div>    
    </TableauDeBordLayout>
</template>
<style scoped>
body {
    background-color: var(--couleur-secondaire);
}

.titre {
    font-family: var(--police-titre);
    text-transform: uppercase;
}
.voitures__conteneur {
    background-color: var(--couleur-secondaire);
    color: var(--couleur-blanc);
    flex-grow: 1;
    font-family: var(--police-texte);
    padding: 3rem 2rem 0rem 2rem;
    padding-bottom: 6rem;
}

@media only screen and (min-width: 900px) {
    .voitures__conteneur {
        border-left: var(--couleur-blanc-opacite-50) solid 1px;
    }
}
</style>