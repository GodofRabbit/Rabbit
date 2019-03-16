<template><!-- 审批详情页基本信息组件 -->
	<view>
		<scroll-view scroll-y="true" class="scroll-area" :class="[genre==0?'':'extend']">
			<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in baseInfo" :key="index">
				<view class="uni-list-cell-navigate">
					<view class="name">{{ item.name }}:</view>
					<view class="info" v-if="item.value.length<=22">{{ item.value }}</view>
					<view class="info-warp" v-else>{{ item.value }}</view>
				</view>
			</view>
		</scroll-view>
	</view>
</template>

<script>
	export default{
		props:{
			baseInfo:{
				type:Object,
				default: function(e) {
				    return {}
				}
			},
			genre:{
				type:Number,
				default: function(e) {
				    return {}
				}
			}
		}
	}
</script>

<style scoped>
	.name,.info {
		display: inline-block;
		font-size: 13px;
		width: 50%;
	}
	.name {
		color: #8b8b8b;
		text-align: left;
	}
	.info{
		color: #000000;
		text-align: right;
	}
	.info-warp {
		text-indent: 2em;
	}
	.scroll-area {
		height: 830upx;
	}
	.extend {
		height: 940upx;
	}
</style>
