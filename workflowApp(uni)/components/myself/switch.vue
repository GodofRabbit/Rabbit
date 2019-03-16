<template><!-- 自定义switch组件 -->
	<view>
		<view class="mySwitch" :class="{open:checked}">
			<view class="circle" :class="[checked?'openMove':'closeMove']"></view>
		</view>
	</view>
</template>

<script>
	export default{
		props:{
			checked:{
				type:Boolean,
				default:false
			}
		}
		/* methods:{
			switchEvent(){
				this.$emit('tap');
			}
		} */
	}
</script>

<style scoped>
	.mySwitch {
		width: 110upx;
		height: 65upx;
		border-radius: 50upx;
		background-color: #FFFFFF;
		border: 1px solid #DDDDDD;
	}
	.open {
		background-color: #FF6354;
	}
	.circle {
		width: 64upx;
		height: 64upx;
		border-radius: 50%;
		background-color: #FFFFFF;
		border: 1px solid #DDDDDD;
		float: left;
		margin-left: -2upx;
		margin-top: -1upx;
	}
	/* 动画 */
	.openMove {
		animation: move 0.3s linear forwards;
	}
	.closeMove {
		animation: close 0.3s linear forwards;
	}
	@keyframes move {
		from {
			transform: translateX(0upx);
		}
		to {
			transform: translateX(45upx) scale(0.9);
		}
	}
	@keyframes close {
		from {
			transform: translateX(45upx);
		}
		to {
			transform: translateX(0upx);
		}
	}
</style>
