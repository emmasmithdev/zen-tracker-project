<template lang="html">
<div id="app">
  <vue-title title="CO2 & You"></vue-title>
  <h1>CO<sub>2</sub> & You</h1>
  <carbon-form/>
  <carbon-score :footprints="footprints" :score="score"/>
  <carbon-comparison :score="score" />
  <carbon-history v-if="carbonHistory=true" :footprints="footprints" />
</div>
</template>

<script>
  import VueTitle from './components/VueTitle';
  import CarbonForm from './components/CarbonForm';
  import CarbonScore from './components/CarbonScore';
  import CarbonComparison from './components/CarbonComparison';
  import CarbonHistory from './components/CarbonHistory';
  import { eventBus } from './main';
  import CarbonService from './services/CarbonService';
  import {calculator} from './helpers/CarbonCalculator';
  import Chart from './components/Chart.vue'

  export default {
    name: 'app',
    data () {
      return {
        footprints: [],
      }
  },
  computed: {
    footprint: function(){
      return this.footprints[this.footprints.length -1];
    },
    score: function(){
      return calculator(this.footprint)
}
},


components: {
    'vue-title': VueTitle,
    'carbon-form': CarbonForm,
    'carbon-score': CarbonScore,
    'carbon-comparison': CarbonComparison,
    'carbon-history': CarbonHistory,
    'chart': Chart
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
  }

  h1 {
    display: block;
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    color: rgb(0, 0, 0, 0.7);
    font-size: 45px;
  }
</style>
