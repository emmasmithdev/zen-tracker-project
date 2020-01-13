<template lang="html">
  <div id="carbonFootprint">

    <div class="footprint" v-for="footprint in footprints">
      <p v-if="drive_car === true">You drive a car</p>
      <p v-elsif="drive_car === false">"You don't own a car"<p>
      <p>Your score was {{score}} Thunbergs!</p>
      <button v-on:click="deleteFootprint(footprint._id)">Delete this Footprint</button>
    </div>

  </div>
</template>

<script>
import { eventBus } from '../main.js';
import CarbonService from '@/services/CarbonService.js'
export default {
  name: "carbon-footprint",
  props: ['footprints', 'score'],
  filters: {
    format(value){
			return new Date(value).toLocaleString().substring(0, 10);
    }},

  methods: {
    deleteFootprint(id) {
      CarbonService.deleteFootprint(id)
      .then(() => eventBus.$emit('footprint-deleted', id)
    )}

  }
  }
</script>

<style lang="css" scoped>
</style>
