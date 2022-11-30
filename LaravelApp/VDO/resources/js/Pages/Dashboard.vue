<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import SidebarVue from '@/Components/Sidebar.vue';

import { Head } from '@inertiajs/inertia-vue3';
</script>

<template>
    <Head title="Dashboard" />
    <SidebarVue />



    <AuthenticatedLayout>

        <div class="application">      

            <div class="contenu--tableau-de-bord ">
                <h2 class="titre--page">Dashboard</h2>
                <div class="py-12">
                    <div class="">
                        <div class="">
                            <div class="">You're logged in!</div>
                        </div>
                    </div>
                </div>
             </div>
        </div>

    </AuthenticatedLayout>

</template>
<style scoped>


.application{
    flex: 1 1 0;
    padding: 2rem;
}

.contenu--tableau-de-bord {
    display: flex;
    margin: 3em;
    line-height: 1.5;
    font-weight: 500;
   }


   a {
    color: pink;
   }
   .titre--page{
    font-weight: bold;
    font-size: x-large;
   
    
}


</style>