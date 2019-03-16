<template><!-- 回到顶部组件 -->
	<view>
		<image src="../../static/images/common/back_top.png" v-if="show" @tap="top"></image>
	</view>
</template>

<script>
	export default{
		data(){
			return {
				show: false
			}
		},
		onPageScroll(object){
			if(object.scrollTop>0){
				this.show = true;
			}else {
				this.show = false;
			}
		},
		methods:{
			top(){
				uni.pageScrollTo({
					scrollTop: 0
				});
			}
		}
	}
</script>

<style scoped>
	image {
		position: fixed;/*相对于手机屏幕布局*/
		z-index: 99;/*叠层设置*/
		/*设置内部加号居中*/
		display: flex;
		align-items:center;
		justify-content:center;
		/*宽高*/
		width:45px;
		height:45px;
		/*位于屏幕的位置（可根据需求改）*/
		bottom: 30px;
		right:50upx;
	}
</style>
