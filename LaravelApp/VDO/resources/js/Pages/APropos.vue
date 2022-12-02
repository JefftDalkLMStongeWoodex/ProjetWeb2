<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
</script>

<template>

  <Head title="APropos" />

  <AppLayout>
    <div class="max-w-6xl mx-auto sm:px-6 lg:px-8">
      
      <div class="tuile">
        <div>
          <img src="" alt="" class="tuile__img">
        </div>
        <div class="tuile__texte text-center">
            <h1 class="tuile__title">Notre but</h1>
            <p class="tuile__texte-slogan">Vous offir un service qui fait le kilomètre supplémentaire</p>
        </div>
      </div>

    </div>
  </AppLayout>

</template>


<style scoped>
.img__APropos {
  padding: 100px;
  background-color: grey;
  width: 100%;
}

.img-tile {
  display: flex;
}

.tuile__title {
 font-size: var(--police-titre); 
}
</style>

