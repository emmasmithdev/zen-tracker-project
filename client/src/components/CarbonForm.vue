<template lang="html">
  <form id="carbon-form" name="CarbonForm" v-on:submit="handleFootprint">
    <h3>What's your carbon footprint?</h3>
    <div class="footprint" >

      <label for="drive_car">Do You drive a car?</label>
      <radio-button name="drive_car" id="drive_car_yes" label="Yes" value="true" v-model:="drive_car"/>
      <radio-button name="drive_car" id="drive_car_no" label="No" value="false" v-model:="drive_car"/>

    </div>
    <input type="submit" value="save" id="save">
  </form>
  <!-- drive_car: true,
  fly_plane: false,
  renewable_energy: false,
  vegan: false,
  cold_water_wash: true,
  recycle: true,
  tumble_dryer: false,
  energy_saving_lightbulbs: tru -->
</template>

<script>
import {eventBus} from '../main.js';
import CarbonService from '../services/CarbonService'

export default {
  name: "carbon-form",
  data() {
    return {
      drive_car: "",
      fly_plane: ""
      }
  },
  methods: {
    handleFootprint(event){
    event.preventDefault();
    const payload = {
      drive_car: this.drive_car,
      fly_plane: this.fly_plane
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
