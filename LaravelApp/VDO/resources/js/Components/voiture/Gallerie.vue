<script setup>
    import { onMounted } from 'vue'

    const props = defineProps({
        images: {
            type: Array,
            default: null
        },
        imagePrincipale: {
            type: Object,
            default: null
        },
        lang: Object
    })

    onMounted(() => {
        props.images.sort(function(a, b) {
            if (a.image_principale > b.image_principale) return -1 
            if (a.image_principale < b.image_principale) return 1 
        })
    });
</script>
<script>
    export default {
        data() {
            return {
                imageSelectionnee: 0 
            }
        },
        methods: {
            selectionnerImage(i) {
                this.imageSelectionnee = i;
            }
        }
    }
</script>
<template>
    <div v-if="(images.length > 0)" class="auction__gallery">
        <img
            class="auction__img auction__img-grosse" 
            :src="`/storage/${images[imageSelectionnee].chemin}`" 
            :alt="$page.props.lang.locale == 'en' ? imagePrincipale.alt_en : imagePrincipale.alt" 
            data-main-photo
        >
        <img 
            class="auction__img" 
            v-for="(image, index) in images" 
            :src="`/storage/${image.chemin}`" 
            :alt="$page.props.lang.locale == 'en' ? image.alt_en : image.alt" 
            @click="selectionnerImage(index)"
            :class="{'active' : index === imageSelectionnee}"
        >
    </div>
    <div v-else>
        {{lang.aucune_image_dispo}}
    </div>
</template>

<style scoped>
.auction__gallery {
    position: relative;
    height: min-content;
    display: grid;
    gap: 1rem;
    grid-column: 1/13;
    grid-template-columns: repeat(6, 1fr);
    grid-template-rows: repeat(3, min-content);
}

.auction__img-grosse {
    width: 100%;
}

@media only screen and (min-width: 1024px) {
    .auction__gallery {
        top: 2rem;
        position: sticky;
        grid-column: 1/6;
    }
}

.auction__gallery img {
    aspect-ratio: 4/3;
}

.auction__gallery > img {
    cursor: pointer;
} 

.auction__gallery > img {
    border: solid 2px transparent;
} 

.auction__gallery > img:not(:first-child):not([data-state="focused"]):hover {
    border: solid 2px var(--color-tertiary);
} 

.auction__gallery img:first-child {
    grid-column: 1/7;
}

.active {
    border: unset;
}
.auction__gallery > img.active {
    border: 2px solid red;
}

.auction__gallery > p {
    grid-column: 1/7;
    text-align: center;
}
</style>