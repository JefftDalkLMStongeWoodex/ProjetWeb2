<script setup>
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';

defineProps({
    voiture: Object,
    langVoiture: Object,
    langDashboard: Object
})

</script>

<template>
    <Head :title="langVoiture.ajout" />
    <div class="flex">
        <SidebarVue :lang="langDashboard "/>
        <div>
            <h1>{{langVoiture.titre_detail.toUpperCase()}}</h1>
            <dl>
                <dd>{{langVoiture.modele}}</dd>
                    <dt>{{voiture.modele["nom"]}}</dt>
                <dd>{{langVoiture.annee}}</dd>
                    <dt>{{voiture.annee}}</dt>
                <dd>{{langVoiture.prix_paye}}</dd>
                    <dt>{{voiture.prix_paye}}$</dt>
                <dd>{{langVoiture.date_arrivee}}</dd>
                    <dt>{{voiture.date_arrivee}}</dt>
                <dd>{{langVoiture.kilometrage}}</dd>
                    <dt>{{voiture.kilometrage}}</dt>
                <template v-if="$page.props.lang.locale == 'en'">
                    <dd>{{langVoiture.corps}}</dd>
                        <dt>{{voiture.corps["type_en"]}}</dt>
                    <dd>{{langVoiture.transmission}}</dd>
                        <dt>{{voiture.transmission["type_en"]}}</dt>
                    <dd>{{langVoiture.groupe_motopropulseur}}</dd>
                        <dt>{{voiture.groupe_motopropulseur["type_en"]}}</dt>
                    <dd>{{langVoiture.carburant}}</dd>
                        <dt>{{voiture.carburant["type_en"]}}</dt>
                    <dd>{{langVoiture.etat}}</dd>
                        <dt>{{voiture.etat["nom_en"]}}</dt>
                    <dd>{{langVoiture.statut}}</dd>
                        <dt>{{voiture.statut["nom_en"]}}</dt>
                </template>
                <template v-else>
                    <dd>{{langVoiture.corps}}</dd>
                        <dt>{{voiture.corps["type"]}}</dt>
                    <dd>{{langVoiture.transmission}}</dd>
                        <dt>{{voiture.transmission["type"]}}</dt>
                    <dd>{{langVoiture.groupe_motopropulseur}}</dd>
                        <dt>{{voiture.groupe_motopropulseur["type"]}}</dt>
                    <dd>{{langVoiture.carburant}}</dd>
                        <dt>{{voiture.carburant["type"]}}</dt>
                    <dd>{{langVoiture.etat}}</dd>
                        <dt>{{voiture.etat["nom"]}}</dt>
                    <dd>{{langVoiture.statut}}</dd>
                        <dt>{{voiture.statut["nom"]}}</dt>
                </template>        
                <dd v-if="(voiture.utilisateur !== null)">{{langVoiture.utilisateur_reservation}}</dd>
                    <dd>{{voiture.utilisateur.email}}</dd>
                <dd>{{langVoiture.description}}</dd>
                    <dt>{{voiture.description}}</dt>
                <dd>{{langVoiture.description_en}}</dd>
                    <dt>{{voiture.description_en}}</dt>
            </dl>
            <Link :href="route('voiture.edit', voiture)">
                <SecondaryButton>Modifier</SecondaryButton>
            </Link>
            <Link>
                <DangerButton>Supprimer</DangerButton>
            </Link>
        </div>
    </div>
</template>
<style scoped>
.titre {
    font-family: var(--police-titre);
    color: var(--couleur-principale);
    padding: 1rem 0 ;
}

p {
    color:  var(--couleur-blanc);
    
}
p a{
    color:  var(--couleur-principale);
    
}
</style>