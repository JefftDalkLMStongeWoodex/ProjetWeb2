<script>
</script>

<template>
    <select>
        <slot v-for="option in $attrs.options">
        <option  :value="option.id"> {{option.nom}}</option>
        </slot>
    </select>
</template>

<style scoped>
</style>