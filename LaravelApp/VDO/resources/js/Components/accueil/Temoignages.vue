<script setup>
import IconeProfil from '../IconeProfil.vue';

defineProps({
    lang: Object,
});
</script>

<template>
  <section>
    <div class="temoignages">
      <h3 class="temoignages__titre">{{lang.accueil_temoignage}}</h3>
      <div class="temoignages__contenu">
        <article class="temoignages__contenu__article">
            <span class="entete">
              <IconeProfil />
              John Doe 
            </span>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam velit at animi accusantium. blanditiis minima architecto dolor deleniti.</p>
        </article>
        <article class="temoignages__contenu__article">
            <span class="entete">
                <IconeProfil />
                John Doe 
            </span>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam velit at animi accusantium. blanditiis minima architecto dolor deleniti.</p>
        </article>
        <article class="temoignages__contenu__article">
          <span class="entete">
            <IconeProfil />
            John Doe 
          </span>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam velit at animi accusantium. blanditiis minima architecto dolor deleniti.</p>
        </article>
      </div>
    </div>
  </section>
</template>

<style scoped>
.entete {
  display: flex;
  justify-content:flex-start;
  gap: 15px;
}
.temoignages__titre {
  font-family:var(--police-titre);
  display: flex;
  justify-content:center;
  color: var(--couleur-secondaire);
  margin-bottom: 50px;
  margin-top: 0;
}
  .temoignages__contenu {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 25px;
    padding-bottom: 5rem;
  }

  .temoignages__contenu__article{
    border: 1px solid black;
    border-radius: 5px;
    padding: 10px;
  }

  @media only screen and (max-width: 940px) {
    .temoignages__contenu {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      gap: 25px;
      margin-bottom: 50px;
    }
  }

</style>