<template lang="html">
<div id="app">
  <vue-title title="CO2 & You"></vue-title>
  <h1><img src="https://cdn2.iconfinder.com/data/icons/camping-trekking-1/614/2703_-_Trees-512.png" alt="tree">
    CO<sub>2</sub> & You</h1>
  <carbon-form/>
  <carbon-score :footprint="footprint" :score="score"/>
  <carbon-comparison :score="score" />
  <carbon-history v-if="carbonHistory" :footprints="footprints" :categories="categories" />
</div>
</template>

<script>

  import VueTitle from './components/VueTitle';
  import CarbonForm from './components/CarbonForm';
  import CarbonScore from './components/CarbonScore';
  import CarbonComparison from './components/CarbonComparison';
  import CarbonHistory from './components/CarbonHistory';
  import Chart from './components/Chart.vue';
  import { eventBus } from './main';
  import CarbonService from './services/CarbonService';
  import {calculator} from './helpers/CarbonCalculator';

  export default {
    name: 'app',
    data () {
      return {
        footprints: [],
        carbonHistory: false
      }
  },
  computed: {
    footprint: function(){
      return this.footprints[this.footprints.length -1];
    },
    score: function(){
      return calculator(this.footprint)
    },
    categories: function(){
      return this.footprints.map(footprint => footprint.timestamp);
      }
    },


components: {
    'vue-title': VueTitle,
    'carbon-form': CarbonForm,
    'carbon-score': CarbonScore,
    'carbon-comparison': CarbonComparison,
    'carbon-history': CarbonHistory
  },

  mounted() {
       this.fetchData();

       eventBus.$on('footprint-added', footprint => this.footprints.push(footprint));

       eventBus.$on('footprint-deleted', id => {
         const index = this.footprints.findIndex(footprint => footprint._id === id);
         this.footprints.splice(index, 1);
       })
       eventBus.$on('most-recent-footprint', (footprint) => {
         this.footprint = footprint
       })
       eventBus.$on('show-history', (showHistory) => this.carbonHistory = showHistory);
     },
     methods: {
       fetchData(){
           CarbonService.getFootprints()
           .then(footprints => this.footprints = footprints);
       }
     }

}; //end of export
</script>

<style>

  body {
    background: url('https://posterstore.co.uk/images/zoom/331.jpg') no-repeat;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    font-size: 20px;
  }
  h1 {
    display: block;
    margin-left: auto;
    margin-right: auto;
    text-align: left;
    color: rgb(10, 150, 136);
    font-size: 45px;
    width: 80%;
    margin: 0 auto;
    background: rgb(1, 12, 11, 0.7);
    padding: 20px;
    margin-bottom: 0px;
  }
  img {
    height: 75px;
    width: 75px;
  }
</style>
