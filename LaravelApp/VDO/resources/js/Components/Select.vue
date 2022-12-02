<script>
export default {
    props:{
        options: {
            type: Array,
            default: () => []
        },
        value:{
            default: ''
        }
    },
    methods: {
        handleChange(e) {
            this.$emit('update:modelValue',e.target.value);
        }
    }
}
</script>

<template>
    <select @change="handleChange" class="border-gray-300 dark:border-gray-700 dark:bg-gray-900 dark:text-gray-300 focus:border-indigo-500 dark:focus:border-indigo-600 focus:ring-indigo-500 dark:focus:ring-indigo-600 rounded-md shadow-sm">
        <option  value=""></option>
        <slot v-for="option in $props.options" :key="option.id">
        <option  :value="option.id"> {{option.nom}}</option>
        </slot>
    </select>
</template>

<style scoped>
</style>