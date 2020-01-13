<template lang="html">
  <div class="component">

    <div class="footprint">
      <p v-if="this.footprint.drive_car === true">You drive a car</p>
      <p v-else>You don't own a car<p>

      <p v-if="this.footprint.fly_plane === true">You've flown recently</p>
      <p v-else>You haven't flown recently</p>

      <p v-if="this.footprint.renewable_energy === true">Your electricity is from renewable sources</p>
      <p v-else>Your electricity is from fossil fuels</p>

      <p v-if="this.footprint.vegan === true">You have a vegan diet</p>
      <p v-else>You don't have a vegan diet</p>

      <p v-if="this.footprint.cold_water_wash === true">You wash clothes at low temperatures</p>
      <p v-else>You wash clothes at hotter temperatures</p>

      <p v-if="this.footprint.recycle === true">You recycle your household waste</p>
      <p v-else>You don't recycle</p>

      <p v-if="this.footprint.tumble_dryer === true">You use a tumble dryer</p>
      <p v-else>You hang-dry your clothes</p>

      <p v-if="this.footprint.energy_saving_lightbulbs === true">Your home is lit with energy-efficient lighting</p>
      <p v-else>You have standard lightbulbs</p>

      <p>Your score was {{callCalculator(footprint)}} Thunbergs!</p>

      <p>This carbon footprint is from {{footprint.timestamp}}</p>


      <button v-on:click="deleteFootprint(footprint._id)">Delete this Footprint</button>

    </div>

  </div>
</template>

<script>
import { eventBus } from '../main.js';
import moment from 'moment';
import CarbonService from '@/services/CarbonService.js';
import {calculator} from '../helpers/CarbonCalculator.js';

export default {
  name: "carbon-footprint",
  props: ['footprint'],
  // data() {
  //   return {
  //     carbonScore: 0
  //   }
  // },
  filters: {
    format(value){
			return new Date(value).toLocaleString().substring(0, 10);
    }},

  methods: {
    deleteFootprint(id) {
      CarbonService.deleteFootprint(id)
      .then(() => eventBus.$emit('footprint-deleted', id)
    )},
    callCalculator(footprint) {
      return calculator(footprint);
    }

  }
} //End of export
</script>

<style lang="css" scoped>
.component {
  width: 75%;
  margin: 0 auto;
  background: rgba(255, 255, 255, 0.5);
  padding: 20px;
  margin-bottom: 40px;
}
</style>
