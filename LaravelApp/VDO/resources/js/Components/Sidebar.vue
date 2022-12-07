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
        <div class="menu-laterale">


            <nav class="nav">
                <NavLink :href="route('dashboard')" :active="route().current('dashboard')">
                 
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
.aside {
    background-color: var( --couleur-secondaire);
}
.logo {
    align-items: center;
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

.collapse-icon {
    position: absolute;
    bottom: 0;
    padding: 0.75em;
  
    color: rgba(255, 255, 255, 0.7);
  
    transition: 0.2s linear;
  }



@media (max-width: 768px) {
    aside div nav {
        position: fixed;
    }
}
</style>