<template><!-- 人脸识别窗口组件 -->
	<view v-if="showFace">
		<view class="mask"></view>
		<view class="panel">
			<view class="title">人脸识别比对中...</view>
			<ul class="faceImgs">
				<li><img :src="now" class="faceImg"></li>
				<li><img src="../../../static/images/common/change.png" class="change"></li>
				<li><img :src="faceUrl" class="faceImg"></li>
			</ul>
		</view>
	</view>
</template>

<script>
	import _config from '@/http/config.js';
	export default{
		props:{
			now:{
				type:String,
				default:'../../../static/images/common/user-logo.png'
			}
		},
		data(){
			return {
				showFace:false
			}
		},
		computed:{
			faceUrl(){
				let imgName = uni.getStorageSync('opNo')+'.jpg';
				return _config.url+this.$http.faceUrl+imgName;
			}
		},
		methods:{
			show(){
				this.showFace = true;
			},
			close(){
				this.showFace = false;
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
		height: 500upx;
		width: 90%;
		background-color: #FFFFFF;
		bottom:30%;
		left: 5%;
		border-radius: 10upx;
	}
	.title {
		height: 70upx;
		width: 100%;
		border-bottom: 1px solid #DDDDDD;
		text-align: center;
		font-size: 35upx;
		font-weight: 700;
		padding-left: 30%;
	}
	.faceImg {
		width: 300upx;
		height: 400upx;
		margin-top: -5%;
		border-radius: 10upx;
	}
	.faceImgs {
		list-style: none;
		display: flex;
		flex-wrap: nowrap;
		justify-content: center;
		align-items: center;
	}
	.change {
		width: 60upx;
		height: 60upx;
		animation: fade 1s linear infinite;
	}
	/* 动画 */
	@keyframes fade {
		from {
			opacity: 1;
		}
		to {
			opacity: 0;
		}
	}
</style>
