<script setup>
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import Tableau from '@/Components/Tableau.vue';
import SidebarVue from '@/Components/Sidebar.vue';
import { Head, Link } from '@inertiajs/inertia-vue3';
import PrimaryButton from '@/Components/PrimaryButton.vue';

const props = defineProps({
    langImage: Object,
    langDashboard: Object,
    images: Object,
    idVoiture: String
})

const tableau_th = [
    'ID',
    props.langImage.nom,
    props.langImage.chemin,
    props.langImage.alt,
    props.langImage.principale,
    props.langImage.idVoiture
]
</script>
<template>
    <Head :title="langImage.titre" />
    <TableauDeBordLayout>
        <template #header>
            <SidebarVue :lang="langDashboard" />
        </template>
        <div class="images__conteneur">
            <h1>{{langImage.titre}}</h1>
            <Link :href="route('image.create', idVoiture)">
                <PrimaryButton>
                    {{langImage.ajout}}
                </PrimaryButton>
            </Link>
            <Tableau
                :tableau = images
                :tableau_th = tableau_th
                colonne_image = true
            />
        </div>
    </TableauDeBordLayout>
</template>
<style scoped>
body {
    background-color: var(--couleur-secondaire);
}

.images__conteneur {
    background-color: var(--couleur-secondaire);
    border-left: var(--couleur-blanc-opacite-50) solid 1px;
    color: var(--couleur-blanc);
    flex-grow: 1;
    font-family: var(--police-texte);
    padding: 3rem 2rem 0rem 2rem;
    width: 100%;
}

@media only screen and (min-width: 900px) {
    .images__conteneur {
        border-left: var(--couleur-blanc-opacite-50) solid 1px;
    }
}
</style>