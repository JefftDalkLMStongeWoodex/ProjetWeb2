<script>
  export default {
  name: 'OptionsFiltreProps',
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
    v-if="active" class=""
  >
    <slot/>
  </div>
</template>

<style>

</style>

