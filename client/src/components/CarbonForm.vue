<template lang="html">
  <form id="carbon-form" name="CarbonForm" v-on:submit="handleFootprint">
    <h3>What's your carbon footprint?</h3>
    <div class="footprint" >

      <label for="drive_car">Do You drive a car?</label>
      </br>
      <label for="drive_car_yes">Yes</label>
      <input type="radio" id="drive_car_yes" name="drive_car" v-model="drive_car" v-bind:value="true">
      <label for="drive_car_no">No</label>
      <input type="radio" id="drive_car_no" name="drive_car" v-model="drive_car" v-bind:value="false">


    </div>
    <input type="submit" value="Save Footprint Data" id="save">
  </form>

</template>

<script>
import {eventBus} from '../main.js';
import CarbonService from '../services/CarbonService'

export default {
  name: "carbon-form",
  data() {
    return {
      drive_car: '',
      fly_plane: '',
      }
  },
  methods: {
    handleFootprint(event){
    event.preventDefault();
    const payload = {
      drive_car: this.drive_car,
      fly_plane: this.fly_plane,
      };

      CarbonService.postFootprint(payload)
      .then(footprint => {
        eventBus.$emit("footprint-added", footprint);
      });
    }
  }
}
</script>

<style lang="css" scoped>

</style>
