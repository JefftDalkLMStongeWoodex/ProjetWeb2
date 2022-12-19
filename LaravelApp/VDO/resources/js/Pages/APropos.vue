<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
  canLogin: Boolean,
  canRegister: Boolean,
  langAppLayout: Object,
});
</script>

<template>
  <AppLayout :lang="langAppLayout">
  <Head title="A propos" />
 
    <div class="banniere">
      <img class="banniere__image" src="../../assets/img1.jpg">
      <h2 
        class="banniere__texte">
        Chez VDO nous sommes là pour vous offrir un service qui fait le kilomètre nécéssaire
      </h2>
    </div>
 
    <section class="wrapper">
      <article class="article pt">
        <div class="article__tuile">
          <img src="../../assets/img5.jpg">
        </div>
        <div class="article__corps">
          <h3 class="article__corps__titre">Le meilleur véhicule</h3>
          <p class="article__corps__sousTitre">UN VASTE CHOIX EN INVENTAIRE</p>
          <p class="article__corps__texte">
            Chez VDO, le respect de nos clients 
            et notre approche humaine de la vente 
            vous offre une expérience de magasinage exceptionnelle. 
            Savourez le moment!
          </p>
          <div class="article__corps__marketing">
            <svg
            class="article__corps__marketing__svg" 
            xmlns="http://www.w3.org/2000/svg" 
            width="60" 
            height="30" 
            viewBox="0 0 27 24">
            <path d="M30,6H6V9H30Zm1.5,15V18L30,10.5H6L4.5,18v3H6v9H21V21h6v9h3V21ZM18,27H9V21h9Z" transform="translate(-4.5 -6)"/></svg>
              <div class="">
                <h4 class="article__corps__titre">Un vaste inventaire</h4>
                <p class="article__corps__texte">
                  Nous transférons la garantie du manufacturier encore applicable.
                </p>
              </div>
            </div>
            <div class="article__corps__marketing">
              <svg
              class="article__corps__marketing__svg"  
              xmlns="http://www.w3.org/2000/svg" 
              width="80" 
              height="32" 
              viewBox="0 0 95 30.652"><path d="M76.586,16.415a7.117,7.117,0,1,1-7.1,7.117,7.111,7.111,0,0,1,7.1-7.117ZM69.977,3.8,69.5,10c1.4-.068,2.741-.136,3.983-.177a1,1,0,0,0,.889-.476,10.329,10.329,0,0,0,.855-1.795c.122-.34.095-.5-.2-.9C74.639,6.11,72.033,4.751,69.977,3.8Zm-1.527,6.254.584-6.682a12.085,12.085,0,0,0-1.391-.544,18.29,18.29,0,0,0-4.906-.8l-5.428-.068a.92.92,0,0,0-.76.36c-.434,1.135-.543,2.685-1.106,7.341-.156,1.285-.068.938,1.343.918,3.481-.041,7.715-.306,11.664-.523ZM87.585,26.679q2.191-.14,4.363-.469a4.809,4.809,0,0,0,2.137-.707c1.045-.972.923-4,.9-5.554,0-.374-.957-.374-.984-.768-.136-2.393-.305-5.044-.563-7.5-.312-2.957-6.358-3.059-10.063-4.235-2.633-.836-4.8-2.631-8.183-4.126C71.463,1.664,68.213.149,64.3.149c-6.365,0-15.83-.761-21.754,1.128C36.872,3.085,31.7,6.348,26.314,8.89A155.5,155.5,0,0,0,5.972,12.561a5.092,5.092,0,0,0-3.725,2.787,33.437,33.437,0,0,0-1.377,3.48c-.522.041-.543-.1-.706.211a3.413,3.413,0,0,0-.115,1.278,12.554,12.554,0,0,0,.231,3.834,3.151,3.151,0,0,0,1.059,1.9,2.44,2.44,0,0,0,1.391.53l2.416.082c1.445-.272,1.174-.455,1.086-2.291-.02-.272-.02-.557-.02-.836a9.235,9.235,0,1,1,18.469,0c0,.517-.014,1.026-.047,1.523-.217,3.1-.5,2.569,2.3,2.705l38.744-.041c2.063-.285,1.947-.027,1.73-2.617-.041-.51-.054-1.04-.054-1.57a9.235,9.235,0,1,1,18.47,0c0,.435-.014.877-.047,1.305-.163,2.121.427,1.951,1.812,1.842ZM36.275,11.317a7.407,7.407,0,0,0,.332-1.611c.068-1.237-2.178-1.326-3.576-1.237A41.765,41.765,0,0,1,43.359,3.051a32.421,32.421,0,0,1,7.084-1.02L53.5,1.964c.556,0,.631.258.475.693-.55,1.461-.767,4.622-1.1,6.75-.156,1.02-.4,1.271-1.445,1.278-4.132.034-15.2.829-15.152.625Zm-20.831,5.1a7.117,7.117,0,1,1-7.1,7.117,7.111,7.111,0,0,1,7.1-7.117Z" transform="translate(-0.003 0.003)" fill="#2f343e" fill-rule="evenodd"/></svg>
              <div class="">
                <h4 class="article__corps__titre">La qualité de nos véhicules</h4>
                <p class="article__corps__texte">Magasinez à l'intérieur de notre entrepôt Accédez facilement à l'intérieur du véhicule et vérifiez son confort.</p>
              </div>
            </div>
        </div>
      </article>
      <article class="article">
        <div class="article__tuile">
          <img 
          src="../../assets/img3.jpg" 
          class="article__image__img">
        </div>
        <div class="article__corps">
          <h3 class="article__corps__titre">Une expérience d'achat agréable</h3>
          <p class="article__corps__sousTitre">
            Des petit bonus pour faciliter le processus</p>
          <p class="article__corps__texte">Chez VDO, nous comprenons que l'achat d'un véhicule n'est pas facile et peut causer du stress. Nous faisons des efforts pour vous simplifier la vie avec nos grandes heures d'ouverture, le rachat de votre ancien véhicule et notre service de réservation en ligne. </p>
            <div class="article__corps__marketing">
              <svg
              class="article__corps__marketing__svg"  
              xmlns="http://www.w3.org/2000/svg" 
              width="40" 
              height="36" 
              viewBox="0 0 31.5 36"><path d="M0,32.625A3.376,3.376,0,0,0,3.375,36h24.75A3.376,3.376,0,0,0,31.5,32.625V13.5H0ZM22.5,18.844A.846.846,0,0,1,23.344,18h2.813a.846.846,0,0,1,.844.844v2.813a.846.846,0,0,1-.844.844H23.344a.846.846,0,0,1-.844-.844Zm0,9A.846.846,0,0,1,23.344,27h2.813a.846.846,0,0,1,.844.844v2.813a.846.846,0,0,1-.844.844H23.344a.846.846,0,0,1-.844-.844Zm-9-9A.846.846,0,0,1,14.344,18h2.813a.846.846,0,0,1,.844.844v2.813a.846.846,0,0,1-.844.844H14.344a.846.846,0,0,1-.844-.844Zm0,9A.846.846,0,0,1,14.344,27h2.813a.846.846,0,0,1,.844.844v2.813a.846.846,0,0,1-.844.844H14.344a.846.846,0,0,1-.844-.844Zm-9-9A.846.846,0,0,1,5.344,18H8.156A.846.846,0,0,1,9,18.844v2.813a.846.846,0,0,1-.844.844H5.344a.846.846,0,0,1-.844-.844Zm0,9A.846.846,0,0,1,5.344,27H8.156A.846.846,0,0,1,9,27.844v2.813a.846.846,0,0,1-.844.844H5.344a.846.846,0,0,1-.844-.844ZM28.125,4.5H24.75V1.125A1.128,1.128,0,0,0,23.625,0h-2.25A1.128,1.128,0,0,0,20.25,1.125V4.5h-9V1.125A1.128,1.128,0,0,0,10.125,0H7.875A1.128,1.128,0,0,0,6.75,1.125V4.5H3.375A3.376,3.376,0,0,0,0,7.875V11.25H31.5V7.875A3.376,3.376,0,0,0,28.125,4.5Z"/></svg>
              <div class="article__corps__infos">
                <h4 class="article__corps__titre">Ouverte 7/7 jusqu'à 21h la semaine</h4>
                <p class="article__corps__texte">Notre concession est ouverte 7 jours sur 7 pour vous assurer la possibilité de magasiner selon votre horaire.</p>
              </div>
            </div>
            <div class="article__corps__marketing">
              <svg
              class="article__corps__marketing__svg"  
              xmlns="http://www.w3.org/2000/svg" 
              width="70" 
              height="30" 
              viewBox="0 0 15.27 27"><path d="M17.7,16.35c-3.4-.885-4.5-1.8-4.5-3.225,0-1.635,1.515-2.775,4.05-2.775,2.67,0,3.66,1.275,3.75,3.15h3.315A5.979,5.979,0,0,0,19.5,7.785V4.5H15V7.74c-2.91.63-5.25,2.52-5.25,5.415,0,3.465,2.865,5.19,7.05,6.2,3.75.9,4.5,2.22,4.5,3.615,0,1.035-.735,2.685-4.05,2.685-3.09,0-4.305-1.38-4.47-3.15H9.48c.18,3.285,2.64,5.13,5.52,5.745V31.5h4.5V28.275c2.925-.555,5.25-2.25,5.25-5.325C24.75,18.69,21.1,17.235,17.7,16.35Z" transform="translate(-9.48 -4.5)"/></svg>
              <div class="">
                <h4 class="article__corps__titre">Rachat de votre véhicule</h4>
                <p class="article__corps__texte">On rachète votre auto sans obligation et au juste prix, sans passer à la SAAQ. L'évaluation de votre véhicule prend environ 30 minutes et est tout à fait gratuite.
                </p>
              </div>
            </div>
        </div>
      </article>
    </section>
  </AppLayout>
