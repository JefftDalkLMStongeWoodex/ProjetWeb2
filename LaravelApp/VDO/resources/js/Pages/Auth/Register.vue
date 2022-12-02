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

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <GuestLayout>
        <Head title="Register" />

        <div class="flex items-center justify-end mt-4">
          <p>     Vous avez deja un compte? 
            <Link
                :href="route('login')"
                class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800"
            >
                Connectez-vous
          </Link>
        </p>
        </div>



        <form @submit.prevent="submit">
            <div>
                <InputLabel for="name" value="Name" />

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
                <InputLabel for="first_name" value="First Name" />

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
                <InputLabel for="anniversaire" value="Anniversaire" />

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
                <InputLabel for="adresse" value="Adresse" />

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
                <InputLabel for="code_postal" value="Code Postal" />

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
                <InputLabel for="telephone" value="Telephone" />

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
                <InputLabel for="telephone_portable" value="Telephone Portable" />

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
                <InputLabel for="villes_id" value="Ville" />

                <Select
                :options = "$attrs.villes"
                id="villes_id"
                class="mt-1 block w-full"
                v-model="form.villes_id"
                required
                autofocus
                />
                <InputError class="mt-2" :message="form.errors.villes_id" />
            </div>

            <!-- <div class="mt-4">
                <InputLabel for="villes_id" value="Id Ville" />

                <TextInput
                    id="villes_id"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.villes_id"
                    required
                    autofocus
                    autocomplete="villes_id"
                />

                <InputError class="mt-2" :message="form.errors.villes_id" />
            </div> -->

            <div class="mt-4">
                <InputLabel for="email" value="Email" />

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
                <InputLabel for="password" value="Password" />

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
                <InputLabel for="password_confirmation" value="Confirm Password" />

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

            <div class="flex  mt-4">

                <PrimaryButton class="ml-4" :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                    S'inscrire
                </PrimaryButton>
            </div>
        </form>
    </GuestLayout>
</template>
