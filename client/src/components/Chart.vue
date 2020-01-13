<template>
  <div class="chartElem">
    <div class="row">
      <highcharts class="chart" :options="chartOptions" :updateArgs="updateArgs"></highcharts>
      </div>
    </div>
  </div>

</template>

<script>
export default {
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
          categories: ["date", "date", "date", "date", "date", "date", "date", "date"],
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
          data: [0, 0, 0, 2.4, 2.4, 2.4, 4, 4],
          color: '#6fcd98'
        },
        {
          name: "Home",
          data: [0, 0.3125, 0.3125, 1.8125, 1.8125, 2.2125, 2.257, 2.257]
        },
      {
        name: "Diet",
        data: [0, 0, 0, 0, 0, 0, 0.8, 0.8]
      }]
      }
    }
  }
}
</script>

<style scoped>
input[type="color"]::-webkit-color-swatch-wrapper {
  padding: 0;
}
#colorPicker {
  border: 0;
  padding: 0;
  margin: 0;
  width: 30px;
  height: 30px;
}
.numberInput {
  width: 30px;
}
</style>
