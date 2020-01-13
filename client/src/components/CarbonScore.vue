<template lang="html">
  <div id="carbonFootprint">

    <div class="footprint" v-for="footprint in footprints">
      <p v-if="footprint.drive_car === true">You drive a car</p>
      <p v-else>You don't own a car<p>

      <p v-if="footprint.fly_plane === true">You've flown recently</p>
      <p v-else>You haven't flown recently</p>

      <p v-if="footprint.renewable_energy === true">Your electricity is from renewable sources</p>
      <p v-else>Your electricity is from fossil fuels</p>

      <p v-if="footprint.vegan === true">You have a vegan diet</p>
      <p v-else>You don't have a vegan diet</p>

      <p v-if="footprint.cold_water_wash === true">You wash clothes at low temperatures</p>
      <p v-else>You wash clothes at hotter temperatures</p>

      <p v-if="footprint.recycle === true">You recycle your household waste</p>
      <p v-else>You don't recycle</p>

      <p v-if="footprint.tumble_dryer === true">You use a tumble dryer</p>
      <p v-else>You hang-dry your clothes</p>

      <p v-if="footprint.energy_saving_lightbulbs === true">Your home is lit with energy-efficient lighting</p>
      <p v-else>You have standard lightbulbs</p>

      <p>Your score was {{footprint.carbonScore}} Thunbergs!</p>
      <button v-on:click="deleteFootprint(footprint._id)">Delete this Footprint</button>

    </div>

  </div>
</template>

<script>
import { eventBus } from '../main.js';
import CarbonService from '@/services/CarbonService.js';
import {calculator} from '../helpers/CarbonCalculator.js';

export default {
  name: "carbon-footprint",
  props: ['footprints'],
  data() {
    return {
      carbonScore: 0
    }
  },
  filters: {
    format(value){
			return new Date(value).toLocaleString().substring(0, 10);
    }},

  methods: {
    deleteFootprint(id) {
      CarbonService.deleteFootprint(id)
      .then(() => eventBus.$emit('footprint-deleted', id)
    )},
  },
  mounted(){
        footprint.carbonScore = calculator(footprint);
    }
} //End of export
</script>


<style lang="css" scoped>
</style>
