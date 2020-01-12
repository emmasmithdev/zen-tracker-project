<template lang="html">
<div id="app">

  <vue-title title="CO2 and You"></vue-title>
  <h1>CO2 and You</h1>
  <carbon-form/>
  <carbon-score :footprints="footprints" :score="score"/>
  <carbon-comparison :score="score" />
  <carbon-history :footprints="footprints" />
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

  export default {
    name: 'app',
    data () {
      return {
        footprints: []
      }
  },
  computed: {
    footprint: function(){
      return this.footprints[this.footprints.length -1];
    },
    score: function(){
      let score = 0.0
      if (this.footprint.drive_car === false){
        score += 2.4;
      }
      if (this.footprint.fly_plane === false){
        score += 1.6;
      }
      if (this.footprint.renewable_energy === true){
        score += 1.5;
      }
      if (this.footprint.vegan === true){
        score += 0.8;
      }
      if (this.footprint.cold_water_wash === true){
        score += 0.247;
      }
      if (this.footprint.recycle === true){
        score += 0.2125;
      }
      if (this.footprint.tumble_dryer === false){
        score += 0.21;
      }
      if (this.footprint.energy_saving_lightbulbs === true){
        score += 0.1;
      }
      return Math.floor(score)
    }
  },
  components: {
    'vue-title': VueTitle,

  <h1>CO2 and You!</h1>
  <carbon-form />
  <carbon-score />
  <carbon-comparison  />
  <carbon-history :footprints="footprints"/>
</div>

</template>

<script>
import CarbonForm from './components/CarbonForm';
import CarbonScore from './components/CarbonScore';
import CarbonComparison from './components/CarbonComparison';
import CarbonHistory from './components/CarbonHistory';
import { eventBus } from './services/CarbonService';

export default {
  name: 'app',
  data () {
    return {
      footprints: []
    }
  },

  components: {
>>>>>>> acae5521fa1fbd4a7e63bbe150c1985a290109fe
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
    },
    methods: {
      fetchData(){
          CarbonService.getFootprints()
          .then(footprints => this.footprints = footprints);
      }
    }
=======
  mounted() {
    this.fetchData();

    eventBus.$on('footprint-added', footprint => this.footprints.push(footprint));

    eventBus.$on('footprint-deleted', id => {
      const index = this.footprints.findIndex(footprint => footprint._id === id);
      this.footprints.splice(index,1);
    })
  },
  methods: {
    fetchData() {
      CarbonService.getFootprints()
      .then(footprints => this.footprints = footprints);
    }
  }

>>>>>>> acae5521fa1fbd4a7e63bbe150c1985a290109fe
}
</script>

<style>
  html {
    height: 100%;
  }
  body {
    background: url('https://posterstore.co.uk/images/zoom/331.jpg') no-repeat;
    height: 100%;
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
