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
      <div class="box">
        <div class="text">
        <h1>Contact <span class="red">Us</span></h1>
        <hr class="redline">
        <p>Have Questions ? We have answers ( may be )</p>
        </div>
      </div>

      <div class="wrapper">
        <div class="touch">
        <h2>Get in touch</h2>
        <hr class="redline">
      </div>
  
      <form action="" method="POST" name="contact-form">
      <div class="container form-margin">
        <div class="row">
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>     <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="form-group">
        <input type="text" class="form-control" placeholder="First Name" ng-model="firstname" name="firstname" required>    
          </div>
        <div class="form-group">
        <input type="text" class="form-control" placeholder="Company Name" ng-model="company" name="company" required>    
          </div>
        <div class="form-group">
        <input type="text" class="form-control" placeholder="Phone" ng-model="phone" name="firstname" required>    
          </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4">
          <div class="form-group">
        <input type="text" class="form-control" placeholder="Last Name" ng-model="lastname" name="lastname" required>    
          </div>
          <div class="form-group">
        <input type="email" class="form-control" placeholder="E-mail" ng-model="email" name="email" required>    
          </div>
          <div class="form-group">
        <input type="text" class="form-control" placeholder="Course" ng-model="course" name="course" required>    
          </div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
        </div>
      </div>
      
      <div class="container">
        <div class="row">
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
        <div class="col-lg-8 col-md-8 col-sm-8">
          <div class="form-group">
        <textarea class="form-control" rows="6" placeholder="Message" ng-model="message" name="message" required></textarea>
      </div>  
          <div class="pager">
          <button type="submit" class="btn btn-success">SEND MESSAGE</button>
          </div>
          </div>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
      
      </div>
      </form>
    <!--address-->

  <div class="container address">
    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
    <div class="col-lg-4 col-md-4 col-sm-4">
      <h3>Our Address</h3>
      <div class="redline-address"></div>
      <p>3800 Sherbrooke St E</p>
      <p>Montreal,</p>
      <p>Quebec</p>
      <p>H1X 2A2</p>
      <div class="phone-e">
      <p><span class="glyphicon glyphicon-envelope"> </span> info@vdoInc  /.com</p>
      <p><span class="glyphicon glyphicon-phone"></span> +91-97427 66186</p>
      </div>
    </div>
    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
      <!--map-->
      <div style="width: 100%"><iframe scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=Coll%C3%A8ge%20de%20Maisonneuve,%203800%20Sherbrooke%20St%20E,%20Montreal,%20Quebec%20H1X%202A2+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="100%" height="600" frameborder="0"><a href="https://www.maps.ie/distance-area-calculator.html">distance maps</a></iframe></div>

    </div>
    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>

  </div>
  
  <div class="bottom-gap"></div>
      </div>
      
      
    </section>
  </AppLayout>
</template>
<style scoped>
.box{
  background: url("../../assets/img8.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  padding-bottom: 500px;
  color: white;
  text-align:center;
  z-index:1;
}
.text{
    padding: 100px 0;
}
.box p{
  font-size:18px;
}
.red{
  color:var(--couleur-principale);
}
.redline{
  width:100px;
  height:3px;
  background-color:var(--couleur-principale);
  border:none;
}
.touch h2{
  padding-top: 20px;
  text-align: center;
}
.form-margin{
  margin-top: 40px;
}
.left{
  text-align:left;
}
h3{
  font-variant:bold;
}
.redline-address{
  border:none;
  height:3px;
  background-color:var(--couleur-principale);
  width:140px;
  margin-bottom:20px;
}
.address{
  padding-top: 50px;
}
.address p{
  font-weight:bold;
  color: #676565;
  margin:3px;
}
.phone-e{
  padding:15px 0;
}
.logo img{
  height:50px;
  width:150px;
  z-index:2;
  float:left;
  margin-top:10px;
}
.bottom-gap{
  margin-bottom:100px;
}
/*validation css*/
input.ng-valid {
  background-color:#dff0d8;
}
input.ng-invalid {
    background-color:#f2dede;
}
input.ng-pristine{
  background-color:white;
}
textarea.ng-invalid {
    background-color:#f2dede;
}
textarea.ng-pristine{
  background-color:white;
}
textarea.ng-valid {
  background-color:#dff0d8;
}
</style>
   