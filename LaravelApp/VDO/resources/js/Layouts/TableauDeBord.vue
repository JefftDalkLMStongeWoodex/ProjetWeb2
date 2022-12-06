<script setup>
import { ref } from 'vue';
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