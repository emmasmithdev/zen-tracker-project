<template>
  <div class="chartElem">
    <div class="row">
      <highcharts class="chart" :options="chartOptions" :updateArgs="updateArgs"></highcharts>
      </div>
    </div>
  </div>

</template>

<script>
import {transportData} from '../helpers/TransportData';
import {homeData} from '../helpers/HomeData';
import {dietData} from '../helpers/DietData';
export default {
  name: "chart",
  props: ["footprints", "categories"],
  data () {
    return {
      title: '',
      chartType: 'column',
      seriesColor: '#6fcd98',
      colorInputIsSupported: null,
      animationDuration: 1000,
      updateArgs: [true, true, {duration: 1000}],
      chartOptions: {
        chart: {
          type: 'column'
        },
        title: {
          text: 'Carbon Saved'
        },
        xAxis: {
          categories: this.categories,
          title: {
            text: "Date"
          }
        },
        yAxis: {
          min: 0,
          title: {
            text: "Score in Thunbergs"
          }
        },
        plotOptions: {
       column: {
           stacking: 'normal',
           dataLabels: {
               enabled: false
           }
       }
   },
        series: [{
          name: "Transport",
          data: transportData(this.footprints),
          color: '#6fcd98'
        },
        {
          name: "Home",
          data: homeData(this.footprints)
        },
      {
        name: "Diet",
        data: dietData(this.footprints)
      }]
      }
    }
  }
}
</script>

<style scoped>

</style>
