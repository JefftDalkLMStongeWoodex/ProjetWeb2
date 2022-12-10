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
        <summary><strong>{{titre}}</strong></summary>
        <ul>
            <li v-for="option in options" class="filter">
            <input type="checkbox" :name="option" id="option">
            {{$page.props.lang.locale == "en" && option[colonneAffichee + "_en"]!=null ? option[colonneAffichee + "_en"] : option[colonneAffichee]}}
            </li>
        </ul>
    </details>
</template>
<style scoped>
details summary{
    cursor: pointer;
}
</style>