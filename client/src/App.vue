<template lang="html">
<div id="app">
  <h1>CO2 and You!</h1>
  <carbon-form/>
  <carbon-score/>
  <carbon-comparison
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
      footprint: []
    }
  },

  components: {
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
      this.footprints.splice(index,1);
    })
  }

}
</script>

<style lang="css" scoped>
</style>
