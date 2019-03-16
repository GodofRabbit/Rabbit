import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const store = new Vuex.Store({
	state: {
		hasLogin: false,//是否登录
		username: "Hi,您未登录",//当前用户名
		userInfo: "", //用户信息
		loading: false,//是否显示正在加载
		loadImage: '../../static/images/common/loading.png',//loading上显示的图片(注意这里路径比较特别)
		loadText: '加载中...'//loading上显示的文字
	},
	mutations: {
		login(state, user) {
			state.username = user.opName;
			state.userInfo = user;
			state.hasLogin = true;
			uni.setStorageSync('hasLogin', 'yes');//因为存在nvue页面，所以才煞费其力
			uni.setStorageSync('opNo', user.opNo);
			uni.setStorageSync('passwordhash', user.passwordhash);
		},
		logout(state) {
			uni.setStorageSync('hasLogin', 'no');
			state.hasLogin = false;
			state.username = "Hi,您未登录";
		},
		showLoading(state,options){
			if(options && options.img){
				state.loadImage = options.img;
			}
			if(options && options.text){
				state.loadText = options.text;
			}
			state.loading = true;
		},
		hideLoading(state){
			state.loading = false;
		}
	},
	actions: {}
})

export default store
