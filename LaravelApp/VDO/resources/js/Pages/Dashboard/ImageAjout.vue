<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';

const props = defineProps({
    langImage: Object,
    langDashboard: Object,
    idVoiture: String,
    erreur_image: String
})

const form = useForm({
    nom: '',
    nom_en: '',
    image: '',
    alt: '',
    alt_en: '',
    image_principale: false,
    voitures_id: props.idVoiture
});

const submit = () => {
    form.post(route('image.store', props.idVoiture), { preserveState: true });
};
</script>

<template>
    <Head :title="langImage.ajout" />
    <div class="flex">
        <SidebarVue :lang="langDashboard "/>
        <div class="wrapper">
            <h2 class="titre-contenu">{{langImage.ajout}}</h2>
            <small>{{langImage.idVoiture}}: {{idVoiture}}</small>
            <form @submit.prevent="submit">
                <section class="large-group">
                    <div class="small-group">
                        <InputLabel
                            for="nom" 
                            class="label"
                            :value="langImage.nom" 
                        />
                        <TextInput 
                            id="nom"
                            v-model="form.nom"
                        />
                        <InputError :message="form.errors.nom" />
                    </div>
                    <div class="small-group">
                        <InputLabel
                            for="nom_en" 
                            class="label"
                            :value="langImage.nom_en" 
                        />
                        <TextInput 
                            id="nom_en"
                            v-model="form.nom_en"
                        />
                        <InputError :message="form.errors.nom_en" />
                    </div>
                    <div class="small-group">
                        <InputLabel
                            for="alt" 
                            class="label"
                            :value="langImage.alt" 
                        />
                        <TextInput 
                            id="alt"
                            v-model="form.alt"
                        />
                        <InputError :message="form.errors.alt" />
                    </div>
                    <div class="small-group">
                        <InputLabel
                            for="alt_en" 
                            class="label"
                            :value="langImage.alt_en" 
                        />
                        <TextInput 
                            id="alt_en"
                            v-model="form.alt_en"
                        />
                        <InputError :message="form.errors.alt_en" />
                    </div>
                    <div class="small-group">
                        <InputLabel
                            for="image" 
                            class="label"
                            :value="langImage.image" 
                        />
                        <TextInput 
                            id="image"
                            type="file"
                            @input="(form.image = $event.target.files[0])"
                        />
                        <InputError :message="form.errors.image" />
                    </div>
                    <div class="flex-column">
                        <div class="">
                            <InputLabel
                                for="image_principale" 
                                class="label"
                                :value="langImage.principale" 
                            />
                            <input
                            id="image_principale"
                            type="checkbox"
                            v-model="form.image_principale"
                            />
                        </div>
                        <small>{{langImage.principale_message}}</small>
                        <InputError :message="erreur_image" />
                        <InputError :message="form.errors.image_principale" />
                    </div>
                    <div class="btnSoumettre">
                        <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                            {{langImage.soumettre}}
                        </PrimaryButton>
                    </div>
                </section>
                
            </form>
        </div>
    </div>
</template>
<style scoped>

@media screen and (min-width: 700px) {
	.large-group {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
	}
	
	.small-group {
		width: 45%;
	}
}
.label {
    display: block;
    margin-bottom: 5px;
}

input:not([type = checkbox]), select {
    width: 100%;
    margin-bottom: 10px;
    border-radius: 8px;
}

.textarea-div {
	width: 100%;
}

textarea {
    width:100%; 
    height: 150px;
    border-radius: 8px;
    margin-bottom: 10px;
}

.btnSoumettre {
    width: 100%;
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

p {
    color:  var(--couleur-blanc);
}
p a{
    color:  var(--couleur-principale);  
}
</style>