<script setup>
import LogoVersion1 from '@/Components/LogoVersion1.vue';
</script>

<template>
  <section class="wrapper">
    <div class="entete">
        <ul class="entete__droite">
          <li><h2>FACTURE</h2></li>
          <li><strong>VDO inc.</strong></li>
          <li>3800 R. Sherbrooke E,
            Montréal, QC H1X 2A2
          </li>
          <li>(514)254-7131</li>
        </ul>
      <div class="entete__gauche">
        <LogoVersion1 class="logo2" />
      </div>
    </div>
  </section>
  <hr>
</template>

<style scoped>
.entete {
  display: flex;
  flex-direction: row;
  align-items: center;
  gap: 25rem; 
  margin-bottom: 1rem;
}

.logo2 {
  min-height: 5vh;
  min-width: 10vw;
  margin-bottom: 8rem;
}

</style>
