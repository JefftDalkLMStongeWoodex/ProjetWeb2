<script setup>
import { computed } from 'vue';
import { Link } from '@inertiajs/inertia-vue3';
import NavLink from '@/Components/NavLink.vue';
import LogoVersion2 from '@/Components/LogoVersion2.vue';
import { collapsed, toggleSidebar, sidebarWidth } from './state'; 

const props = defineProps(['href', 'active', 'lang']);
</script>

<template>
    <aside class="aside" :style="{ width: sidebarWidth }">
   
        <div class="logo">
            <Link :href="route('accueil')">
                <LogoVersion2 />
            </Link>
        </div>
        <div class="menu_laterale">

            <input class="gachette" type="checkbox">

            <nav class="nav header__conteneur ">
                <NavLink :href="route('dashboard')" :active="route().current('dashboard') ">
                 
                    <!--  Menu ferme  -->
                    <span v-if="collapsed"> <i class="fa fa-home" /> </span>
                    <!--  Menu ouvert -->
                     <span v-else>   <i class="fa fa-home" />   {{lang.titre}}  </span>


                </NavLink>
             
                <NavLink :href="route('voiture.index')" >
                    <!--  Menu ferme  -->
                    <span v-if="collapsed">  <i class="fa fa-car" />  </span>
                    <!--  Menu ouvert -->
                     <span v-else>      <i class="fa fa-car" />    {{lang.voiture}}    </span>
                </NavLink>

                <NavLink :href="route('profile.edit')">
                     <!--  Menu ferme  -->
                     <span v-if="collapsed"> <i class="fa fa-user" />   </span>
                     <!--  Menu ouvert -->
                      <span v-else>  <i class="fa fa-user" />  Profile </span>
                   
                </NavLink>

                <NavLink :href="route('facturation')">
                     <!--  Menu ferme  -->
                     <span v-if="collapsed"> <i class="fa-solid fa-file-invoice"></i>   </span>
                     <!--  Menu ouvert -->
                      <span v-else>  <i class="fa-solid fa-file-invoice"></i> {{lang.factures}} </span>
                   
                </NavLink>
          

                <NavLink :href="route('logout')" method="post" as="button">
                    <!--  Menu ferme  -->
                    <span v-if="collapsed"> <i class="fa fa-plug" /> </span>
                    <!--  Menu ouvert -->
                     <span v-else><i class="fa fa-plug" /> {{lang.logout}} </span>
               </NavLink>

               <NavLink class="header__lang  " :href="route('lang', 'en')">EN</NavLink>
               <NavLink class="header__lang  " :href="route('lang', 'fr')">FR</NavLink>


                <span
                class="collapse-icon"
                :class="{ 'rotate-180': collapsed }"
                @click="toggleSidebar"
              >
                <i class="fas fa-angle-double-left" />
              </span>




            </nav>
        </div>
    </aside>
</template>

<style scoped>


    
aside div nav {
    display: flex;
    flex-direction: column;
    text-align: center;
    width:100%;
    padding: 15px;
    line-height: 2.2rem;

}


.gachette {
    all: unset;
    appearance: none;
    -moz-appearance: none;
    position: absolute;
    top: 20px;
    right: 20px;
    z-index: 1;
    cursor: pointer;
}


.header__conteneur {
    display: flex;
    flex-direction: column;
    position: fixed;
    overflow: auto;
    background-color: var(--couleur-secondaire);
}
.gachette::before {
    content: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='27' height='18' viewBox='0 0 27 18'%3E%3Cpath fill='white' d='M4.5,27h27V24H4.5Zm0-7.5h27v-3H4.5ZM4.5,9v3h27V9Z' transform='translate(-4.5 -9)'/%3E%3C/svg%3E");
    text-transform: uppercase;
    font-weight: 700;
    width: 100%;
    height: 100%;
}

input.gachette:not(:checked) ~ .header__conteneur {
    opacity: 0;
    pointer-events: none;
}
.collapse-icon{
    display: none;

}
@media (min-width: 900px) {
   
    .aside {
        background-color: var( --couleur-secondaire);
    }
    .logo {
        align-items: center;
    }
    input.gachette:not(:checked) ~ .header__conteneur {
        opacity: 100%;
        pointer-events: auto;
    }
  
    .gachette {
        display: none;
    }

    .collapse-icon{
        display:flex ;
    
    }

    aside div nav {
        display: flex;
        flex-direction: column;
        color: white;
        font-size: 18px;
        padding: 0rem 4rem 2rem;
        overflow: hidden;
        min-height: 100vh;
        transition: 0.2s ease-out;
        width: calc(2rem+32px);
    
    }

    .header__conteneur {
        
        position: static;
     
    }
    
    .collapse-icon {
        position: absolute;
        bottom: 0;
        padding: 0.75em;
      
        color: rgba(255, 255, 255, 0.7);
      
        transition: 0.2s linear;
      }
    
      .menu__aside {
        background-color: var( --couleur-secondaire);
        align-items: center;
        line-height: 2.5rem;
        box-sizing: border-box;
        border-width: 0;
        border-style: solid;
        border-color: #e5e7eb;
       text-align: left;
       
    }
    
    
    .menu__aside:hover
    {
        color: var( --couleur-principale);
        border-bottom: #e5e7eb , 4px ;
        width: 100%;
    }
    
    
}



</style>