import { defineComponent, h, onMounted, watch, ref } from 'vue'
import { Chart, registerables } from 'chart.js'

Chart.register(...registerables)

const chartProps = {
  type: {
    type: String,
    required: true
  },
  data: {
    type: Object,
    required: true
  },
  options: {
    type: Object,
    default: () => ({})
  },
  id: {
    type: String,
    required: true
  }
}

const ChartComponent = defineComponent({
  name: 'ChartComponent',
  props: chartProps,
  setup(props) {
    const canvasRef = ref(null)
    let chart = null

    onMounted(() => {
      const ctx = canvasRef.value?.getContext('2d')
      if (ctx) {
        chart = new Chart(ctx, {
          type: props.type,
          data: props.data,
          options: props.options
        })
      } else {
        console.error(`Canvas element with id ${props.id} not found`)
      }
    })

    watch(() => props.data, (newData) => {
      if (chart) {
        chart.data = newData
        chart.update()
      }
    }, { deep: true })

    return () => h('canvas', { ref: canvasRef })
  }
})

export const LineChart = defineComponent({
  name: 'LineChart',
  extends: ChartComponent,
  props: chartProps,
  setup(props) {
    return () => h(ChartComponent, { ...props, type: 'line', id: 'line-chart' })
  }
})

export const BarChart = defineComponent({
  name: 'BarChart',
  extends: ChartComponent,
  props: chartProps,
  setup(props) {
    return () => h(ChartComponent, { ...props, type: 'bar', id: 'bar-chart' })
  }
})
