<script setup>

</script>

<template>
  <section class="wrapper">
    <div class="corps">
      <ul class="corps__droite">
        <li class="corps__droite__liste">
          <strong class="">#Facture: </strong>VDO11</li>
        <li class="corps__droite__liste">
          <strong class="">Date Facture:</strong>VDO119</li>
        <li class="corps__droite__liste">
          <strong class="">Prix:</strong>13000$</li>
        <li class="corps__droite__liste">
          <strong class="">Quantitée:</strong>1</li>
      </ul>

      <ul class="corps__gauche">
        <li><h6>BILL TO</h6></li>
        <li><strong>JefftDalkLMStongeWoodex</strong></li>
        <li>Lukas Dalkiriadis</li>
        <li>514-655-2586</li>
        <li>vdomaisonneuve@gmail.com</li>
        <li><h5>Véhicule</h5>
        <p>COROLLA GR À HAYON</p></li>
      </ul>
    </div>
  </section>
  <hr>
</template>

<style scoped>
.corps {
  display: flex;
  flex-direction: row-reverse;
  justify-content: space-between;
}

.corps__border {
  border: 1px solid gray;
}

.corps__droite {
  display: flex;
  flex-direction: column;
}

@media screen and (max-width: 600px) {
  .corps {
    display: flex;
    flex-direction:column-reverse;
    gap: 8rem; 
  }
 
}
</style>
