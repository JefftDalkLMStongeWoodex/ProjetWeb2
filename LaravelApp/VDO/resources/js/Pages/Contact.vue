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
    <Head title="Contact" />
    <section class="">
      <h1 class="section__titre">Contact</h1>
  
  <div class="contact-wrapper">
  <!-- Left contact page --> 
    <form id="contact-form" class="form-horizontal" role="form">
      <div class="form-group">
        <div class="form-group__input">
          <input type="text" class="form-control" id="name" placeholder="NAME" name="name" value="" required>
        </div>
      </div>

      <div class="form-group">
        <div class="form-group__input">
          <input type="email" class="form-control" id="email" placeholder="EMAIL" name="email" value="" required>
        </div>
      </div>

      <textarea class="form-control" rows="10" placeholder="MESSAGE" name="message" required></textarea>
      
      <button class="btn btn-primary send-button" id="submit" type="submit" value="SEND">
        <div class="alt-send-button">
          <i class="fa fa-paper-plane"></i><span class="send-text">SEND</span>
        </div>
      
      </button>
      
    </form>
    
  <!-- Left contact page --> 
    
      <div class="direct-contact-container">

        <ul class="contact-list">
          <li class="list-item"><i class="fa fa-map-marker fa-2x"><span class="contact-text place">City, State</span></i></li>
          
          <li class="list-item"><i class="fa fa-phone fa-2x"><span class="contact-text phone"><a href="tel:1-212-555-5555" title="Give me a call">(212) 555-2368</a></span></i></li>
          
          <li class="list-item"><i class="fa fa-envelope fa-2x"><span class="contact-text gmail"><a href="mailto:#" title="Send me an email">hitmeup@gmail.com</a></span></i></li>
          
        </ul>

        <hr>
        <div class="copyright">&copy; ALL OF THE RIGHTS RESERVED</div>
      </div>
    
  </div>

      <!--map-->
      <div style="width: 100%"><iframe scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=Coll%C3%A8ge%20de%20Maisonneuve,%203800%20Sherbrooke%20St%20E,%20Montreal,%20Quebec%20H1X%202A2+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="100%" height="600" frameborder="0"><a href="https://www.maps.ie/distance-area-calculator.html">distance maps</a></iframe></div>


      
      
    </section>
  </AppLayout>
</template>
<style scoped>
.section__titre {
  text-align: center;
  margin: 0 auto;
  padding: 40px 0;
  color: var(--couleur-secondaire);
  text-transform: uppercase;
  letter-spacing: 6px;
}

.contact-wrapper {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  margin: 0 auto;
  padding: 20px;
  position: relative;
  max-width: 840px;
}

/* Left contact page */
.form-horizontal {
  /*float: left;*/
  /* max-width: 400px; */
}

.form-group__input {
  display: flex;
}

.form-control, 
textarea {
  max-width: 600px;
  background-color: var(--couleur-secondaire);
  /* color: var(--couleur-blanc); */
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
  font: 700 12px 'Lato', sans-serif;
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
.contact-list {
  margin-left: -30px;
  padding-right: 20px;
}

.list-item {
  line-height: 4;
  color:black;
}

.contact-text {
  letter-spacing: 1.9px;
  color: var(--couleur-secondaire);
}

.place {
  margin-left: 62px;
}

.phone {
  margin-left: 56px;
}

.gmail {
  margin-left: 53px;
}

.contact-text a {
  color: var(--couleur-secondaire);
  transition-duration: 0.2s;
}

.contact-text a:hover {
  color: var(--couleur-secondaire);
  text-decoration: none;
}

/* @media screen and (max-width: 850px) {
  .contact-wrapper {
    display: flex;
    flex-direction: column;
  }
  .direct-contact-container, .form-horizontal {
    margin: 0 auto;
  }  
  
  .direct-contact-container {
    margin-top: 60px;
    max-width: 300px;
  }    
}

@media screen and (max-width: 569px) {
  .direct-contact-container, .form-wrapper {
    float: none;
    margin: 0 auto;
  }  
  .form-control, textarea {
    
    margin: 0 auto;
  }
 
  
  .name, .email, textarea {
    width: 280px;
  } 
  
  .direct-contact-container {
    margin-top: 60px;
    max-width: 280px;
  }  
 
}

@media screen and (max-width: 410px) {
  .send-button {
    width: 99%;
  }
} */

</style>
   