<script setup>
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import { onMounted } from 'vue'

defineProps({
    voiture: Object,
    langVoiture: Object,
    langDashboard: Object,
    erreurPrivilege: String
})

onMounted(() => {
    const modal = document.querySelector('.modal-suppression')
    const boutonOuvrirModal = document.querySelector('.ouvrir-modal')
    const boutonFermerModal = document.querySelector('.fermer-modal')
    boutonOuvrirModal.addEventListener('click', () => {
        modal.showModal()
    })

    boutonFermerModal.addEventListener('click', () => {
        modal.close()
    })
})

const form = useForm();

const supprimerVoiture = function (voiture) {
    const modal = document.querySelector('.modal-suppression')
    modal.close();
    form.delete(route('voiture.destroy', voiture));
};
</script>
<template>
    <Head :title="langVoiture.detail" />
    <TableauDeBordLayout>
        <template #header>
            <SidebarVue :lang="langDashboard"/>
        </template>
        <div class="flex">    
            <div class="wrapper detail">
                <h4 class="titre">{{ langVoiture.titre_detail.toUpperCase() }}</h4>
                <p class="error">{{erreurPrivilege}}</p>
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
                    <template v-else="$page.props.lang.locale == 'fr'">
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
                    <template v-else>
                        <p class="">{{langVoiture.description_aucun }}</p>
                    </template>
                </template>

                <template v-else="$page.props.lang.locale == 'fr'">
                    <h5>{{ langVoiture.description }}</h5>
                    <template v-if="(voiture.statut['id'] == 2 && voiture.utilisateur !== null)">
                        {{ langVoiture.utilisateur_reservation }}:
                        {{ voiture.utilisateur.email }}
                        <p class="">{{ voiture.description }}</p>
                    </template>
                    <template v-else>
                        <p class="">{{langVoiture.description_aucun }}</p>
                    </template>
                </template>
                <div class="lien-images">
                    <Link :href="route('image.index', voiture.id)">
                    {{ langVoiture.detail_image }}
                    </Link>
                    <span>
                        <i class="fa-solid fa-arrow-right fa-fade"></i>
                    </span>
                </div>
                <div class="lien-actions">
                    <Link :href="route('voiture.edit', voiture)">
                    <SecondaryButton>{{langVoiture.modifier}}</SecondaryButton>
                    </Link>
                    <DangerButton class="ouvrir-modal">{{langVoiture.supprimer}}</DangerButton>
                </div>
                <dialog class="modal-suppression" id="modal-suppression">
                    <h2>Veuillez confirmer la suppression</h2>
                    <p>Les changements effectués seront irréversibles. Voulez-vous poursuivre?</p>
                    <footer>
                        <form @submit.prevent="supprimerVoiture(voiture)" method="post">
                            <SecondaryButton class="fermer-modal">Annuler</SecondaryButton>
                            <DangerButton>Supprimer</DangerButton>
                        </form>
                    </footer>
                </dialog>
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
    gap: 0.8rem;
}

.lien-images {
    display: flex;
    align-items: center;
    justify-content:flex-end;
    gap: 5px;
}

.lien-images:hover{
    color: var(--couleur-principale);
    transition: all 0.3s ease;
}

p {
    color: var(--couleur-secondaire);
}

.modal-suppression {
    border-radius: 8px;
}

.modal-suppression footer {
    display: flex;
    gap: 0.8rem;
    justify-content: flex-start;
}

.error {
    color: red;
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