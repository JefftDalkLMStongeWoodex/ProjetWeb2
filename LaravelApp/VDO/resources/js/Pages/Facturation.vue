<script setup>
import TableauDeBordLayout from '@/Layouts/TableauDeBord.vue';
import SidebarVue from '@/Components/Sidebar.vue';
import { Head } from '@inertiajs/inertia-vue3';
import Header from '@/Components/facture/Header.vue';
import Main from '@/Components/facture/Main.vue';
import Footer from '@/Components/facture/Footer.vue';

defineProps({
  langDashboard: Object,
})
</script>

<template>
    <Head title="Facture" />
    <TableauDeBordLayout> 
        <template #header>
            <SidebarVue :lang="langDashboard" />         
        </template>
      
        <div class="">
            <div class="entete">
                <Header :lang="langDashboard" />
            </div>

            <div class="corps">
                <Main :lang="langDashboard" />
            </div>

            <div class="piedDePage">
                <Footer :lang="langDashboard" />
            </div> 
        </div>
    </TableauDeBordLayout>
</template>
<style scoped>

</style>