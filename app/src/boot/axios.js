import { boot } from 'quasar/wrappers'
import axios from 'axios'

axios.defaults.headers.post['Content-Type'] = "application/json";
axios.defaults.headers.get['Accept'] = 'application/json';
axios.defaults.baseURL = `http://localhost:4000/api`;
axios.defaults.timeout = 60000;

const api = axios;

export default boot(({ app, store, router, ssrContext }) => {
  app.axios = axios;
  store.$axios = axios;
  router.$axios = axios;
  // for use inside Vue files (Options API) through this.$axios and this.$api

  app.config.globalProperties.$axios = axios
  // ^ ^ ^ this will allow you to use this.$axios (for Vue Options API form)
  //       so you won't necessarily have to import axios in each vue file

  app.config.globalProperties.$api = api
  // ^ ^ ^ this will allow you to use this.$api (for Vue Options API form)
  //       so you can easily perform requests against your app's API
})

export {api, axios}


