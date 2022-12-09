<script setup>
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import SidebarVue from '@/Components/Sidebar.vue';
import DeleteUserForm from './Partials/DeleteUserForm.vue';
import UpdatePasswordForm from './Partials/UpdatePasswordForm.vue';
import UpdateProfileInformationForm from './Partials/UpdateProfileInformationForm.vue';
import { Head } from '@inertiajs/inertia-vue3';

defineProps({
    mustVerifyEmail: Boolean,
    status: Boolean,
    langProfil: Object,
    langDashboard: Object

});


</script>

<template>
    <Head title="Profile" />

    
    <TableauDeBordLayout>
        <template #header>
            <SidebarVue :lang="langDashboard"/>
         </template>
        <div class="flex"> 
            <div class=" py-12">
                <div class="max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
                    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                        <UpdateProfileInformationForm
                            :must-verify-email="mustVerifyEmail"
                            :status="status"
                            class="max-w-xl"
                            :lang="langProfil"
                        />
                    </div>

                    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                        <UpdatePasswordForm class="max-w-xl" 
                        :lang="langProfil"
                        
                        />
                    </div>

                    <div class="p-4 sm:p-8 bg-white dark:bg-gray-800 shadow sm:rounded-lg">
                        <DeleteUserForm class="max-w-xl" 
                        :lang="langProfil"
                        
                        />
                    </div>
                </div>
            </div>
        </div>

    </TableauDeBordLayout>
</template>
<style scoped>

.voitures__conteneur {
    background-color: var(--couleur-secondaire);
    border-left: var(--couleur-blanc-opacite-50) solid 1px;
    color: var(--couleur-blanc);
    flex-grow: 1;
    font-family: var(--police-texte);
    padding: 3rem 2rem 0rem 2rem;
}
.conteneur{
    background-color: red;
}
</style>