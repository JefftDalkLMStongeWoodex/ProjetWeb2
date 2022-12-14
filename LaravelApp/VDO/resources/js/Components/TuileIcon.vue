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
    background-color: var(--couleur-secondaire);
    width: 25%;
    padding: 0.65rem;
    text-align: center;
    font-size: 1.5rem;
    color: white;
    padding-left: 1rem;
    margin: 0rem;
    padding-top: 1.4rem;
   
}



@media (min-width: 900px) {

    .icon{
        width: 20%;
       
    }
    
    
    
    
    
    .tuile_contenu{
        text-align: center;
        width: 100%;
        color: var(--couleur-principale);
        font-size: 2rem ;
        font-weight: bold;
        padding-top: 0.8rem;
    
    
    }

}


</style>