<script setup>
defineProps(['value']);
</script>

<template>
    <label class="block font-medium text-sm text-gray-700 dark:text-gray-300 etiquette">
        <span v-if="value">{{ value }}</span>
        <span v-else><slot /></span>
    </label>
</template>
<style scoped>

.etiquette{
   font-family: var(--police-titre);
   color: var(--couleur-principale);
    
}

</style>