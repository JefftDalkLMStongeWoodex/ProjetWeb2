<script setup>
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';


defineProps({
    voiture: Object,
    langVoiture: Object,
    langDashboard: Object
})

</script>

<template>
    <Head :title="langVoiture.detail" />

    <TableauDeBordLayout>
        <template #header>
            <SidebarVue :lang="langDashboard"/>
        </template>
        <div class="wrapper detail ">
            <h1>{{langVoiture.titre_detail.toUpperCase()}}</h1>
            <dl>
                <table>
                    <thead>

    <div class="flex">
        <SidebarVue :lang="langDashboard" />
        <div class="wrapper">
            <h2 class="titre">{{ langVoiture.titre_detail.toUpperCase() }}</h2>
            <h4>{{ langVoiture.detail_technique }}</h4>
            <hr>
            <table class="fiche">
                <template v-if="$page.props.lang.locale == 'en'">
                    <tbody class="fiche__detail">
                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.modele }}</th>
                            <td class="fiche__detail__corps">{{ voiture.modele["nom"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.annee }}</th>
                            <td class="fiche__detail__corps">{{ voiture.annee }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.prix_paye }}</th>
                            <td class="fiche__detail__corps">{{ voiture.prix_paye }}$</td>

                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.date_arrivee }}</th>
                            <td class="fiche__detail__corps">{{ voiture.date_arrivee }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.kilometrage }}</th>
                            <td class="fiche__detail__corps">{{ voiture.kilometrage }}</td>

                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.corps }}</th>
                            <td class="fiche__detail__corps">{{ voiture.corps["type_en"] }}</td>
                        </tr>


         <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.transmission }}</th>
                            <td class="fiche__detail__corps">{{ voiture.transmission["type_en"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.groupe_motopropulseur }}</th>
                            <td class="fiche__detail__corps">{{ voiture.groupe_motopropulseur["type_en"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.carburant }}</th>
                            <td class="fiche__detail__corps"> {{ voiture.carburant["type_en"] }}</td>
                        </tr>


                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.etat }}</th>
                            <td class="fiche__detail__corps"> {{ voiture.etat["nom_en"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.statut }}</th>
                            <td class="fiche__detail__corps">{{ voiture.statut["nom_en"] }}</td>
                        </tr>
                    </tbody>
                </template>
                <template v-else-if="$page.props.lang.locale == 'fr'">
                    <tbody class="fiche__detail">
                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.modele }}</th>
                            <td class="fiche__detail__corps">{{ voiture.modele["nom"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.annee }}</th>
                            <td class="fiche__detail__corps">{{ voiture.annee }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.prix_paye }}</th>
                            <td class="fiche__detail__corps">{{ voiture.prix_paye }}$</td>

                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.date_arrivee }}</th>
                            <td class="fiche__detail__corps">{{ voiture.date_arrivee }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.kilometrage }}</th>
                            <td class="fiche__detail__corps">{{ voiture.kilometrage }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.corps }}</th>
                            <td class="fiche__detail__corps">{{ voiture.corps["type"] }}</td>
                        </tr>


                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.transmission }}</th>
                            <td class="fiche__detail__corps">{{ voiture.transmission["type"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.groupe_motopropulseur }}</th>
                            <td class="fiche__detail__corps">{{ voiture.groupe_motopropulseur["type"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.carburant }}</th>
                            <td class="fiche__detail__corps">{{ voiture.carburant["type"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.etat }}</th>
                            <td class="fiche__detail__corps"> {{ voiture.etat["nom"] }}</td>
                        </tr>

                        <tr>
                            <th class="fiche__detail__entete">{{ langVoiture.statut }}</th>
                            <td class="fiche__detail__corps">{{ voiture.statut["nom"] }}</td>
                        </tr>
                    </tbody>
                </template>
            </table>
            <template v-if="$page.props.lang.locale == 'en'">
                <h5>{{ langVoiture.description_en }}</h5>
                <template v-if="(voiture.statut['id'] == 2 && voiture.utilisateur !== null)">
                    {{ langVoiture.utilisateur_reservation }}:
                    {{ voiture.utilisateur.email }}
                    <p class="">{{ voiture.description_en }} </p>
                </template>
            </template>

            <template v-else-if="$page.props.lang.locale == 'fr'">
                <h5>{{ langVoiture.description }}</h5>
                <template v-if="(voiture.statut['id'] == 2 && voiture.utilisateur !== null)">
                    {{ langVoiture.utilisateur_reservation }}:
                    {{ voiture.utilisateur.email }}
                    <p class="">{{ voiture.description }}</p>
                </template>
            </template>

            <div class="lien-images">
                <Link :href="route('image.index', voiture.id)">
                {{ langVoiture.detail_image }}
                </Link>
            </div>
            <div class="lien-actions">
                <Link :href="route('voiture.edit', voiture)">
                <SecondaryButton>{{langVoiture.modifier}}</SecondaryButton>
                </Link>

                <Link>
                <DangerButton>{{langVoiture.supprimer}}</DangerButton>
                </Link>
            </div>
        </div>
    </TableauDeBordLayout>
</template>
<style scoped>
.fiche {
    width: 100%;
    margin: 20px auto;
    table-layout: fixed;
}

.fiche__detail__entete,
.fiche__detail__corps {
    padding: 8px;
    border: solid 1px #e7e7e7;
    text-align: center;
}

.fiche,
.fiche__detail__entete,
.fiche__detail__corps {
    border-collapse: collapse;
}

.fiche__detail__entete {
    background-color: #f3f3f3;
    font-weight: 400;
}

.titre {
    font-family: var(--police-titre);
    padding: 1rem 0;
}

.lien-actions {
    display: flex;
    gap: 15px;
}

.lien-images {
    margin-bottom: 5px;
}

.lien-images:hover {
    color: var(--couleur-principale);
    transition: all 0.3s ease;
}

p {
    color: var(--couleur-secondaire);
}

@media screen and (max-width: 742px) {
    .titre {
        font-family: var(--police-titre);
        padding: 1rem 0;
        font-size: 2.369rem;
    }
    h4 {
        font-size: 1.3rem;
    }
	
}
.detail{

    margin-bottom: 2rem;

}

</style>