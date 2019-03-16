<template>
	<view>
		<image class="logo" src="../../static/images/logo.png"></image>
		<view class="grace-form">
			<form @submit="login">
				<view class="grace-items">
					<view class="grace-label"><image class="log-phone" src="../../static/images/common/icon_phone.png"/></view>
					<input type="number" class="input" name="opNo" focus placeholder="账号" maxlength="15" placeholder-style="color:red" :value="username" @input="bindClearInput"></input>
					<image class="log-back" src="../../static/images/common/icon_delete.png" v-if="showClearIcon" @click="clearIcon"/>
				</view>
				<view class="grace-items">
					<view class="grace-label"><image class="log-lock" src="../../static/images/common/icon_lock.png"/></view>
					<input class="input" name="password" :password="showPassword" :value="passwordhash" placeholder="密码" placeholder-style="color:red"></input>
					<image class="log-back" :src="eyeimg"  @click="changePassword"/>
				</view>
				<view class="grace-items">
					<text class="auto-tip">自动登录</text>
					<switch name="autologin" checked color="#FF5A4A"/>
				</view>
				<button type="primary" formType="submit" class="login-btn" hover-class="btn-hover">登录</button>
			</form>
		</view>
		<myloading></myloading>
	</view>
</template>

<script>
	import md5 from "@/static/js/md5.min.js";
	import { mapMutations } from 'vuex';
	export default {
		data() {
			return {
				showClearIcon: false,
				username: uni.getStorageSync("opNo"),
				passwordhash: uni.getStorageSync("passwordhash"),
				showPassword: true,
				eyeimg:"../../static/images/common/icon_eye_s.png"
			};
		},
		methods:{
			clearIcon() {
				this.username = "";
				this.showClearIcon = false;
			},
			bindClearInput(e) {
				this.username = e.target.value;
				if (e.target.value.length > 0) {
					this.showClearIcon = true;
				} else {
					this.showClearIcon = false;
				}
			},
			changePassword() {
				if(this.passwordhash.match(/[0-9a-zA-Z]{22}==$/)){
					this.passwordhash = "";//首次进到页面,密码框中有密码,点击显示时清空,以防密码泄露
				}
				this.showPassword = !this.showPassword;
				if(this.showPassword){
					this.eyeimg = '../../static/images/common/icon_eye_s.png';
				}else{
					this.eyeimg = '../../static/images/common/icon_eye.png';
				}
			},
			login(e){
				let opNo = e.detail.value.opNo;
				let passwordhash = e.detail.value.password;
				let autologin = e.detail.value.autologin;
				if(!passwordhash.match(/[0-9a-zA-Z]{22}==$/) && passwordhash!=""){//md5.base64()加密的密码特征：长度24，以两个'=='结尾
					passwordhash = md5.base64(passwordhash);
				}
				this.$showLoading({text:'登录中...'});
				this.$http.login({opNo,passwordhash}).then((res)=>{
					this.$hideLoading();
					if(res.data.flag){
						uni.setStorageSync('autologin', autologin);
						this.loginfo(res.data.user);
						let clientId = plus.push.getClientInfo().clientid;
						this.$http.saveClientId({opNo,clientId});//存储clientId
						let pages = getCurrentPages();
						let page = pages[pages.length - 2];
						let currentWebview = page.$getAppWebview();
						plus.webview.postMessageToUniNView({
							refresh: true
						}, currentWebview.id);
						uni.navigateBack();
					}else {
						uni.showToast({
							title: res.data.msg,
							image: '../../static/images/common/data_error.png'
						})
					}
				}).catch((res)=>{
					this.$hideLoading();
					plus.nativeUI.toast('登录失败,请检查网络连接');
				})
			},
			...mapMutations({
				loginfo: 'login'
			})
		}
	}
</script>

<style scoped>
	page,view {
		min-height: 100%;
		background-color: #FFFFFF;
	}
	.logo {
		width: 25%;
		height: 150px;
		margin: 30% auto auto 38%;
	}
	.log-phone {
		width: 25px;
		height: 30px;
	}
	.log-lock {
		width: 25px;
		height: 25px;
	}
	.log-back {
		width: 50px;
		height: 40px;
	}
	.grace-form .grace-items input {
		text-align: left;
		margin-left: 0px;
	}
	.grace-form .grace-items .grace-label {
		width: 35px;
	}
	.grace-form .grace-items {
		width: 80%;
		margin-left: 10%;
	}
	.login-btn {
		background-color: #FF5A4A; 
		color: #fff;
		border-radius: 30px;
		width: 80%;
		margin-left: 10%;
		margin-top: 12%;
	}
	switch {
		float: right;
	}
	.auto-tip {
		display: inline-block;
		font-size: 18px;
		color: #DDDDDD;
		margin-left: 45%;
		margin-top: 4%;
	}
	.btn-hover {
		opacity: 0.8;
	}
</style>
