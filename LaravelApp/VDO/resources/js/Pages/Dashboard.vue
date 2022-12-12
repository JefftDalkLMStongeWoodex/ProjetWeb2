<script setup>
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import SidebarVue from '@/Components/Sidebar.vue';
import { Head } from '@inertiajs/inertia-vue3';

defineProps({
    langDashboard: Object,
})
</script>

<template>
    <Head title="Dashboard" />
    <TableauDeBordLayout> 

        <template #header>
            <SidebarVue :lang="langDashboard"/>         
        </template>
            
            <div class="application">      
                <div class="contenu--tableau-de-bord ">

                    <h2 class="titre">{{langDashboard.titre}}</h2>
                    <div class="py-12">
                        <div class="">
                            <div class="">
                                <div class="">{{langDashboard.texte}}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</TableauDeBordLayout>
</template>
<style scoped>
.contenu--tableau-de-bord {
    flex: 1 1 0;
    margin: 3em;
    line-height: 1.5;
    font-weight: 500;
    color: var(--couleur-secondaire);
}
.titre {
    font-family: var(--police-titre);
    text-transform: uppercase;
}



</style>