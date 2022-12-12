<script setup>
import { Link } from '@inertiajs/inertia-vue3';
import { assert } from '@vue/compiler-core';
import chevronDroit from '/resources/assets/icones/material-chevron-right-white.svg';

defineProps({
    tableau: Object,
    tableau_th: Array,
    route_detail: Boolean,
    route_nom: String,
    colonne_image: [Boolean, String]
});
</script>
<script>

</script>

<template>
    <div class="tableau__conteneur">
        <table class="tableau">
            <thead class="tableau__en-tete">
                <th v-if="colonne_image" class="en-tete__cellule">Image</th>
                <th class="en-tete__cellule" v-for="th in tableau_th">{{th}}</th>
                <th v-if="route_detail"></th>
            </thead>
            <tbody>
                <tr class="tableau__rangee" v-for="rangee in tableau" :key="rangee.id">
                    <td v-if="colonne_image" class="tableau__cellule">
                        <img :src="`/storage/${rangee.chemin}`" :alt="(rangee.alt || rangee.alt_en)">
                    </td>
                    <td v-for="colonne in rangee" class="tableau__cellule">{{colonne ? colonne : "null"}}</td>
                    <td v-if="route_detail" class="tableau__cellule">
                        <Link :href="route(route_nom, rangee.id)">
                            <img class="" :src="chevronDroit">
                        </Link>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>
<style scoped>
    h1 {
        font-size: 36px;
        font-family: var(--police-titre);
    }

    .tableau__conteneur {
        border: var(--couleur-blanc-opacite-50) solid 1px;
        border-radius: 0.375rem;
        margin-top: 2rem;
        overflow-x: auto;
    }
    
    .tableau {
        white-space: nowrap;
        width: 100%;
    }

    .tableau__rangee, .tableau__en-tete {
        text-align: left;
    }

    .tableau__cellule, .en-tete__cellule {
        padding: 0.5rem;
    }

    .tableau__cellule {
        border-top: var(--couleur-blanc-opacite-30) solid 1px;
    }

    .tableau__cellule a {
        display: flex;
        align-items: center;
    }
</style>
