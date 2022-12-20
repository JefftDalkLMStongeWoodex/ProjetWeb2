<script setup>
  import PrimaryButton from '@/Components/PrimaryButton.vue';

  defineProps({
    lang: Object,
  });
</script>

<template>
  <section class="">
    <div class="image__entete wrapper">
      <h2 
        class="titre">
        <!-- Trouver votre  -->
        {{lang.accueil_trouver}}
        <br>
        <span>
          {{lang.accueil_prochaine}}
        </span>
        <br> 
        {{lang.accueil_occasion}}
      </h2>
      <div class="image__input">
        <input 
          type="search" 
          class="image__barre-recherche"
          :placeholder="lang.accueil_placerholder"
        >
      </div>
      
      <div class="image__bouton">
        <PrimaryButton>
          {{lang.accueil_recherche}}
        </PrimaryButton>
      </div>
    </div>
  </section>
</template>

<style scoped>
.image__entete {
  background-image: url("../../../assets/entete.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  padding-top: 200px;
  padding-bottom: 650px;
}

.titre {
  font-family: var(--police-titre);
  color: var(--couleur-blanc);
}

.image__barre-recherche {
  width: 31rem;
  height: 2.2rem;
  margin-bottom: 3rem;
}

.image__barre-recherche:focus {
  --tw-ring-color: var(--couleur-principale);
}

::placeholder {
  color: var(--couleur-blanc);
}

.image__barre-recherche {
  border: 3px solid var(--couleur-principale);
  background:none;
  color: var(--couleur-blanc);
}

.image__bouton {
  max-width: 31rem;
}

/* 
@media only screen and (max-width: 500px) {

  .image__entete {
    background-image: url("../../../assets/entete.jpg");
    background-repeat: no-repeat;
    background-position: 25%;
    background-size: cover;
    padding-top: 200px;
    padding-bottom: 650px;
  }
} */

@media only screen and (min-width: 320px) and (max-width: 500px) {

  .image__entete {
    background-image: url("../../../assets/entete.jpg");
    background-repeat: no-repeat;
    background-position: 25%;
    background-size: cover;
    padding-top: 200px;
    padding-bottom: 300px;
  }
  .image__barre-recherche {
    width: 18rem;
  }

  .image__bouton {
    max-width: 18rem;
  }
}

@media only screen and (min-width: 501px) and (max-width: 700px) {
  .image__barre-recherche {
    width: 20rem;
  }

  .image__bouton {
    max-width: 20rem;
  }
}
</style>