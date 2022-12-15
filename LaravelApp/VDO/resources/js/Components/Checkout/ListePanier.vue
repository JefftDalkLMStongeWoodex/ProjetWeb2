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
        <li v-for="item of $attrs.liste">
            <div>
                <img v-if="item.imagePrincipale[0] != null" :src="`/storage/${item.imagePrincipale[0].chemin}`" class="vehicule-img" />
                <img v-else src="../../../assets/kiaForte2015.jpg" class="vehicule-img" />
            </div>
            <div>
                <div>
                    <Link :href="route('voiture.fiche',item.id)">
                        <p>{{item.annee}} {{item.constructeurs}} {{item.modeles}}</p>
                    </Link>
                    <p>
                        ${{item.prix}}
                    </p>
                </div>
                <button @click="suppressionItem(item.id)">
                    <i class="fa-solid fa-trash-can"></i>
                </button>
            </div>
        </li>
    </ul>
</template>
<style scoped>
</style>