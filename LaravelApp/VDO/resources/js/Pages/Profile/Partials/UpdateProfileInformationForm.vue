<script setup>
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { Link, useForm, usePage } from '@inertiajs/inertia-vue3';
import { ref } from 'vue';
import Select from '@/Components/Select.vue';

const props = defineProps({
    mustVerifyEmail: Boolean,
    status: String,
    lang:  Object,
    villes: Object,
});

const user = usePage().props.value.auth.user;

const form = useForm({
    name: user.name,
    first_name: user.first_name,
    email: user.email,
    anniversaire: user.anniversaire,
    adresse: user.adresse,
    code_postal: user.code_postal,
    telephone: user.telephone,
    telephone_portable: user.telephone_portable,
    villes_id: user.villes_id,
});
</script>

<template>
    <section>
        <header>
            <h2 class="text-lg font-medium text-gray-900 dark:text-gray-100"> {{lang.profil_title}}</h2>
        
            <p class="mt-1 text-sm text-gray-600 dark:text-gray-400">
                {{lang.profil_description}}
            </p>
        </header>

        <form @submit.prevent="form.patch(route('profile.update'))" class="mt-6 space-y-6">
            <div>
                <InputLabel for="name" :value="lang.name" />

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

            <div>
                <InputLabel for="first_name" :value="lang.first_name" />

                <TextInput
                    id="first_name"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.first_name"
                    required
                    autofocus
                    autocomplete="first_name"
                />

                <InputError class="mt-2" :message="form.errors.first_name" />
            </div>
            
            <div>
                <InputLabel for="adresse" :value="lang.adresse" />

                <TextInput
                    id="adresse"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.adresse"
                    required
                    autofocus
                    autocomplete="adresse"
                />

                <InputError class="mt-2" :message="form.errors.adresse" />
            </div>

            <div>
                <InputLabel for="code_postal" :value="lang.code_postal" />

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

            <div>
                <InputLabel for="telephone" :value="lang.telephone" />

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

            <div>
                <InputLabel for="telephone_portable" :value="lang.telephone" />

                <TextInput
                    id="telephone_portable"
                    type="text"
                    class="mt-1 block w-full"
                    v-model="form.telephone_portable"
                    required
                    autofocus
                    autocomplete="telephone_portable"
                />

                <InputError class="mt-2" :message="form.errors.telephone_portable" />
            </div>

            <div>
                <InputLabel for="villes_id" :value="lang.villes_id" />

                <Select
                :options = "$props.villes"
                colonneAffichee = "nom"
                />

                <InputError class="mt-2" :message="form.errors.villes_id" />
            </div>

            <div>
                <InputLabel for="email" :value="lang.email" />

                <TextInput
                    id="email"
                    type="email"
                    class="mt-1 block w-full"
                    v-model="form.email"
                    required
                    autocomplete="email"
                />

                <InputError class="mt-2" :message="form.errors.email" />
            </div>

            <div v-if="props.mustVerifyEmail && user.email_verified_at === null">
                <p class="text-sm mt-2 text-gray-800 dark:text-gray-200">
                    Your email address is unverified.
                    <Link
                        :href="route('verification.send')"
                        method="post"
                        as="button"
                        class="underline text-sm text-gray-600 dark:text-gray-400 hover:text-gray-900 dark:hover:text-gray-100 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 dark:focus:ring-offset-gray-800"
                    >
                        Click here to re-send the verification email.
                    </Link>
                </p>

                <div
                    v-show="props.status === 'verification-link-sent'"
                    class="mt-2 font-medium text-sm text-green-600 dark:text-green-400"
                >
                    A new verification link has been sent to your email address.
                </div>
            </div>

            <div class="flex items-center gap-4">
                <PrimaryButton :disabled="form.processing">   {{lang.save_button}}</PrimaryButton>

                <Transition enter-from-class="opacity-0" leave-to-class="opacity-0" class="transition ease-in-out">
                    <p v-if="form.recentlySuccessful" class="text-sm text-gray-600 dark:text-gray-400">Saved.</p>
                </Transition>
            </div>
        </form>
    </section>
</template>
