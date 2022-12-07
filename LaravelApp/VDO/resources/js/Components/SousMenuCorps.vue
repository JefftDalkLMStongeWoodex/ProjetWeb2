<script>
  export default {
    name: 'SousMenuCorps',
    inject: ['sharedState'],
    computed: {
      active () {
        return this.sharedState.active
      }
    }
  }
</script>

<template>
  <div 
    v-if="active"
    class="origin-top-right absolute right-0 mt-2 w-48 bg-white rounded-lg border py-2"
  >
    <slot/>
  </div>
</template>

<style>

</style>

