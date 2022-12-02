<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';
</script>

<template>

  <Head title="APropos" />

  <AppLayout>
    <div class="mt-petit">
      <div class="tuile">
        <div class="">
            <h1 class="tuile__title">Notre mission</h1>
            <hr class="mt-2">
            <p class="tuile__slogan mt-6">Vous offir un service qui fait le kilomètre supplémentaire</p>
        </div>
      </div>
    </div>

    <div class="mt-petit">
      <div class="tuile">
    
        <div class="grid gap-3 grid-cols-3">
          <h1 class="tuile__title">Nous sommes là pour vous</h1>
          <p class="tuile__texte pl-8">Lorsque vous visiterez VDO inc, vous découvrirez rapidement que nous ne sommes pas votre concessionnaire de voitures d'occasion typique. Nous sommes meilleurs !
          Chez VDO inc, nous ne nous contentons pas simplement d'être bons dans ce que nous faisons. Nous allons plus loin, faisons plus et établissons de nouvelles normes d'excellence du service à la clientèle. Notre équipe de vente amicale et compétente passera en revue votre liste d'articles indispensables et vous proposera le modèle d'occasion qui a tout ce que vous recherchez. 
          </p>

          <p class="tuile__texte pr-6"> Votre voyage vers le plaisir et la liberté commence sur notre terrain, où nous proposons une superbe sélection de voitures, camions, mini-fourgonnettes et VUS d'occasion de qualité provenant de certains des constructeurs automobiles préférés du Canada.
          Chaque modèle est livré avec des fonctionnalités intéressantes et une technologie pratique qui aident à faire passer chaque voyage de l'ordinaire à l'extraordinaire.Vous pouvez parcourir notre inventaire régulièrement et nous demander n'importe quoi, à tout moment, sur notre site Web.
          </p>
        </div>
      </div>
    </div>

    <div class="mt-medium bg-tuile">
      <div class="tuile">
        <div class="">
            <h1 class="tuile__title mt-3">Ce qui nous rend unique</h1>
        </div>

        <div class="grid gap-4 grid-cols-2">
          <p class="tuile__texte pl-8">Lorsque vous visiterez VDO inc, vous découvrirez rapidement que nous ne sommes pas votre concessionnaire de voitures d'occasion typique. Nous sommes meilleurs !
          Chez VDO inc, nous ne nous contentons pas simplement d'être bons dans ce que nous faisons. Nous allons plus loin, faisons plus et établissons de nouvelles normes d'excellence du service à la clientèle. Notre équipe de vente amicale et compétente passera en revue votre liste d'articles indispensables et vous proposera le modèle d'occasion qui a tout ce que vous recherchez. 
          </p>

          <p class="tuile__texte pr-6"> Votre voyage vers le plaisir et la liberté commence sur notre terrain, où nous proposons une superbe sélection de voitures, camions, mini-fourgonnettes et VUS d'occasion de qualité provenant de certains des constructeurs automobiles préférés du Canada.
          Chaque modèle est livré avec des fonctionnalités intéressantes et une technologie pratique qui aident à faire passer chaque voyage de l'ordinaire à l'extraordinaire.Vous pouvez parcourir notre inventaire régulièrement et nous demander n'importe quoi, à tout moment, sur notre site Web.
          </p>
        </div>
      </div>
    </div>
  </AppLayout>

</template>


<style scoped>
.mt-petit {
  margin-top: 3rem;
}
.mt-medium {
  margin-top: 5rem;
}
.tuile {
  display: flex;
  justify-content: center;
  align-items: center;
}
.tuile__title {
  color: var(--couleur-secondaire);
  font-family: var(--police-titre);
  font-size: 2.5rem;
}
.tuile__slogan {
  font-family: var(--police-texte);
  color: var(--couleur-principale);
  font-size: 4rem;
}
.tuile__texte {
  color: var(--couleur-secondaire);
  font-family: var(--police-texte);
  font-size: 16px;
  line-height: 1.5;
} 
.bg-tuile {
  background-color:#F1F2F9;
}</style>

