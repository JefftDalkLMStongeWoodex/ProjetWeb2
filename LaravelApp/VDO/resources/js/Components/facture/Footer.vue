<script setup>
// import Logo_PW2_v1 from 'assets/Logo_PW2_v1';

</script>

<template>
  <section class="wrapper">
    <div class="piedDePage">
      <ul class="piedDePage__droite">
        <li><strong>Avant taxes</strong>13000$</li>
        <li>TPS-5%</li>
        <li>TVQ-9.975%</li>
        <li>prix total</li>
      </ul>
    </div>

    <div class="piedDePage__gauche">
      <h5>Notes</h5>
      <p class="">Un dépot de 40% est requis pour l'avancement du projet.</p>
    </div>
  </section>

</template>

<style scoped>
.piedDePage {
  display: flex;
  flex-direction: row-reverse;
  justify-content: space-between;
  align-items: center;
  margin-top: 1rem;
}
.piedDePage__droite {
  padding-right: 1rem;
}

</style>