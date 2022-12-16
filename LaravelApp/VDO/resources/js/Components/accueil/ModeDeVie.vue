<script setup>
  defineProps({
    lang: Object,
  });

</script>

<template>
  <section>
    <div class="modeDeVie">
      <h3 class="titre">{{lang.accueil_modeDeVie}}</h3>
      <div class="modeDeVie__options">
          <div class="modeDeVie__famille">
            <div class="img-wrapper">
              <img src="../../../assets/famille.jpg" alt="">
              <div class="img-wrapper__contenu fade">{{lang.accueil_famille}}</div>
            </div>
          </div>

          <div class="modeDeVie__horsRoute">
            <div class="img-wrapper">
              <img src="../../../assets/horsRoute.jpg" alt="">
              <div class="img-wrapper__contenu fade">{{lang.accueil_horsRoute}}</div>
            </div>
          </div>

          <div class="modeDeVie__ecolo">
            <div class="img-wrapper">
              <img src="../../../assets/ecolo.jpg">
              <div class="img-wrapper__contenu fade">{{lang.accueil_ecolo}}</div>
            </div>
          </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.modeDeVie__options {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 25px;
}

.titre {
  font-family:var(--police-titre);
  display: flex;
  justify-content:center;
  color: var(--couleur-secondaire);
  margin-bottom: 50px;
  margin-top: 0;
}

img {
  width: 100%;
}
.img-wrapper > img {
  display: block;
  object-fit: cover;
  object-position: center;
}

.img-wrapper {
  position: relative;
  overflow: hidden;
}

.img-wrapper > .img-wrapper__contenu {
  position: absolute; 
  inset: 0;
  /* padding: 1rem; */
  background: rgba(225, 255, 255, .4);
  display: flex;
  justify-content: center;
  align-items: center;
}
.img-wrapper > img,
.img-wrapper > .img-wrapper__contenu {
  transition: 200ms ease-in-out;
}

.img-wrapper > .img-wrapper__contenu.fade  {
  opacity: 0;
}

.img-wrapper:hover > .img-wrapper__contenu.fade  {
  opacity: 1;
  cursor: pointer;
}

.img-wrapper__contenu {
  font-family: 'Lato', sans-serif;
  font-weight: 400;
  line-height: 1.3;
  font-size: 2.369rem;
  color: var(--couleur-blanc)
}

</style>