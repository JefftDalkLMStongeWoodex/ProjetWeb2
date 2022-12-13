<script>
export default {
    props:{
        data: {
            type: Object,
            default: () => []
        },
        modele:{
            type: String,
            default: ''
        },
        value:{
            default: ''
        }
    },
}
</script>
<template>
    <div class="tuile_icon">
       <div class="icon">   <slot name="icon" /> </div>
       <div class="tuile_contenu"> <slot name="contenu" /> </div>
    </div>
</template>
<style scoped>

.tuile_icon{
    display: flex;
}
.icon{
    background-color: var(--couleur-principale);
    width: 20%;
    padding: 0.2rem;
    text-align: center;
    font-size: 1.5rem;
}

.icon img{
   color: white;
}



.tuile_contenu{
text-align: center;
background-color: red ;
width: 100%;

}
</style>