</template>


<style scoped>
.banniere {
  display: flex;
  flex-direction: column;
  position: relative;
  align-items: center;
}

.banniere__texte {
  font-family: var(--police-titre);
  position: absolute;
  top: 30%;
  left: 35%;
  padding: 10rem 8rem 0 2rem;
  margin-top: 0;
  transform: translate(-50%, -50%);
}

.banniere__image {
  object-fit: cover;
}

.banniere__texte {
  color: white;
}

img {
  width: 100%;
}

.article {  display: grid;
  grid-template-columns: 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr;
  grid-template-rows: 1fr 1fr;
  gap: 5rem;
  grid-auto-flow: row;
  grid-template-areas:
    "article__tuile article__tuile article__tuile article__tuile article__tuile article__tuile article__corps article__corps article__corps article__corps article__corps article__corps"
    "article__tuile article__tuile article__tuile article__tuile article__tuile article__tuile article__corps article__corps article__corps article__corps article__corps article__corps"
}

.article {
  padding-bottom: 10rem;
}
.article__tuile { grid-area: article__tuile;}
.article__corps { grid-area: article__corps;}

.article__corps__marketing__svg {
  margin: auto
}

.article__corps__titre  {
  margin-bottom: 0;
}

.article__corps__texte {
  padding-bottom: 1rem;
}

.pt {
  padding-top: 5rem;
}

.article__image__img {
  object-fit: cover;
  height: 35rem;
  
}

.article__corps__marketing {
  display: flex;
  flex-direction: row;
  gap: 5rem;
}

.article__corps__titre {
  color:  var(--couleur-secondaire);
  margin-top: 0;
} 

.article__corps__sousTitre {
  color:  var(--couleur-principale);
  text-transform: uppercase;
}

.article__corps__texte {
  color:  var(--couleur-secondaire-leger);
} 


.article__corps {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 1.96rem;
}

@media only screen and (max-width: 1024px) {
  .banniere__texte {
    font-family: var(--police-titre);
    font-size: 1.1rem;
    position: absolute;
    top: 20%;
    left: 35%;
    padding: 8rem 8rem 0 2rem;
  }
  .article {
    display: flex;
    flex-direction: column;
    padding: 5rem;
  }
}
  @media only screen and (max-width: 1500px) {
    .article {
      padding: 5rem;
    }
  }

</style>


