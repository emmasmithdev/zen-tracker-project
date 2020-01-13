<template lang="html">
  <div class="component" id="carbon-history">
    <h2>Your carbon history</h2>
    <chart/>
  </div>
</template>

<script>
import { eventBus } from '../main';
export default {
  name: "carbon-history",
  props: ["footprints"]
}
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
