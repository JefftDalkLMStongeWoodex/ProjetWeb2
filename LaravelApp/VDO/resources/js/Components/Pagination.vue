<script>
import { Link } from '@inertiajs/inertia-vue3'
export default {
  components: {
    Link,
  },
  props: {
    paginer: Object, 
  },
}



</script>
<template>
  
    <div class="pagination">  
    <div v-if="paginer.data.length > 0">
        <div class="">

            <Link
           
            v-for="pagination in paginer.links"
            :href="pagination.url"
            v-html="pagination.label"
            
            /> 
         

        </div>
    </div>
</div>
</template>
<style scoped>
.pagination{

margin: 2rem ;
padding: 2rem;
}
.pagination a{
padding: 0rem 0.4rem;
    }

</style>

