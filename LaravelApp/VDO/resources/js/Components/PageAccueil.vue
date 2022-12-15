<script setup>

</script>

<template>
  <header class="entete">
    <div class="entete__title">
      <h2 class="titre">Trouver votre prochaine voiture d'occasion</h2>
      <div class="entete__recherche">
        <input type="search" class="entete__recherche__input">
        <button class="entete__recherche__btn">RECHERCHER UNE VOITURE</button>
      </div>
    </div>
  </header>
  <section>
    <div class="modeDeVie">
      <h2 class="modeDeVie__titre">Magasinez par mode de vie</h2>
      <div class="modeDeVie__options">
          <div class="">
            <h3>Famille</h3>
          </div>
          <div>
            <h3>Hors route</h3>
          </div>
          <div>
            <h3>Ecolo</h3>
          </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.entete {
  background-image: url("../../assets/acceuil-img.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
}
.entete {
  color: var(--couleur-blanc);
  padding-bottom: 600px;
  padding-top: 100px;
  padding-right: 250px;
}

.titre {
  font-family:var(--police-titre);
  padding-right: 50%;
}

.modeDeVie__titre {
  font-family:var(--police-titre);
  margin-top: 10px;
}

.entete__title {
  padding-left: 5em;
}

.entete__recherche {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  /* gap: 50px; */
}

.entete__recherche__input {
  width: 43%;
  height: 30px;
  border: 2px solid var(--couleur-principale);
  background: none;
  
}

.entete__recherche__btn {
  border: 1px solid var(--couleur-principale);
  background-color: var(--couleur-principale);
  padding: 10px 40px;
  font-weight: 700;
  margin-top: 5%;
}

.modeDeVie__titre {
 text-align: center;
}

.modeDeVie__options {
  display: flex;
  justify-content: center;
  align-items:center;
  gap: 25px;;
}
</style>