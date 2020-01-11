<template lang="html">
  <div id="carbon-comparison">
    <p>The average person in the UK produces 10 tonnes of carbon per year.</p>
    <p>The national average score is 2 Thunbergs.</p>
    <p>Your score is {{score}} Thunbergs.</p>

  </div>
</template>

<script>
  import { eventBus } from '../main';

  export default {
    name: "carbon-comparison",
    props: ["score"]
    }
</script>

<style lang="css" scoped>
</style>
