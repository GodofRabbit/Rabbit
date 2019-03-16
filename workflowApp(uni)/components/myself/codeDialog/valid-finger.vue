<template><!-- 指纹验证窗口组件 -->
	<view v-if="showFinger">
		<view class="mask"></view>
		<view class="panel">
			<view class="top">
				<span class="title">指纹验证已开启</span>
				<view class="close" @tap="close"></view>
			</view>
			<span class="tip">把手指放在Home键上来验证</span>
			<img src="../../../static/images/common/infinger.png" class="finger">
		</view>
	</view>
</template>

<script>
	export default{
		data(){
			return {
				showFinger:false
			}
		},
		methods:{
			show(){
				this.$emit('check');
				this.showFinger = true;
			},
			close(){
				plus.fingerprint.cancel();
				this.showFinger = false;
			}
		}
	}
</script>

<style scoped>
	.mask {
		position: fixed;
		z-index: 999;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		background: rgba(0,0,0,.6);
	}
	.panel {
		position: fixed;
		z-index: 999;
		height: 450upx;
		width: 100%;
		background-color: #FFFFFF;
		bottom:0;
	}
	.close {
		color: #ddd;
		height: 20px;
		width: 20px;
		font-size: 15px;
		top: 1px;
		right: 5px;
		position: absolute;
	}
	.close:before {
		content: "\2716";
	}
	.top {
		height: 70upx;
		width: 100%;
		border-bottom: 1px solid #DDDDDD;
	}
	.title {
		text-align: center;
		font-size: 35upx;
		font-weight: 700;
		margin-left: 35%;
	}
	.finger {
		width: 400upx;
		height: 400upx;
		margin-left: 23%;
		margin-top: -5%;
	}
	.tip {
		color: #278899;
		margin-left: 25%;
		font-size: 30upx;
	}
</style>
