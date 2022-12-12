<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/inertia-vue3';
import Select from '@/Components/Select.vue';
import SidebarVue from '@/Components/Sidebar.vue';
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';


const props = defineProps({
    voiture: Object,
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
    modeles_id: props.voiture.modeles_id,
    annee: props.voiture.annee,
    prix_paye: props.voiture.prix_paye,
    date_arrivee: props.voiture.date_arrivee,
    kilometrage: props.voiture.kilometrage,
    corps_id: props.voiture.corps_id,
    transmissions_id: props.voiture.transmissions_id,
    groupe_motopropulseurs_id: props.voiture.groupe_motopropulseurs_id,
    carburants_id: props.voiture.carburants_id,
    etats_id: props.voiture.etats_id,
    statut_voitures_id: props.voiture.statut_voitures_id,
    reservation_users_id: props.voiture.reservation_users_id,
    description: props.voiture.description,
    description_en: props.voiture.description_en,
});

const update = () => {
    form.put(route('voiture.update', props.voiture), { preserveState: true });
};
</script>

<template>
    <Head :title="langVoiture.modifier_titre" />


    <TableauDeBordLayout>
        <template #header>
            <SidebarVue :lang="langDashboard"/>
        </template>
        <div class="wrapper voiture_modifier">
            <h1>{{langVoiture.modifier_titre}}</h1>
  
        <SidebarVue :lang="langDashboard "/>
        <div class="wrapper">
            <h2 class="titre">{{langVoiture.modifier_titre}}</h2>

            <form @submit.prevent="update">
                <section class="champs">
                    <div class="champs__option">
                    <InputLabel for="modeles_id" :value="langVoiture.modele" />
                    <Select 
                        :options="modeles" 
                        :optionSelectionnee="form.modeles_id"
                        colonneAffichee="nom"
                        id="modeles_id"
                        v-model="form.modeles_id"
                        required
                    />
                    <InputError :message="form.errors.modeles_id" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="annee" :value="langVoiture.annee" />
                        <TextInput 
                            id="annee"
                            type="number"
                            min="1900"
                            :max="new Date().getFullYear()"
                            step="1"
                            v-model="form.annee"
                            autocomplete="annee"
                        />
                        <InputError :message="form.errors.annee" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="prix_paye" :value="langVoiture.prix_paye" />
                        <TextInput 
                            id="prix_paye"
                            type="number"
                            step="0.01"
                            min="0"
                            v-model="form.prix_paye"
                            autocomplete="prix_paye"
                        />
                        <InputError :message="form.errors.prix_paye" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="date_arrivee" :value="langVoiture.date_arrivee" />
                        <TextInput 
                            id="date_arrivee"
                            type="date"
                            v-model="form.date_arrivee"
                            autocomplete="date_arrivee"
                        />
                        <InputError :message="form.errors.date_arrivee" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="kilometrage" :value="langVoiture.kilometrage" />
                        <TextInput 
                            id="kilometrage"
                            type="number"
                            step="1"
                            min="0"
                            v-model="form.kilometrage"
                            autocomplete="kilometrage"
                        />
                        <InputError :message="form.errors.kilometrage" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="corps_id" :value="langVoiture.corps" />
                        <Select 
                            :options="corps" 
                            :optionSelectionnee="form.corps_id"
                            colonneAffichee = "type"
                            id="corps_id"
                            v-model="form.corps_id"
                            required
                        />
                        <InputError :message="form.errors.corps_id" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="transmissions_id" :value="langVoiture.transmission" />
                        <Select 
                            :options ="transmissions" 
                            :optionSelectionnee="form.transmissions_id"
                            colonneAffichee = "type"
                            id="transmissions_id"
                            v-model="form.transmissions_id"
                            required
                        />
                        <InputError :message="form.errors.transmissions_id" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="groupe_motopropulseurs_id" :value="langVoiture.groupe_motopropulseur" />
                        <Select 
                            :options ="groupeMotopropulseurs" 
                            :optionSelectionnee="form.groupe_motopropulseurs_id"
                            colonneAffichee = "type"
                            id="groupe_motopropulseurs_id"
                            v-model="form.groupe_motopropulseurs_id"
                            required
                        />
                        <InputError :message="form.errors.groupe_motopropulseurs_id" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="carburants_id" :value="langVoiture.carburant" />
                        <Select 
                            :options ="carburants" 
                            :optionSelectionnee="form.carburants_id"
                            colonneAffichee = "type"
                            id="carburants_id"
                            v-model="form.carburants_id"
                            required
                        />
                        <InputError :message="form.errors.carburants_id" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="etats_id" :value="langVoiture.etat" />
                        <Select 
                            :options ="etats" 
                            :optionSelectionnee="form.etats_id"
                            colonneAffichee = "nom"
                            id="etats_id"
                            v-model="form.etats_id"
                            required
                        />
                        <InputError :message="form.errors.etats_id" />
                    </div>
                    <div class="champs__option">
                        <InputLabel for="statut_voitures_id" :value="langVoiture.statut" />
                        <Select 
                            :options ="statuts" 
                            :optionSelectionnee="form.statut_voitures_id"
                            colonneAffichee = "nom"
                            id="statut_voitures_id"
                            v-model="form.statut_voitures_id"
                            required
                        />
                        <InputError :message="form.errors.statut_voitures_id" />
                    </div>
                    <div class="champs__option" v-if="form.statut_voitures_id == 2">
                        <InputLabel for="reservation_users_id" :value="langVoiture.utilisateur_reservation" />
                        <Select 
                            :options ="users" 
                            :optionSelectionnee="form.reservation_users_id"
                            colonneAffichee = "email"
                            id="reservation_users_id"
                            v-model="form.reservation_users_id"
                        />
                        <InputError :message="form.errors.reservation_users_id" />
                    </div>
                    <div class="champs__descriptif">
                        <InputLabel for="description" :value="langVoiture.description" />
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
                        <InputLabel for="description_en" :value="langVoiture.description_en" />
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
                    <PrimaryButton class="" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                        {{langVoiture.modifier_soumettre}}
                    </PrimaryButton>
                    </div>
                </section>
            </form>
        </div>
    </TableauDeBordLayout>
</template>
<style scoped>
@media screen and (min-width: 700px) {
	.large-group {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
	}
	
	.champs__option {
		width: 45%;
	}

}

.titre-contenu {
    text-align: center;
    text-transform: uppercase;
}
.titre {
    font-family: var(--police-titre);
    color: var(--couleur-principale);
    padding: 1rem 0 ;
}

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

.titre {
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
.voiture_modifier{

    margin-bottom: 2rem;
}
</style>