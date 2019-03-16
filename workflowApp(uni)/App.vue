<script>
	import { mapMutations } from 'vuex';
	import _config from '@/http/config.js';//更新时获取请求头
	export default {
		onLaunch() {
			this.$showLoading();
			//应用启动时获取当前网络状态
			let networkType = true;
			uni.getNetworkType({
				success: (res)=> {
					if(res.networkType=='none'){
						this.$hideLoading();
						networkType = false;
						uni.showToast({
							title: '当前无可用网络',
							image: '/static/images/error/nonet.png'
						})
					}
				}
			})
			uni.setStorageSync('hasLogin','no');
			//自动登录
			let autologin = uni.getStorageSync('autologin');
			let opNo = uni.getStorageSync('opNo');
			let passwordhash = uni.getStorageSync('passwordhash');
			if(networkType && autologin && opNo!="" && passwordhash!=""){
				this.$http.login({opNo,passwordhash}).then((res)=>{
					if(res.data.flag){
						this.loginfo(res.data.user);
						let clientId = plus.push.getClientInfo().clientid;
						this.$http.saveClientId({opNo,clientId});//存储clientId
					}else {
						uni.showToast({
							title: res.data.msg,
							image: '../../static/images/common/data_error.png'
						})
					}
				}).catch((res)=>{
					this.$hideLoading();
					uni.showToast({
						title: '自动登录失败',
						image: '../../static/images/common/data_error.png'
					})
				})
			}
			//应用启动检查更新
			if(networkType){
				let sys = uni.getSystemInfoSync().platform;
				let deviceType = '';
				if(sys=='android'){//安卓系统
					deviceType = 'Android';
				}else { //ios系统
					deviceType = 'IOS';
				}
				plus.runtime.getProperty(plus.runtime.appid, (inf)=> { 
					let backVersion = inf.version;
					this.$http.checkUpdate({backVersion,deviceType}).then((res)=>{
						if(res.data.flag){
							uni.showModal({
								title: '软件升级',
								content: '发现新版本，确认是否更新？',
								confirmText: '立即更新',
								cancelText: '暂不更新',
								cancelColor: '#808080',
								success: function (e) {
									if (e.confirm) {
										plus.runtime.openURL(_config.url + res.data.downloadurl);
									}
								}
							});
						}
					})
				})
			}
		},
		onShow() {
			//监听网络状态改变
			uni.onNetworkStatusChange(function (res) {
				if(!res.isConnected){
					uni.navigateTo({
						url: '/pages/error/error'
					})
				}
			})
			//监听点击推送事件 (安卓点击通知栏的推送消息触发；iOS当应用不在线时点击推送消息触发)
			plus.push.addEventListener("click", function( msg ) {
				msg.payload.genre=0;//0代表未审批
				uni.navigateTo({
					url:'pages/process/approvalDetail?profile='+msg.payload
				})
			}, false );
			/**
			 * 监听推送消息接收
			 * 安卓发送透传数据且格式为非标准格式且应用在活动触发；
			 * iOS在线：只能响应receive，但消息中心无消息
			 * iOS不在线：消息中心有消息，且响应click事件
			 */
			 plus.push.addEventListener("receive", function(msg) {
			 	if(plus.os.name == "iOS") {
			 		uni.showModal({title: msg.title,content: msg.content,confirmText:'立即查看',cancelText:'知道了',
			 			success:res=>{
			 				if (res.confirm) {
			 					msg.payload.genre=0;//0代表未审批
			 					uni.navigateTo({
			 						url:'pages/process/approvalDetail?profile='+msg.payload
			 					})
			 				}
			 			}
			 		})
			 	};
			 }, false );
		},
		methods:{
			...mapMutations({
				loginfo: 'login'
			})
		}
	}
</script>

<style>
	@import "./static/graceUI/graceUI.css";
	@import "./static/css/uni.css";
	@import "./static/css/simplepro.css";
	
	page {
		background-color: #efeff4;
		height: 100%;
	}
</style>
