<script>
export default {
    props:{
        titre: {
            type: String,
            default: ''
        },
        options: {
            type: Array,
            default: () => []
        },
        colonneAffichee: String,
    },
    methods: {
        handleChange(e) {
            this.$emit('update:modelValue', e.target.value);
        }
    },
}
</script>
<template>
    <details>
        <summary>{{titre}}</summary>
        <ul>
            <li v-for="option in options">
            <input type="checkbox" :name="option" id="option">
            <strong>{{$page.props.lang.locale == "en" ? option[colonneAffichee + "_en"] : option[colonneAffichee]}}</strong>
            </li>
        </ul>
    </details>
</template>
<style scoped>
</style>