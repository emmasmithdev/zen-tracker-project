<template lang="html">
  <form id="carbon-form" name="CarbonForm" v-on:submit="handleFootprint">
    <h2>What's your carbon footprint?</h2>
    <div class="footprint" >
      <div class="grid-item">
      <label for="drive_car">Do you drive a car?</label>
      <img src="https://cdn3.iconfinder.com/data/icons/basic-regular-2/64/349-512.png" alt="car logo">
      <br>
        <label for="drive_car_yes">Yes</label>
        <input type="radio" id="drive_car_yes" name="drive_car" v-model="drive_car" v-bind:value="true">
        <label for="drive_car_no">No</label>
        <input type="radio" id="drive_car_no" name="drive_car" v-model="drive_car" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="fly_plane">Have you flown in the past year?</label>
      <img src="https://cdn4.iconfinder.com/data/icons/unigrid-vehicles/61/001_plane_takeoff_-512.png" alt="plane logo">
      <br>
        <label for="fly_plane_yes">Yes</label>
        <input type="radio" id="fly_plane_yes" name="fly_plane" v-model="fly_plane" v-bind:value="true">
        <label for="fly_plane_no">No</label>
        <input type="radio" id="fly_plane_no" name="fly_plane" v-model="fly_plane" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="renewable_energy">Is your home heated with renewable energy?</label>
      <img src="https://cdn0.iconfinder.com/data/icons/household-part-2/100/Artboard_74-512.png" alt="radiator logo">
      <br>
        <label for="renewable_energy_yes">Yes</label>
        <input type="radio" id="renewable_energy_yes" name="renewable_energy" v-model="renewable_energy" v-bind:value="true">
        <label for="renewable_energy_no">No</label>
        <input type="radio" id="renewable_energy_no" name="renewable_energy" v-model="renewable_energy" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="vegan">Do you have a vegan diet?</label>
      <img src="https://cdn2.iconfinder.com/data/icons/barbecue-and-grill-5/85/vegetables_tomato_pepper_vegan-512.png" alt="vegan logo">
      <br>
        <label for="vegan_yes">Yes</label>
        <input type="radio" id="vegan_yes" name="vegan" v-model="vegan" v-bind:value="true">
        <label for="vegan_no">No</label>
        <input type="radio" id="vegan_no" name="vegan" v-model="vegan" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="cold_water_wash">Do you run your washing machine at 30?</label>
      <img src="https://cdn1.iconfinder.com/data/icons/hotel-and-camping-50-linear-icons/30/hotel_and_camping_tumble_dryer_dark_icon-256.png" alt="washing machine logo">
      <br>
        <label for="cold_water_wash_yes">Yes</label>
        <input type="radio" id="cold_water_wash_yes" name="cold_water_wash" v-model="cold_water_wash" v-bind:value="true">
        <label for="cold_water_wash_no">No</label>
        <input type="radio" id="cold_water_wash_no" name="cold_water_wash" v-model="cold_water_wash" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="recycle">Do you recycle your household waste whenever possible?</label>
      <img src="https://cdn1.iconfinder.com/data/icons/ecology-green-environment-glyph-icons/40/Untitled-3_copy-512.png" alt="recycle logo">
      <br>
        <label for="recycle_yes">Yes</label>
        <input type="radio" id="recycle_yes" name="recycle" v-model="recycle" v-bind:value="true">
        <label for="recycle_no">No</label>
        <input type="radio" id="recycle_no" name="recycle" v-model="recycle" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="tumble_dryer">Do you tumble-dry your clothes?</label>
      <br><br>
      <img src="https://cdn3.iconfinder.com/data/icons/laundry-45/512/dryer-tumble-electric-device-furniture-512.png" alt="dryer logo">
      <br>
        <label for="tumble_dryer_yes">Yes</label>
        <input type="radio" id="tumble_dryer_yes" name="tumble_dryer" v-model="tumble_dryer" v-bind:value="true">
        <label for="tumble_dryer_no">No</label>
        <input type="radio" id="tumble_dryer_no" name="tumble_dryer" v-model="tumble_dryer" v-bind:value="false">
      </div>
      <div class="grid-item">
      <label for="energy_saving_lightbulbs">Do you use LED lightbulbs throughout your home?</label>
      <img src="https://cdn3.iconfinder.com/data/icons/block/32/lightbulb_compact-512.png" alt="lightbulb logo">
      <br>
        <label for="energy_saving_lightbulbs_yes">Yes</label>
        <input type="radio" id="energy_saving_lightbulbs_yes" name="energy_saving_lightbulbs" v-model="energy_saving_lightbulbs" v-bind:value="true">
        <label for="energy_saving_lightbulbs_no">No</label>
        <input type="radio" id="energy_saving_lightbulbs_no" name="energy_saving_lightbulbs" v-model="energy_saving_lightbulbs" v-bind:value="false">
      </div>

    </div>
    <input class ="submit" type="submit" value="Save Footprint Data" id="save">
  </form>

</template>

<script>
import {eventBus} from '../main.js';
import moment from 'moment';
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
      energy_saving_lightbulbs: '',
      timestamp: ''
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
      energy_saving_lightbulbs: this.energy_saving_lightbulbs,
      timestamp: moment().format('MMMM Do YYYY, h:mm:ss a')
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
  form {
  width: 75%;
  margin: 0 auto;
  background: rgba(255, 255, 255, 0.5);
  padding: 20px;
  margin-bottom: 40px;
  }
  label {
  min-width: 100px;
  display: inline-block;
  margin-left: 0px;
  margin-right: -35px;
  }
  img {
    width: 100px;
    height: 100px;
    display: block;
    margin-right: auto;
    margin-left: auto;
    text-align: center;
  }
  .footprint {
    display: grid;
    grid-template-columns: auto auto auto auto;
  }
  .grid-item {
    padding: 10px;
    margin: 10px;
    text-align: center;
  }
  .submit {
    display: block;
    margin-right: auto;
    margin-left: auto;
    text-align: center;
  }
  input[type="radio"] {
  margin-right: 0;
  margin-left: 0;
}

</style>
