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
      points: [10, 0, 8, 2, 6, 4, 5, 5],
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
          text: 'Your Carbon History'
        },
        xAxis: {
          categories: ["date", "date", "date", "date", "date", "date", "date", "date"]
        },
        yAxis: {
          min: 0,
          title: {
            text: "Score in Thunbergs"
          }
        },
        series: [{
          data: [10, 0, 8, 2, 6, 4, 5, 5],
          color: '#6fcd98'
        }]
      }
    }
  },
  created () {
    let i = document.createElement('input')
    i.setAttribute('type', 'color');
    (i.type === 'color') ? this.colorInputIsSupported = true : this.colorInputIsSupported = false
  },
  watch: {
    title (newValue) {
      this.chartOptions.title.text = newValue
    },
    points (newValue) {
      this.chartOptions.series[0].data = newValue
    },
    chartType (newValue) {
      this.chartOptions.chart.type = newValue.toLowerCase()
    },
    seriesColor (newValue) {
      this.chartOptions.series[0].color = newValue.toLowerCase()
    },
    animationDuration (newValue) {
      this.updateArgs[2].duration = Number(newValue)
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
