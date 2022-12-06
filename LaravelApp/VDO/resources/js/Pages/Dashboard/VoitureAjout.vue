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
});

const submit = () => {
    form.post(route('voiture.store'), { preserveState: true });
};
</script>

<template>
    <Head :title="langVoiture.ajout" />
    <div class="flex">
        <SidebarVue :lang="langDashboard "/>
        <div>
            <h1>{{langVoiture.ajout}}</h1>
            <form @submit.prevent="submit">
                <div>
                    <InputLabel for="modeles_id" :value="langVoiture.modele" />
                    <Select 
                        :options="modeles" 
                        colonneAffichee="nom"
                        id="modeles_id"
                        v-model="form.modeles_id"
                        required
                    />
                    <InputError :message="form.errors.modeles_id" />
                </div>
                <div>
                    <InputLabel for="annee" :value="langVoiture.annee" />
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
                <div>
                    <InputLabel for="prix_paye" :value="langVoiture.prix_paye" />
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
                <div>
                    <InputLabel for="date_arrivee" :value="langVoiture.date_arrivee" />
                    <TextInput 
                        id="date_arrivee"
                        type="date"
                        v-model="form.date_arrivee"
                        autocomplate="date_arrivee"
                    />
                    <InputError :message="form.errors.date_arrivee" />
                </div>
                <div>
                    <InputLabel for="kilometrage" :value="langVoiture.kilometrage" />
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
                <div>
                    <InputLabel for="corps_id" :value="langVoiture.corps" />
                    <Select 
                        :options ="corps" 
                        colonneAffichee = "type"
                        id="corps_id"
                        v-model="form.corps_id"
                        required
                    />
                    <InputError :message="form.errors.corps_id" />
                </div>
                <div>
                    <InputLabel for="transmissions_id" :value="langVoiture.transmission" />
                    <Select 
                        :options ="transmissions" 
                        colonneAffichee = "type"
                        id="transmissions_id"
                        v-model="form.transmissions_id"
                        required
                    />
                    <InputError :message="form.errors.transmissions_id" />
                </div>
                <div>
                    <InputLabel for="groupe_motopropulseurs_id" :value="langVoiture.groupe_motopropulseur" />
                    <Select 
                        :options ="groupeMotopropulseurs" 
                        colonneAffichee = "type"
                        id="groupe_motopropulseurs_id"
                        v-model="form.groupe_motopropulseurs_id"
                        required
                    />
                    <InputError :message="form.errors.groupe_motopropulseurs_id" />
                </div>
                <div>
                    <InputLabel for="carburants_id" :value="langVoiture.carburant" />
                    <Select 
                        :options ="carburants" 
                        colonneAffichee = "type"
                        id="carburants_id"
                        v-model="form.carburants_id"
                        required
                    />
                    <InputError :message="form.errors.carburants_id" />
                </div>
                <div>
                    <InputLabel for="etats_id" :value="langVoiture.etat" />
                    <Select 
                        :options ="etats" 
                        colonneAffichee = "nom"
                        id="etats_id"
                        v-model="form.etats_id"
                        required
                    />
                    <InputError :message="form.errors.etats_id" />
                </div>
                <div>
                    <InputLabel for="statut_voitures_id" :value="langVoiture.statut" />
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
                    <InputLabel for="reservation_users_id" :value="langVoiture.utilisateur_reservation" />
                    <Select 
                        :options ="users" 
                        colonneAffichee = "email"
                        id="reservation_users_id"
                        v-model="form.reservation_users_id"
                    />
                    <InputError :message="form.errors.reservation_users_id" />
                </div>
                <div>
                    <InputLabel for="description" :value="langVoiture.description" />
                    <textarea 
                        id="description" 
                        name="description" 
                        cols="50"
                        :placeholder="langVoiture.description_placeholder" 
                    />
                    <InputError :message="form.errors.description" />
                </div>
                <div>
                <PrimaryButton class="ml-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    {{langVoiture.soumettre}}
                </PrimaryButton>
                </div>
            </form>
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