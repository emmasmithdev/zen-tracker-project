<template lang="html">
  <div id="carbon-comparison">
    <p>The average person in the UK produces 10 tonnes of carbon per year.</p>
    <p>The national average score is 2 Thunbergs.</p>
    <p>Your score is {{score}} Thunbergs.</p>
    <button v-on:click="showHistory">Show My Carbon History</button>
  </div>
</template>

<script>
  import { eventBus } from '../main';

  export default {
    name: "carbon-comparison",
    data(){
      return{
        carbonHistory: false
      }
    },
    props: ["score"],
    methods: {
      showHistory(event){
        this.carbonHistory = true;
        eventBus.$emit('show-history', this.carbonHistory)
        this.carbonHistory = false;
      }
    }
    }
</script>

<style lang="css" scoped>
</style>
