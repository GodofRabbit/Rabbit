<template>
	<view>
		<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in baseInfo" :key="index">
			<view class="uni-list-cell-navigate">
				<view class="name">{{ item.name }}:</view>
				<view class="info" v-if="item.value.length<=22">{{ item.value }}</view>
				<view class="info-warp" v-else>{{ item.value }}</view>
			</view>
		</view>
		<myloading></myloading>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				baseInfo:''
			};
		},
		onLoad(option){
			this.$showLoading();
			//请求投资类型详细信息数据列表
			this.$http.getSurveyDetial({deliveryId:option.deliveryId}).then((res)=>{
				this.$hideLoading();
				if(res.data.flag){
					this.baseInfo = res.data.data;
				}else {
					uni.showToast({
						title: '获取数据失败',
						image: '../../static/images/common/data_error.png'
					})
				}
			})
		}
	}
</script>

<style>
	page {
		background-color: #FFFFFF;
	}
	.name,.info {
		display: inline-block;
	}
	.name {
		width: 60%;
		color: #8b8b8b;
		font-size: 14px;
		font-weight: bold;
	}
	.info{
		width: 40%;
		font-size: 14px;
		text-align: right;
	}
	.info-warp {
		text-indent: 2em;
	}
</style>
