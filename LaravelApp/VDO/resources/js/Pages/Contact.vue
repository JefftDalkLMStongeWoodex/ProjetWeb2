<script setup>
import { Head } from '@inertiajs/inertia-vue3';
import AppLayout from '@/Layouts/AppLayout.vue';

defineProps({
  canLogin: Boolean,
  canRegister: Boolean,
  langAppLayout: Object,
  langContact: Object,
});
</script>

<template>
  <AppLayout :lang="langAppLayout">
    <Head title="Contact" />
    <section>
      <h1 class="section__titre">{{langContact.contact}}</h1>
      <div class="section__wrapper">
      <!-- Left contact page --> 
        <form class="form-horizontal">
          <div class="form-horizontal__item">
              <input 
              type="text" 
              class="form-horizontal__item__control" 
              :placeholder="langContact.nom" 
              name="name" 
              required>
          </div>
          <div class="form-horizontal__item">
              <input 
              type="email" 
              class="form-horizontal__item__control" 
              :placeholder="langContact.courriel" 
              name="email"  
              required>
          </div>

          <textarea 
            class="form-horizontal__item__control"
            rows="10" 
            :placeholder="langContact.message" 
            name="message"
          >
          </textarea>

          <button 
            class="btn btn-primary send-button" 
            id="submit" 
            type="submit" 
            value="SEND">
            <div class="alt-send-button">
              <i class="fa fa-paper-plane"></i>
              <span class="send-text">{{langContact.envoi}}</span>
            </div>
          </button>
        </form>
  <!-- Left contact page --> 
        <div class="contact">
          <ul class="contact__list">
            <li class="contact__list__item">
              <i class="fa fa-map-marker fa-2x"></i>
                Montreal, Quebec
            </li>
            <li class="contact__list__item">
              <i class="fa fa-phone fa-2x"></i>
                (514)254-7131
            </li>
            <li class="contact__list__item">
              <i class="fa fa-envelope fa-2x"></i>
                info@vdoInc.com
            </li>
          </ul>
          <hr>
          <div class="copyright">
            &copy;{{langContact.droit}}
          </div>
        </div>
      </div>
    </section>

    <section class="section">
      <div class="section__heures">
        <h1>{{langContact.heures}}</h1>
        <table class="section__heures__table">
          <tr>
            <td>{{langContact.lundi}}</td>
            <td>09:00-13:00, 14:00-18:00</td>
          </tr>
          <tr>
            <td>{{langContact.mardi}}</td>
            <td>09:00-13:00, 14:00-18:00</td>
          </tr>
          <tr>
            <td>{{langContact.mercredi}}</td>
            <td>09:00-13:00, 14:00-18:00</td>
          </tr>
          <tr>
            <td>{{langContact.jeudi}}</td>
            <td>09:00-12:00, 13:00-18:55</td>
          </tr>
          <tr>
            <td>{{langContact.vendredi}}</td>
            <td>09:00-20:00</td>
          </tr>
          <tr>
            <td>{{langContact.samedi}}</td>
            <td>09:00-17:00</td>
          </tr>
          <tr>
            <td>{{langContact.dimanche}}</td>
            <td>09:00-14:00</td>
          </tr>
        </table>
      </div>
    </section>

    <section>
            <!--map-->
            <div style="width: 100%"><iframe scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=Coll%C3%A8ge%20de%20Maisonneuve,%203800%20Sherbrooke%20St%20E,%20Montreal,%20Quebec%20H1X%202A2+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="100%" height="600" frameborder="0"><a href="https://www.maps.ie/distance-area-calculator.html">distance maps</a></iframe></div>
    </section>
  </AppLayout>
</template>

<style scoped>

.section {
  display: flex;
  justify-content: center;
  margin-bottom: 5rem;
}
.section__titre {
  text-align: center;
  margin: 0 auto;
  padding: 40px 0;
  color: var(--couleur-secondaire);
  text-transform: uppercase;
  letter-spacing: 10px;
}

.section__wrapper {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin: 0 auto;
  padding: 10px;
  position: relative;
  max-width: 820px;
}

/* Left contact page */
.form-horizontal {
  float: left;
  max-width: 200px;
}

.form-horizontal__item {
  padding-bottom:10px;
}

.call {
  display: flex;
  justify-content: center;
  gap: 50px;
}

.form-horizontal__item__control {
  width: 25rem; 
  background-color: var(--couleur-secondaire);
  color: var(--couleur-blanc);
  letter-spacing: 1px;
}

.send-button {
  margin-top: 15px;
  height: 34px;
  width: 400px;
  overflow: hidden;
  transition: all .2s ease-in-out;
}

.alt-send-button {
  width: 400px;
  height: 34px;
  transition: all .2s ease-in-out;
}

.send-text {
  display: block;
  margin-top: 10px;
  letter-spacing: 2px;
}

.alt-send-button:hover {
  transform: translate3d(0px, -29px, 0px);
}

/* Right Contact Page */
.direct-contact-container {
  max-width: 400px;
}

/* Location, Phone, Email Section */
.contact__list {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

/*Open hours */
.section__heures h1 {
  font-size: 20px;
  margin: 0;
  padding: 30px;
  background: var(--couleur-secondaire);
  color:var(--couleur-blanc);
  text-align: center;
}

.section__heures {
  /* display: inline-block; */
  border-radius: 10px;
  box-shadow: 0 0 100px 0 rgba(0, 0, 0, 0.2),
    30px 30px 50px 0 rgba(0, 0, 0, 0.06);
  transition: boxShadow 0.6s;
  position: relative;
  background: var(--couleur-blanc);
  overflow: hidden;
  width: 42%;
}

.section__heures__table tr td {
  padding: 0.2rem;
}

.section__heures__table  {
  display: flex;
  flex-wrap:wrap;
  justify-content:center;
}



@media screen and (max-width: 850px) {
  .section__wrapper, .form-horizontal {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .contact {
    margin-top: 2rem;
    margin-bottom: 2rem;
  }    
}

@media screen and (max-width: 569px) {

  .section__wrapper, .form-horizontal {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .form-horizontal__item__control {
    width: 20rem;
  } 
  
     .contact {
    margin-top: 60px;
  }  
}

@media screen and (max-width: 410px) {
  .send-button {
    width: 99%;
  }
}

</style>
   