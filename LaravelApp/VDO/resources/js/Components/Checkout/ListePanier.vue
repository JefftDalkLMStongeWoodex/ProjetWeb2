<script setup>
import { Link } from '@inertiajs/inertia-vue3';
const emit = defineEmits(['suppressionItem'])
</script>
<script>
export default{
    methods:{
        suppressionItem(id) {
            this.$emit('suppressionItem', id);
        }
    }
}
</script>
<template>
    <ul>
        <li v-for="item of $attrs.liste" class="liste_Panier">
            <div class="liste_Panier__image">
                <img v-if="item.imagePrincipale[0] != null" :src="`/storage/${item.imagePrincipale[0].chemin}`" class="vehicule-img" />
                <img v-else src="../../../assets/kiaForte2015.jpg" class="vehicule-img" />
            </div>
            <div>
                <div class="liste_Panier__details">
                    <Link :href="route('voiture.fiche',item.id)">
                        <p>{{item.annee}} {{item.constructeurs}} {{item.modeles}}</p>
                    </Link>
                    <p>
                        ${{item.prix}}
                    </p>
              
                <button @click="suppressionItem(item.id)">
                    <i class="fa-solid fa-trash-can"></i>
                </button>
            </div>
            </div>
        </li>
    </ul>
</template>
<style scoped>
.liste_Panier{
    display: flex;
}

.liste_Panier__image{
    margin-top: 0;
    padding: 2rem;
    margin-right: 0.62rem ;
    width: 25%;
}
.liste_Panier__details{
    display: flex;
    flex-grow: inherit;
}

</style>
