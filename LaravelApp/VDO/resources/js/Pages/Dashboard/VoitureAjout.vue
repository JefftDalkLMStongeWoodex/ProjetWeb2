<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/inertia-vue3';
import Select from '@/Components/Select.vue';
import SidebarVue from '@/Components/Sidebar.vue';

defineProps({
    modeles: Object,
    corps: Object,
    transmissions: Object,
    groupeMotopropulseurs: Object,
    carburants: Object,
    etats: Object,
    statuts: Object,
    users: Object,
    langVoiture: Object,
    langDashboard: Object
})

const form = useForm({
    modeles_id: '',
    annee: '',
    prix_paye: '',
    date_arrivee: '',
    kilometrage: '',
    corps_id: '',
    transmissions_id: '',
    groupe_motopropulseurs_id: '',
    carburants_id: '',
    etats_id: '',
    statut_voitures_id: '',
    reservation_users_id: '',
    description: '',
    description_en: '',
});

const submit = () => {
    form.post(route('voiture.store'), { preserveState: true });
};
</script>

<template>
    <Head :title="langVoiture.ajout" />
    <div class="flex">
        <SidebarVue :lang="langDashboard "/>
        <div class="wrapper">
            <h2 class="titre">{{langVoiture.ajout}}</h2>
            <form @submit.prevent="submit">
                <section class="champs">
                    <div class="champs__option ">
                    <InputLabel
                        for="modeles_id" 
                        class="label"
                        :value="langVoiture.modele" />
                    <Select 
                        :options="modeles" 
                        colonneAffichee="nom"
                        id="modeles_id"
                        v-model="form.modeles_id"
                        required
                    />
                    <InputError :message="form.errors.modeles_id" />
                </div>
                <div class="champs__option ">
                    <InputLabel 
                    class="label"
                    for="annee" 
                    :value="langVoiture.annee" />
                    <TextInput 
                        id="annee"
                        type="number"
                        min="1900"
                        :max="new Date().getFullYear()"
                        step="1"
                        v-model="form.annee"
                        autocomplate="annee"
                    />
                    <InputError :message="form.errors.annee" />
                </div>
                <div class="champs__option ">
                    <InputLabel 
                    class="label"
                    for="prix_paye" 
                    :value="langVoiture.prix_paye" />
                    <TextInput 
                        id="prix_paye"
                        type="number"
                        step="0.01"
                        min="0"
                        v-model="form.prix_paye"
                        autocomplate="prix_paye"
                    />
                    <InputError :message="form.errors.prix_paye" />
                </div>
                <div class="champs__option ">
                    <InputLabel
                    class="label"
                    for="date_arrivee" :value="langVoiture.date_arrivee" />
                    <TextInput 
                        id="date_arrivee"
                        type="date"
                        v-model="form.date_arrivee"
                        autocomplate="date_arrivee"
                    />
                    <InputError :message="form.errors.date_arrivee" />
                </div>
                <div class="champs__option ">
                    <InputLabel  class="label" for="kilometrage" :value="langVoiture.kilometrage" />
                    <TextInput 
                        id="kilometrage"
                        type="number"
                        step="1"
                        min="0"
                        v-model="form.kilometrage"
                        autocomplate="kilometrage"
                    />
                    <InputError :message="form.errors.kilometrage" />
                </div>
                <div class="champs__option ">
                    <InputLabel class="label" for="corps_id" :value="langVoiture.corps" />
                    <Select 
                        :options ="corps" 
                        colonneAffichee = "type"
                        id="corps_id"
                        v-model="form.corps_id"
                        required
                    />
                    <InputError :message="form.errors.corps_id" />
                </div>
                <div class="champs__option ">
                    <InputLabel  class="label"
                    for="transmissions_id" :value="langVoiture.transmission" />
                    <Select 
                        :options ="transmissions" 
                        colonneAffichee = "type"
                        id="transmissions_id"
                        v-model="form.transmissions_id"
                        required
                    />
                    <InputError :message="form.errors.transmissions_id" />
                </div>
                <div class="champs__option ">
                    <InputLabel class="label"
                    for="groupe_motopropulseurs_id" :value="langVoiture.groupe_motopropulseur" />
                    <Select 
                        :options ="groupeMotopropulseurs" 
                        colonneAffichee = "type"
                        id="groupe_motopropulseurs_id"
                        v-model="form.groupe_motopropulseurs_id"
                        required
                    />
                    <InputError :message="form.errors.groupe_motopropulseurs_id" />
                </div>
                <div class="champs__option ">
                    <InputLabel class="label" for="carburants_id" :value="langVoiture.carburant" />
                    <Select 
                        :options ="carburants" 
                        colonneAffichee = "type"
                        id="carburants_id"
                        v-model="form.carburants_id"
                        required
                    />
                    <InputError :message="form.errors.carburants_id" />
                </div>
                <div class="champs__option ">
                    <InputLabel class="label" for="etats_id" :value="langVoiture.etat" />
                    <Select 
                        :options ="etats" 
                        colonneAffichee = "nom"
                        id="etats_id"
                        v-model="form.etats_id"
                        required
                    />
                    <InputError :message="form.errors.etats_id" />
                </div>
                <div class="champs__option ">
                    <InputLabel class="label" for="statut_voitures_id" :value="langVoiture.statut" />
                    <Select 
                        :options ="statuts" 
                        colonneAffichee = "nom"
                        id="statut_voitures_id"
                        v-model="form.statut_voitures_id"
                        required
                    />
                    <InputError :message="form.errors.statut_voitures_id" />
                </div>
                <div v-if="form.statut_voitures_id == 2">
                    <InputLabel class="label"
                    for="reservation_users_id" :value="langVoiture.utilisateur_reservation" />
                    <Select 
                        :options ="users" 
                        colonneAffichee = "email"
                        id="reservation_users_id"
                        v-model="form.reservation_users_id"
                    />
                    <InputError :message="form.errors.reservation_users_id" />
                </div>
                <div class="champs__descriptif">
                    <InputLabel class="label" for="description" :value="langVoiture.description" />
                    <textarea 
                        id="description" 
                        name="description" 
                        cols="50"
                        :placeholder="langVoiture.description_placeholder"
                        v-model="form.description" 
                    />
                    <InputError :message="form.errors.description" />
                </div>
                <div class="champs__descriptif">
                    <InputLabel class="label" for="description_en" :value="langVoiture.description_en" />
                    <textarea 
                        id="description_en" 
                        name="description_en" 
                        cols="50"
                        :placeholder="langVoiture.description_placeholder"
                        v-model="form.description_en" 
                    />
                    <InputError :message="form.errors.description_en" />
                </div>
                <div class="champs__Soumettre">
                    <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                        {{langVoiture.soumettre}}
                    </PrimaryButton>
                </div>
                </section>
                
            </form>
        </div>
    </div>
</template>
<style scoped>
@media screen and (min-width: 700px) {
	.champs {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
	}
	
	.champs__option {
		width: 45%;
	}

}

input, select {
    width: 100%;
    margin-bottom: 10px;
    border-radius: 8px;
}

.champs__descriptif {
	width: 100%;
}

textarea {
    width:100%; 
    height: 150px;
    border-radius: 8px;
    margin-bottom: 10px;
}

.champs__Soumettre {
   width: 100%;
   
}
/* .titre-contenu {
    text-align: center;
    text-transform: uppercase;
} */

.titre {
    font-family: var(--police-titre);
    text-transform: uppercase;
    color: var(--couleur-secondaire);
    padding: 1rem 0 ;
}


p {
    color:  var(--couleur-blanc);
    
}
p a{
    color:  var(--couleur-principale);
    
}
</style>