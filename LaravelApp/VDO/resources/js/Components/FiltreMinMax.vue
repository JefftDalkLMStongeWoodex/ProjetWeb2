<script>
export default {
    props:{
        unite:{
            default: ''
        },
        nom:{
            default: ''
        }
    },
}
</script>
<template>
    <details>
        <summary><strong>{{nom}}</strong></summary>
        <div class="min-max-filter">
            <input type="text" class="min-max-filter__input" :placeholder="$props.unite+' min'" aria-label="Montant minimum">
            <input type="text" class="min-max-filter__input" :placeholder="$props.unite+' max'" aria-label="Montant maximum">
        </div>
    </details>
</template>
<style scoped>
details summary{
    cursor: pointer;
}
.min-max-filter {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 0.6rem;
}

.min-max-filter__input {
    width: 5ch;
    height: 1.5rem;
    padding: 2px;
    padding-left: 1ch;
}
</style>