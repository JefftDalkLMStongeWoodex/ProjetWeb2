<script setup>
import { onMounted, ref } from 'vue';

defineProps(['modelValue']);

defineEmits(['update:modelValue']);

const input = ref(null);

onMounted(() => {
    if (input.value.hasAttribute('autofocus')) {
        input.value.focus();
    }
});

defineExpose({ focus: () => input.value.focus() });
</script>

<template>
    <input
        class="boite-saisie"
        :value="modelValue"
        @input="$emit('update:modelValue', $event.target.value)"
        ref="input"
    />
</template>
<style scoped>

.boite-saisie{
    background-color: var(--couleur-secondaire);
    color: var(--couleur-blanc);
    border-color:  var(--couleur-blanc);
}
.boite-saisie:focus {
    border: 0.5px solid var(--couleur-principale);
  }

</style>