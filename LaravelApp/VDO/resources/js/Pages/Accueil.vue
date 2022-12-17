<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
import EnteteAccueil from '@/Components/accueil/EnteteAccueil.vue';
import ModeDeVie from '@/Components/accueil/ModeDeVie.vue';
import Temoignages from '@/Components/accueil/Temoignages.vue';

defineProps({
    canLogin: Boolean,
    canRegister: Boolean,
    langAppLayout: Object,
});
</script>
<template>
    <Head title="Accueil" />
    <AppLayout :lang="langAppLayout">
        
            <div class="grid">
                <div class="entete">
                    <EnteteAccueil :lang="langAppLayout" />
                </div>

                <div class="mode wrapper">
                    <ModeDeVie :lang="langAppLayout" />
                </div>

                <div class="temoignages wrapper">
                    <Temoignages :lang="langAppLayout" />
                </div> 
        </div>
    </AppLayout>
</template>
<style scoped>
.grid {  
    display: grid;
    grid-template-columns:  repeat( auto-fit, minmax(250px, 1fr) );
    grid-template-rows: 1fr 1fr 1fr;
    gap: 50px 0px;
    grid-auto-flow: row;
    grid-template-areas:
    "entete entete entete entete entete entete entete entete entete entete entete"
    "entete entete entete entete entete entete entete entete entete entete entete"
    "entete entete entete entete entete entete entete entete entete entete entete"
    "mode mode mode mode mode mode mode mode mode mode mode"
    "mode mode mode mode mode mode mode mode mode mode mode"
    "temoignages temoignages temoignages temoignages temoignages temoignages temoignages temoignages temoignages temoignages temoignages"

}

.entete { 
    grid-area: entete;
}

.mode { 
    grid-area: mode; 
}

.temoignages { 
    grid-area: temoignages;
}

</style>