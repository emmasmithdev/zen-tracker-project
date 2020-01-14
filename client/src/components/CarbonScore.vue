<template lang="html">
  <div class="component">

    <div class="footprint">
      <div class="wrapper">
        <div class="sentences>"
      <p v-if="this.footprint.drive_car === true">You drive a car. By driving your car on a regular basis, you are contributing up to 4.6 metric tonnes of CO<sub>2</sub> into the atmosphere.</p>
      <p v-else>You don't own a car. Well done, you are preventing up to 4.6 metric tonnes of CO<sub>2</sub> per year.</p>

      <p v-if="this.footprint.fly_plane === true">You've flown recently. Did you know that aircraft produce around 90kg of CO<sub>2</sub> per hour? </p>
      <p v-else>You haven't flown recently. Aviation contributes up to 2% of the world's greenhouse gases. You are making a difference.</p>

      <p v-if="this.footprint.renewable_energy === true">Your electricity is from renewable sources. By 2050, renewables can reduce carbon emissions by up to 70%. Every little helps. </p>
      <p v-else>Your electricity is from fossil fuels. Fossil fuels are for fools.</p>

      <p v-if="this.footprint.vegan === true">You have a vegan diet. Your carbon footprint from food is up to 73% smaller than that of a meat and dairy consumer.</p>
      <p v-else>You don't have a vegan diet. Research at the University of Oxford has found that a plant based diet could reduce your carbon footprint from food by up to 73%.</p>

      <p v-if="this.footprint.cold_water_wash === true">You wash clothes at low temperatures. Lower temperature cycles reduce your domestic carbon footprint exponentially. Clean and green.</p>
      <p v-else>You wash clothes at hotter temperatures. Your carbon emissions grow exponentially at these settings. How low can you go?</p>

      <p v-if="this.footprint.tumble_dryer === true">You use a tumble dryer. If everyone switched to hang drying their washing, it would save over 1 000 000 tonnes of CO<sub>2</sub> per year.</p>
      <p v-else>You hang-dry your clothes. You are burning more calories, but emitting far fewer CO<sub>2</sub> molecules than a tumble drying wastrel. </p>

      <p v-if="this.footprint.recycle === true">You recycle your household waste. Recycling and composting is cool. You are too.</p>
      <p v-else>You don't recycle. You would be cooler if you recycyled more and composted your food waste. (Recycled aluminium cans use 1/12th of the energy of a newly mined and manufactured one.)</p>

      <p v-if="this.footprint.energy_saving_lightbulbs === true">Your home is lit with energy-efficient lighting. This has reduced your carbon footprint for lighting by up to 75%. </p>
      <p v-else>You have standard lightbulbs. You are using up to six times more energy on lighting than you need to. Not very enlightened habits. </p>
    </div>
    </div>
    <div class="yourscore">
      <p>Your score was {{callCalculator(footprint)}} Thunbergs!</p>
    </div>
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
    width: 80%;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.5);
    padding: 20px;
    margin-bottom: 40px;
  }
button {
  background-color: rgb(102, 128, 127);
  border: 2px solid black;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  cursor: pointer;
  font-size: 15px;
  border-radius: 8px;
  display: block;
  margin-right: auto;
  margin-left: auto;
  text-align: center;
}
.wrapper {
  /* display: flex; */

}
/* .yourscore {
  display: flex;
} */
button {
    background-color: rgb(102, 128, 127);
    border: 2px solid black;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    cursor: pointer;
    font-size: 15px;
    border-radius: 8px;
    display: block;
    margin-right: auto;
    margin-left: auto;
    text-align: center;
  }
  .grid-item {
    padding: 10px;
    margin: 10px;
    text-align: center;
  }




</style>
