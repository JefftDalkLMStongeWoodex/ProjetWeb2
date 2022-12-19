<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';


defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    langAppLayout: Object,
    langPolitque: Object,
});
</script>
<template>
    <Head title="Politique" />
    <AppLayout :lang="langAppLayout">
        <div class="grid">
           

            <div class="conteneur">

                <div class="politique__titre">
                  <h1>{{langPolitque.titre}}  </h1>
                </div>

                <div class="politique__contenu">
                        
                        <h3> {{langPolitque.date}} </h3>

                        <h4>  {{langPolitque.objet}} </h4>
                        <p>
                            
                            {{langPolitque.texteobjet}} 
                        
                        </p>
                        
                        <h4>  {{langPolitque.titre2}} </h4>
                        <p>
                            {{langPolitque.texte2}} 
                            
                        </p>

                        <h4>  {{langPolitque.titre3}} </h4>
                        <p>
                            {{langPolitque.texte3}} 
                        </p>


            
    
                        <h4>  {{langPolitque.titre4}} </h4>
                        <p>
                            {{langPolitque.texte4}} 
                        </p>
                        
                        <p>  VDO  INC</p>
                        <p> {{langPolitque.attention}} </p>
                        
                        <p>{{langPolitque.adresse}} </p>

                </div>
            </div>

         </div>
          
    </AppLayout>
</template>
<style scoped>

.conteneur{
text-align:alignment type;
margin: 4rem ;
line-height: 2rem;

}
.grid{
color: var(--couleur-blanc);
background-color: var(--couleur-secondaire-leger);

}
</style>