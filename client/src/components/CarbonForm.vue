<template lang="html">
  <form id="footprint-form" v-on:submit="handleFootprint">
    <h3>What's your carbon footprint?</h3>
    <div class="formWrap">
      <label for="drive_car">Do You drive a car?</label>
      <input type="radio" name="" value="">
    </div>

  </form>
  drive_car: true,
  fly_plane: false,
  renewable_energy: false,
  vegan: false,
  cold_water_wash: true,
  recycle: true,
  tumble_dryer: false,
  energy_saving_lightbulbs: tru
</template>

<script>
export default {
}
</script>

<style lang="css" scoped>
</style>
