<script setup>
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import imgVoiture1 from '/resources/assets/kiaForte2015.jpg';

defineProps({
    voiture: Object,
    langVoiture: Object,
    langDashboard: Object
})

</script>
<template>
<div class="pannier_achat wrapper">

     <div class="pannier__entete">

        <h2> Pannier Achat  </h2>
     </div>
   
    <div class="pannier__conteneur">

        <table>
                   <!-- col Titre table  -->
                <tr>
                
                    <th>Produit</th>
                    <th>Quantite </th>
                    <th>Sous-total</th>
                </tr>
               <tbody>
                    <!-- col Table -->
                    <tr>
                        <td>   
                                <div class="pannier_info">
                            
                                    <img :src="imgVoiture1" alt="voiture">
                                        <div>
                                            <p> nom du produit </p> 
                                            <small> prix: $50.00</small> 
                                            <br>
                                                <a href="">Effacer</a>
                                        </div>
                                </div>
                        </td>
                        <td> <input type="number" value="1"> </td>
                        <td> <p>  $50.00</p></td>
                    </tr>


            </tbody> 
        </table>

    </div>
</div>

</template>
<style scoped>

.pannier_achat{
    background-color: var(--couleur-secondaire);
    min-height: 100%;    
    padding-bottom: 2rem;
}
.pannier__entete {
    display: flex;
    

}

.pannier__entete  h2{
    margin: 3rem auto ;
    color: var(--couleur-principale);

}
.pannier__conteneur{

    margin:  auto;
}


.pannier__conteneur tr:nth-of-type(even){

    background-color: rgba(236, 140, 43, 0.288);
}

.pannier__conteneur table{

    width: 100%;
    border-collapse: collapse;
   
}

.pannier__conteneur th{

   text-align: left;
   padding: 10px 5px;
   color: #fff;
   background-color: var(--couleur-principale);
   
}


.pannier__conteneur td input{

  width: 2.5rem;
  height: 1.875rem;
  padding: 0.3rem;
    
 }
 
 .pannier__conteneur td a{
 color: red ;
 font-size: large;
}

.pannier__conteneur td p{
    color: white;
   
   }
   .pannier__conteneur td small{
    color: white;
   
   }



.pannier_info{
    display: flex ;

}


/* Css contenu table  */
.pannier_info img{
    width: 15%;
}

.pannier_info img{
    margin-top: 0;
    margin-right: 0.62rem ;
}



</style>