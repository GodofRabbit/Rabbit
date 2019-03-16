import Vue from 'vue'
import App from './App'
import store from './store'
import Http from './http'  //请求拦截器
import myloading from './components/simple-pro/dialog-loading' //自定义loading

//全局注册组件
Vue.component('myloading',myloading)

function showLoading(options){
	store.commit('showLoading',options);
}
function hideLoading(){
	store.commit('hideLoading');
}

Vue.config.productionTip = false
// 绑定到 Vue 的实例上
Vue.prototype.$store = store
Vue.prototype.$http = Http
Vue.prototype.$showLoading = showLoading
Vue.prototype.$hideLoading = hideLoading

App.mpType = 'app'

const app = new Vue({
	store,
    ...App
})
app.$mount()
