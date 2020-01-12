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
      </br>

      <label for="fly_plane">Have you flown in the past year?</label>
      </br>
        <label for="fly_plane_yes">Yes</label>
        <input type="radio" id="fly_plane_yes" name="fly_plane" v-model="fly_plane" v-bind:value="true">
        <label for="fly_plane_no">No</label>
        <input type="radio" id="fly_plane_no" name="fly_plane" v-model="fly_plane" v-bind:value="false">
      </br>

      <label for="renewable_energy">Is your home heated with renewable energy?</label>
      </br>
        <label for="renewable_energy_yes">Yes</label>
        <input type="radio" id="renewable_energy_yes" name="renewable_energy" v-model="renewable_energy" v-bind:value="true">
        <label for="renewable_energy_no">No</label>
        <input type="radio" id="renewable_energy_no" name="renewable_energy" v-model="renewable_energy" v-bind:value="false">
      </br>

      <label for="vegan">Do you have a vegan diet?</label>
      </br>
        <label for="vegan_yes">Yes</label>
        <input type="radio" id="vegan_yes" name="vegan" v-model="vegan" v-bind:value="true">
        <label for="vegan_no">No</label>
        <input type="radio" id="vegan_no" name="vegan" v-model="vegan" v-bind:value="false">
      </br>

      <label for="cold_water_wash">Do you run your washing machine at 30?</label>
      </br>
        <label for="cold_water_wash_yes">Yes</label>
        <input type="radio" id="cold_water_wash_yes" name="cold_water_wash" v-model="cold_water_wash" v-bind:value="true">
        <label for="cold_water_wash_no">No</label>
        <input type="radio" id="cold_water_wash_no" name="cold_water_wash" v-model="cold_water_wash" v-bind:value="false">
      </br>

      <label for="recycle">Do you recycle your household waste whenever possible?</label>
      </br>
        <label for="recycle_yes">Yes</label>
        <input type="radio" id="recycle_yes" name="recycle" v-model="recycle" v-bind:value="true">
        <label for="recycle_no">No</label>
        <input type="radio" id="recycle_no" name="recycle" v-model="recycle" v-bind:value="false">
      </br>

      <label for="tumble_dryer">Do you tumble-dry your clothes?</label>
      </br>
        <label for="tumble_dryer_yes">Yes</label>
        <input type="radio" id="tumble_dryer_yes" name="tumble_dryer" v-model="tumble_dryer" v-bind:value="true">
        <label for="tumble_dryer_no">No</label>
        <input type="radio" id="tumble_dryer_no" name="tumble_dryer" v-model="tumble_dryer" v-bind:value="false">
      </br>

      <label for="energy_saving_lightbulbs">Do you use LED lightbulbs throughout your home?</label>
      </br>
        <label for="energy_saving_lightbulbs_yes">Yes</label>
        <input type="radio" id="energy_saving_lightbulbs_yes" name="energy_saving_lightbulbs" v-model="energy_saving_lightbulbs" v-bind:value="true">
        <label for="energy_saving_lightbulbs_no">No</label>
        <input type="radio" id="energy_saving_lightbulbs_no" name="energy_saving_lightbulbs" v-model="energy_saving_lightbulbs" v-bind:value="false">
      </br>

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
      renewable_energy: '',
      vegan: '',
      cold_water_wash: '',
      recycle: '',
      tumble_dryer: '',
      energy_saving_lightbulbs: ''
    }
  },
  methods: {
    handleFootprint(event){
    event.preventDefault();
    const payload = {
      drive_car: this.drive_car,
      fly_plane: this.fly_plane,
      renewable_energy: this.renewable_energy,
      vegan: this.vegan,
      cold_water_wash: this.cold_water_wash,
      recycle: this.recycle,
      tumble_dryer: this.tumble_dryer,
      energy_saving_lightbulbs: this.energy_saving_lightbulbs
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
