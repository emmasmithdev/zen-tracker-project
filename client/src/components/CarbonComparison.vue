<template lang="html">
  <div class="component" id="carbon-comparison">
    <h2>How do you compare to the national average?</h2>
    <p>The average person in the UK produces 10 tonnes of carbon per year.</p>
    <div class="average">
    <p>The national average score is 2 Thunbergs.</p>
    <img src="https://i.imgflip.com/3bc19x.png" alt="angry greta">
    <img src="https://i.imgflip.com/3bc19x.png" alt="angry greta">
    </div>
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
        this.carbonHistory = !this.carbonHistory;
        eventBus.$emit('show-history', this.carbonHistory)
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
  img {
    height: 50px;
    width: 50px;
  }
  .average {
    display: flex;
  }
</style>
