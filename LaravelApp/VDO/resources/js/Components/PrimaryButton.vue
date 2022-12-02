<script setup>
defineProps({
    type: {
        type: String,
        default: 'submit',
    },
});
</script>

<template>
    <button
        :type="type"
        class="icon-send"
    >
        <slot />
    </button>
</template>

<style scoped>
button{
width: 100%;
padding: 1.0rem;
color:var(--couleur-blanc);
border-radius:  5px;
background: var(--couleur-principale);
font-family: var(--police-texte);
font-weight:800 ;
font-size: 1.5rem;
justify-content: center;
transition: all 0.4s ease 0s

}


button:hover{

    background: var(--couleur-principale);
    opacity: 0.85;
    color: var(--couleur-secondaire);
    letter-spacing: 1px;
    -webkit-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
    -moz-box-shadow: 0px 5px 40px -10px rgba(0,0,0,0.57);
    box-shadow: 5px 40px -10px rgba(0,0,0,0.57);
    transition: all 0.4s ease 0s;
    }
    


</style>


