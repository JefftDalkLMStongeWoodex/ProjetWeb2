<script>
export default {
    props:{
        options: {
            type: Array,
            default: () => []
        },
        colonneAffichee: String,
        optionSelectionnee: [Number, String],
        value:{
            default: ''
        }
    },
    methods: {
        handleChange(e) {
            this.$emit('update:modelValue', e.target.value);
        }
    },
}
</script>

<template>
    <select @change="handleChange" class="boite-saisie">
        <option  value=""></option>
        <slot v-for="option in $props.options" :key="option.id">
            <option :value="option.id" :selected="(option.id == optionSelectionnee)">{{$page.props.lang.locale == "en" ? option[colonneAffichee + "_en"] : option[colonneAffichee]}}</option>
        </slot>
    </select>
</template>

<style scoped>
.boite-saisie{
    background-color: var(--couleur-secondaire);
    color: var(--couleur-blanc);
    border-color:  var(--couleur-blanc);
}

.boite-saisie option{
    color: var(--couleur-blanc);

}
.boite-saisie:focus {
    border: 0.5px solid var(--couleur-principale);
}
</style>