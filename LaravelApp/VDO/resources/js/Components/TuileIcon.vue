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
    <div class="tuile__icon">
       <div class="icon">   <slot name="icon" /> </div>
       <div class="tuile__contenu"> <slot name="contenu" /> </div>
    </div>
</template>
<style scoped>

.tuile__icon{
    display: flex;
    flex-flow: row;
    gap: 1.25rem;
    overflow: hidden;
    max-height: 5rem;
    
}

.icon{
    background-color: var(--couleur-secondaire);
    width: 4rem;
    min-height: 4rem;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 1.25rem;
   
}

.tuile__contenu{
    color: var(--couleur-principale);
    padding: 0.625rem 1.25rem 0.625rem 0;
    text-align: center;
    width: 100%;

}

@media (min-width: 900px) {

    .icon{
        width: 20%;
       
    }
    
    .tuile__contenu{
       
        font-size: 2rem ;
        text-align: left;
        min-width: 70%;
    
    
    }
    
    
    


}


</style>