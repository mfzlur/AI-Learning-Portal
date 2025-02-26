
import { createApp } from 'vue'
import { createPinia } from 'pinia'
import axios from 'axios'


import App from './App.vue'
import router from './router'

const app = createApp(App)


// global configuration for axios
app.config.globalProperties.$axios = axios

//default base url configuration for axios
axios.defaults.baseURL='http://127.0.0.1:5000'


app.use(createPinia())
app.use(router)
app.config.globalProperties.window = window
app.mount('#app')