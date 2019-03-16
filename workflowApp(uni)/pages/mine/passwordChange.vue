<template>
	<view>
		<view class="content">
			<view class="has-mglr-10 ">
				<view class="hint">现在的密码：</view>
				<view class="has-mgtb-10 ">
					<input v-model="old" placeholder="请输入现在的密码" class="is-input " @input="check" :password="true"/>
				</view>
				<view class="hint">新密码：</view>
				<view class="has-radius has-mgtb-10">
					<input v-model="fresh" placeholder="注意区分大小写" class="is-input" :password="true"/>
				</view>
				<view class="hint">确认密码：</view>
				<view class="has-radius has-mgtb-10">
					<input v-model="again" placeholder="注意区分大小写" class="is-input" :password="true"/>
				</view>
				<view class="has-radius has-mgtb-20">
					<button :class="{ after:flag }" @tap="updatePass">确定</button>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import md5 from "@/static/js/md5.min.js";
	export default {
		data() {
			return {
				old:'',
				fresh:'',
				again:'',
				checkFlag:false//验证原密码是否通过
			};
		},
		computed:{
			flag(){
				if(this.checkFlag && this.old!='' && this.fresh!='' && this.again!=''){
					return true;
				}else {
					return false;
				}
			}
		},
		methods:{
			check(){
				if(this.old!=''){
					let opNo = uni.getStorageSync('opNo');
					let passwordhash = md5.base64(this.old);
					this.$http.checkUserPwd({opNo,passwordhash}).then((res)=>{
						if(res.data.flag){
							this.checkFlag = true;
							uni.showToast({
								title: '密码正确',
								image: '../../static/images/common/data_ok.png'
							})
						}else { 
							this.checkFlag = false;
							uni.showToast({
								title: '原密码错误',
								image: '../../static/images/common/data_error.png'
							})
						}
					})
				}
			},
			updatePass(){
				if(this.flag){
					if(this.fresh!=this.again){
						uni.showToast({
							title: '密码不一致',
							image: '../../static/images/common/data_error.png'
						})
					}else {
						let opNo = uni.getStorageSync('opNo');
						let newPwd = md5.base64(this.again);
						this.$http.changePassWord({opNo,newPwd}).then((res)=>{
							if(res.data.flag){
								uni.showToast({
									title: '操作成功',
									image: '../../static/images/common/data_ok.png'
								});
								uni.removeStorageSync('passwordhash');
								this.$store.commit('logout');
								setTimeout(()=>{
									uni.redirectTo({
										url: './login'
									})
								},1500)
							}else { 
								uni.showToast({
									title: '操作失败',
									image: '../../static/images/common/data_error.png'
								})
							}
						})
					}
					
				}
			}
		}
	}
</script>

<style scoped>
	page,view {
		min-height: 100%;
		background-color: #FFFFFF;
	}
	.content {
		width: 85%;
		margin: 5% auto;
	}
	.hint {
		font-size: 28rpx;
		color: orangered;
		margin-left: 7%;
	}
	.is-input {
		height: 88rpx;
		width: 100%;
		line-height: 88rpx;
		padding: 12rpx;
		color: #353535;
		font-size: 32rpx;
		box-sizing: border-box;
		appearance: none;
		border: 2rpx solid #e5e5e5;
		box-shadow: none;
		border-radius: 44rpx;
		outline: 0;
		display: block;
		padding-left: 30rpx;
		margin: 0;
		font-family: inherit;
		background: #fff;
		resize: none;
	}
	button {
		margin-top: 20rpx;
		height: 88rpx;
		width: 100%;
		line-height: 88rpx;
		color: #ffffff;
		font-size: 32rpx;
		border-radius: 44rpx;
		outline: 0;
		display: block;
		margin: 0;
		font-family: inherit;
		background-color: gray;
		opacity: 0.8;
	}
	.after {
		background-color: #FF5A4A;
	}
</style>
