<script setup>
import { ref } from 'vue';
import SidebarVue from '@/Components/Sidebar.vue';
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
import { Link } from '@inertiajs/inertia-vue3';

const showingNavigationDropdown = ref(false);
</script>

<template>


    <div>
          

            <!-- Page Heading -->
            <header class="" v-if="$slots.header">
                <div class="">
                    <slot name="header" />
                </div>
            </header>

            <!-- Page Content -->
            <main>
                <slot />
            </main>
        </div>

</template>
<style scoped>


</style>