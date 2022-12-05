<script setup>
import GuestLayout from '@/Layouts/GuestLayout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import Select from '@/Components/Select.vue';

const form = useForm({
    name: '',
    first_name: '',
    email: '',
    anniversaire:'',
    adresse:'',
    code_postal:'',
    telephone:'',
    telephone_portable:'',
    villes_id:'',
    privileges_id:'',
    password:'',
    password_confirmation: '',
    terms: false,
});

defineProps({
    villes: Object,
    langRegister: Object
})

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <GuestLayout>
        <Head title="Register" />
        <div class="mt-4 pb-8">
            <div>
                <h2 class="titre">{{langRegister.titre}}</h2>
            </div> 
            <p>{{langRegister.deja_un_compte}} <Link :href="route('login')" class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800"> {{langRegister.connectez_vous}}</Link> </p>
        </div>
        <form @submit.prevent="submit">
            <div>
                <InputLabel for="name" :value="langRegister.name" />
                <TextInput
                    id="name"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.name"
                    required
                    autofocus
                    autocomplete="name"
                />
                <InputError class="mt-2" :message="form.errors.name" />
            </div>
            <div class="mt-4">
                <InputLabel for="first_name" :value="langRegister.first_name" />
                <TextInput
                    id="first_name"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.first_name"
                    required
                    autofocus
                    autocomplete="first_name"
                    name="first_name"
                />
                <InputError class="mt-2" :message="form.errors.first_name" />
            </div>
            <div class="mt-4">
                <InputLabel for="anniversaire" :value="langRegister.anniversaire" />
                <TextInput
                    id="anniversaire"
                    type="date"
                    class="mt-1 block w-full"
                    v-model="form.anniversaire"
                    required
                    autofocus
                    autocomplete="anniversaire"
                />
                <InputError class="mt-2" :message="form.errors.anniversaire" />
            </div>
            <div class="mt-4">
                <InputLabel for="adresse" :value="langRegister.adresse" />
                <TextInput
                    id="adresse"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.adresse"
                    autofocus
                    autocomplete="adresse"
                />
                <InputError class="mt-2" :message="form.errors.adresse" />
            </div>
            <div class="mt-4">
                <InputLabel for="code_postal" :value="langRegister.code_postal" />
                <TextInput
                    id="code_postal"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.code_postal"
                    required
                    autofocus
                    autocomplete="code_postal"
                />
                <InputError class="mt-2" :message="form.errors.code_postal" />
            </div>
            <div class="mt-4">
                <InputLabel for="telephone" :value="langRegister.telephone" />
                <TextInput
                    id="telephone"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.telephone"
                    required
                    autofocus
                    autocomplete="telephone"
                />
                <InputError class="mt-2" :message="form.errors.telephone" />
            </div>
            <div class="mt-4">
                <InputLabel for="telephone_portable" :value="langRegister.telephone_portable" />
                <TextInput
                    id="telephone_portable"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.telephone_portable"
                    autofocus
                    autocomplete="telephone_portable"
                />
                <InputError class="mt-2" :message="form.errors.telephone_portable" />
            </div>
            <div class="mt-4">
                <InputLabel for="villes_id" :value="langRegister.villes" />
                <Select
                :options = "villes"
                id="villes_id"
                class="mt-1 block w-full"
                v-model="form.villes_id"
                required
                autofocus
                />
                <InputError class="mt-2" :message="form.errors.villes_id" />
            </div>
            <div class="mt-4">
                <InputLabel for="email" :value="langRegister.email" />
                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autocomplete="username"
                />
                <InputError class="mt-2" :message="form.errors.email" />
            </div>
            <div class="mt-4">
                <InputLabel for="password" :value="langRegister.password" />
                <TextInput
                    id="password"
                    type="password"
                    class="mt-1 block w-full"
                    v-model="form.password"
                    required
                    autocomplete="new-password"
                />
                <InputError class="mt-2" :message="form.errors.password" />
            </div>
            <div class="mt-4">
                <InputLabel for="password_confirmation" :value="langRegister.password" />
                <TextInput
                    id="password_confirmation"
                    type="password"
                    class="mt-1 block w-full"
                    v-model="form.password_confirmation"
                    required
                    autocomplete="new-password"
                />
                <InputError class="mt-2" :message="form.errors.password_confirmation" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <PrimaryButton class="" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                {{langRegister.creer}}
                </PrimaryButton>
            </div>
        </form>
    </GuestLayout>
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