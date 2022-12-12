<script setup>
import { ref, computed } from 'vue'
import SecondaryButton from '@/Components/SecondaryButton.vue';
import DangerButton from '@/Components/DangerButton.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import SidebarVue from '@/Components/Sidebar.vue';
import imgVoiture1 from '/resources/assets/kiaForte2015.jpg';
import taxes from '@/Components/Taxes.vue';

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
                                        <div class="produit_info">
                                            <p> nom du produit </p> 
                                            <small> prix:{{voiture.prix_paye}}$</small> 
                                            <br>
                                                <a href="">Effacer</a>
                                        </div>
                                </div>
                        </td>
                        <td> <input type="number" value="1"> </td>
                        <td> <p> {{voiture.prix_paye}}$</p></td>
                    </tr>


            </tbody> 
        </table>

    </div>

    <div class="pannier__entete"></div>


    <div class="prix_total"> 
            <table>
                <tr>
                    <td>Sous-total</td>
                    <td>$200</td>
                </tr>
                <tr>
                    <td>Taxe</td>
                    <td>     <taxes :prix="voiture.prix_paye" /> </td>
              
                </tr>
                <tr>
                    <td>Total</td>
                    <td>$315</td>
                </tr>
            </table>
            <!--   
            <button> Passer à la caisse </button>
            <button> Continuer vos achats  </button>
            -->
    </div>



</div>

</template>
<style scoped>

  .pannier_achat{
    background-color: var(--couleur-secondaire);
    padding-bottom: 100px;
}
.pannier__entete {
    display: flex;
}
.pannier__entete  h2{
    margin: 3rem auto ;
    color: var(--couleur-principale);

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
    padding: 5px 5px;
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

    .produit_info{
        display: none ;
       
        }

    .pannier_info img{
        margin-top: 0;
        margin-right: 0.62rem ;
        width: 45%;
    }


    .prix_total{
       
        display: flex;
        justify-content: flex-end;
        
    }
    
    .prix_total table{
        border-top: 3px solid ;
        border-color: var(--couleur-principale);
        color:  var(--couleur-blanc);
        width: 100%;
        max-width: 450px;
    
            
    }


    .prix_total tbody{
       padding: 25px;
    
            
    }

    
    td:last-child{
      text-align: right;  
    } 
    
    th:last-child{
        text-align: right;  
      } 



    
  @media (min-width: 900px) {
    
    .pannier_achat{
       padding-bottom: 2rem;
       height: 100vh;
    
    }

    .pannier__entete  h2{
        margin: 3rem auto ;
        color: var(--couleur-principale);

    }

    .pannier__conteneur th{
    padding: 10px 5px;
    
    }
    .produit_info{
        display: block ;
       
        }

    .pannier_info img{
        width: 15%;
    }

}




</style>