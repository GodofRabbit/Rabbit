<template name="graceFullLoading">
	<view class="grace-loading" v-if="loading">
		<view class="grace-loading-icon"></view>
		<text>{{loadingText}}</text>
	</view>
</template>
<script>
export default {
	name: "graceLoading",
	props: {
		loading: {
			type : Boolean,
			default: false
		},
		loadingText : {
			type:String,
			value: "加载中..."
		}
	}
}
</script>
<style>
@keyframes grace-rotate360{0%{transform:rotate(0deg);} 50%{transform:rotate(180deg);} 100%{transform:rotate(360deg);}}
.grace-loading{width:100%; justify-content:center; padding:16rpx 0; line-height:40rpx; color:#888;}
.grace-loading text{margin-left:12rpx;}
.grace-loading-icon{width:40rpx; height:40rpx; justify-content:center; line-height:40rpx; font-size:30rpx; text-align:center; font-family:"grace-iconfont" !important; animation:grace-rotate360 1200ms infinite linear;}
.grace-loading-icon:before {content:"\e9db"; color:#888;}
</style>