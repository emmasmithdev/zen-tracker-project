<template lang="html">
  <div class="component" id="carbon-comparison">
    <h2>How do you compare to the national average?</h2>
    <p>The average person in the UK produces 10 tonnes of carbon per year.</p>
    <div class="average">
    <p>The national average score is 2 Thunbergs.</p>
    <img src="https://i.imgflip.com/3bc19x.png" alt="angry greta">
    <img src="https://i.imgflip.com/3bc19x.png" alt="angry greta">
    </div>
    <br>
    <div class="your-score">
    <p>Your score is {{score}} Thunbergs.</p>
    <img v-for="image in this.score" src="https://www.biography.com/.image/t_share/MTY4MDk3MDc5NjQ0NjYxMDA5/greta-thunberg-looks-on-during-a-meeting-in-the-garden-of-the-hotel-de-lassay-ahead-of-a-visit-of-the-french-national-assembly-in-paris-photo-credit-should-read-lionel-bonaventureafp-via-getty-imagesj.jpg" alt="happy greta">
    </div>
    <br>
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
    width: 80%;
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
  .your-score {
    display: flex;
  }
  button {
    background-color: rgb(102, 128, 127);
    border: 2px solid black;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    cursor: pointer;
    font-size: 15px;
    border-radius: 8px;
    display: block;
    margin-right: auto;
    margin-left: auto;
    text-align: center;
  }
</style>
