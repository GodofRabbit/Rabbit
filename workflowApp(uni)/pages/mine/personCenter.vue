<template>
	<view>
		<view class="title">个人中心</view>
		<image class="person-bg" src="../../static/images/common/bj_mine.png"></image>
		<view class="logo" hover-class="img-hover" @tap="enter">
			<image class="logo-img" src="../../static/images/common/user-logo.png"></image>
			<view class="logo-title">
				<text class="uer-name">{{ username }}</text>
			</view>
		</view>
		<view class="set">
			<navigator :url="setUrl" hover-class="none">
				<image src="../../static/images/common/icon_set.png"></image>
			</navigator>
		</view>
		<!-- 卡片视图 -->
		<view class="uni-card">
			<view class="uni-card-content">
				<view class="uni-card-content-inner">
					<navigator class="grace-list" v-for="(item,index) in menulist" :key="index" :url="item.url" hover-class="uni-list-cell-hover">
						<image :src="item.img" class="grace-list-imgs-l" mode="widthFix"></image>
						<text class="grace-list-text">{{ item.text }}</text>
						<text class="uni-list-cell-navigate uni-navigate-right drag"></text>
					</navigator>
					<!-- 更新不跳转页面，单独写出来 -->
					<view class="grace-list" hover-class="uni-list-cell-hover" @tap="checkUpdate">
						<image src="../../static/images/common/icon_loop.png" class="grace-list-imgs-l" mode="widthFix"></image>
						<text class="grace-list-text">检查更新</text>
						<view class="version">版本号：{{ version }}</view>
						<text class="uni-list-cell-navigate uni-navigate-right drag"></text>
					</view>
				</view>
			</view>
		</view>
		<button type="primary" class="exit-btn" :class="[to=='前往'?'to-btn':'']" hover-class="img-hover" @tap="exit">{{ to }}登录</button>
		<myloading></myloading>
		<!-- 自定义alert框 -->
		<simpleModal ref="simpleModal">
			<view class="bg-img">
				<image src="../../static/images/common/update_new.jpeg" style="height: 200px;" class="is-response"></image>
			</view>
		</simpleModal>
	</view>
</template>

<script>
	import simpleModal from '@/components/simple-pro/customModal.vue';
	import _config from '@/http/config.js';//更新时获取请求头
	import { mapState,mapMutations } from 'vuex';
	export default {
		components: {
			simpleModal
		},
		data() {
			return {
				to: '退出',
				version: '',//当前版本号
				setUrl:'./setting',
				menulist: [
					{
						text: "个人资料",
						img: "../../static/images/common/icon_data.png",
						url: "./userInfo"
					},
					{
						text: "密码修改",
						img: "../../static/images/common/icon_code.png",
						url: "./passwordChange"
					}
				]
			}
		},
		computed:{
			...mapState(['hasLogin','username'])
		},
		onShow() {
			//获取当前版本号
			plus.runtime.getProperty(plus.runtime.appid, (inf)=> { 
				this.version = inf.version;
			})
			//判断后重置列表的url
			if(this.hasLogin){
				this.to = '退出';
				this.setUrl = './setting';
				let urls = ['./userInfo','./passwordChange'];
				this.menulist.forEach((item,index)=>{
					item.url = urls[index]
				})	
			}else {
				this.to = '前往';
				this.setUrl = './login';
				this.menulist.forEach(item=>{
					item.url = './login'
				})
			}
		},
		methods:{
			enter(){
				if(!this.hasLogin){
					uni.navigateTo({
						url:'./login'
					})
				}
			},
			exit(){
				if(this.hasLogin){
					this.$showLoading({text:'正在退出'});
					this.logout();
					setTimeout(()=>{
						this.$hideLoading();
						this.enter();
					},1500)
				}else {
					this.enter();
				}
			},
			checkUpdate(){
				let sys = uni.getSystemInfoSync().platform;
				let deviceType = '';
				if(sys=='android'){//安卓系统
					deviceType = 'Android';
				}else { //ios系统
					deviceType = 'IOS';
				}
				this.$showLoading({text:'loading...'});
				//发起请求
				this.$http.checkUpdate({backVersion:this.version,deviceType}).then((res)=>{
					this.$hideLoading();
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
					}else {
						this.$refs.simpleModal.show({
							showCancelButton:true,
							cancelButtonText:"已是最新版本",
							showConfirmButton:false 
						});
					}
				})
			},
			...mapMutations(['logout'])
		}
	}
</script>

<style scoped>
	.title {
		position: absolute;
		top: 5%;
		left: 40%;
		font-size: 18px;
		color: #FFFFFF;
		width: 100px;
	}
	.person-bg, .grace-list{
		width: 100%;
	}
	.grace-list {
		border-radius: 10px;
	}
	.person-bg {
		height: 200px;
	}
	page{
		height: auto;
		min-height: 100%;
	}
	.logo {
 		width: 90%;
		margin-left: 5%;
 		box-sizing: border-box;
 		flex-direction: row;
 		align-items: center;
		position: absolute;
		top: 18%;
 	}
	.logo-img {
 		width: 150upx;
 		height: 150upx;
 		border-radius: 150upx;
 	}
	.logo-title {
 		height: 150upx;
 		flex: 1;
 		align-items: center;
 		justify-content: space-between;
 		flex-direction: row;
 		margin-left: 20upx;
 	}
	.uer-name {
 		height: 60upx;
 		line-height: 60upx;
 		font-size: 38upx;
 		color: #FFFFFF;
 	}
	.darg {
		color: #FFFFFF;
	}
	.img-hover {
		opacity: 0.8;
	}
	.exit-btn {
		background-color: #FF5A4A; 
		color: #FFFFFF;
		border-radius: 30px;
		width: 90%;
		margin-left: 5%;
		margin-top: 35%;
	}
	.to-btn {
		background-color: #33CC66; 
	}
	.set {
		position: absolute;
		top: 21%;
		left: 85%;
		width: 60upx;
	}
	.set image {
		width: 60upx;
		height: 60upx;
	}
	.version {
		font-size: 22upx;
		color: gray;
		width: 150upx;
		display: inline-block;
		margin-top: 1%;
	}
	.uni-card {
		width: 95%;
		border-radius: 10px;
		margin-left: 2.5%;
	}
	.drag {
		font-size: 40upx;
		font-weight: bold;
	}
</style>
