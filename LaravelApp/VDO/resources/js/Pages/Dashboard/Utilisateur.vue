<script setup>
import { Head, Link } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import Tableau from '@/Components/Tableau.vue';
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';

const props = defineProps({
    utilisateurs: Object,
    langUtilisateur: Object,
    langDashboard: Object
});

const tableau_th = [
    'ID',
    props.langUtilisateur.nom,
    props.langUtilisateur.prenom,
    props.langUtilisateur.email,
    props.langUtilisateur.telephone,
    props.langUtilisateur.telephone_portable,
    props.langUtilisateur.privilege,
]
</script>

<template>
        <Head :title="langUtilisateur.titre"/>
        <TableauDeBordLayout>
            <template #header>
                <SidebarVue :lang="langDashboard"/>
            </template>
            <div class="utilisateurs__conteneur">
                <h2 class="titre">{{langUtilisateur.titre}}</h2>
                <Tableau 
                    :tableau = utilisateurs
                    :tableau_th = tableau_th
                    :route_detail = true
                    route_nom = "utilisateur.show"
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
.utilisateurs__conteneur {
    background-color: var(--couleur-secondaire);
    color: var(--couleur-blanc);
    flex-grow: 1;
    font-family: var(--police-texte);
    padding: 3rem 2rem 0rem 2rem;
}

@media only screen and (min-width: 900px) {
    .utilisateurs__conteneur {
        border-left: var(--couleur-blanc-opacite-50) solid 1px;
    }
}
</style>