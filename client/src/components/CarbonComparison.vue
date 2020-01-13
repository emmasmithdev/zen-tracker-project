<template lang="html">
  <div class="component" id="carbon-comparison">
    <h2>How do you compare to the national average?</h2>
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
        carbonHistory: null
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
  .component {
    width: 75%;
    margin: 0 auto;
    background: rgba(255, 255, 255, 0.5);
    padding: 20px;
    margin-bottom: 40px;
  }
</style>
