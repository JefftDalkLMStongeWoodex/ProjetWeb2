<script>
export default {
    data() {
        return {
            checkedValues : []
        }
    },
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
        handleChange() {
            this.$emit('update:modelValue', this.$data.checkedValues);
        }
    },
}
</script>
<template>
    <details>
        <summary><strong>{{titre}}</strong></summary>
        <ul>
            <li v-for="option in options">
            <input type="checkbox" :name="option[colonneAffichee]" :id="option[colonneAffichee]" v-model="checkedValues"  :value="option[colonneAffichee]" @change="handleChange">
            <label :for="option[colonneAffichee]">{{$page.props.lang.locale == "en" && option[colonneAffichee + "_en"]!=null ? option[colonneAffichee + "_en"] : option[colonneAffichee]}}</label>
            </li>
        </ul>
    </details>
</template>
<style scoped>
details summary{
    cursor: pointer;
}

input {
    margin-right: 0.3em;
}
</style>