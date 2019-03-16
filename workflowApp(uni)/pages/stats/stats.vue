<template>
	<view>
		<navigator class="investStyle" v-for="(item,index) in menulist" :key="index" :url="item.url">
			<image :src="item.img" />
			<span class="name">{{ item.title }}
			<span class="abstract">{{ item.text }}</span>
			</span>
		</navigator>
	</view>
</template>

<script>
	import { mapState } from 'vuex';
	export default {
		data() {
			return {
				menulist: [
					{
						title: "投资分布统计",
						text: "实时计算",
						img: "../../static/images/common/img_1.png"
					},
					{
						title: "预期收益统计",
						text: '要收益更"美"',
						img: "../../static/images/common/img_2.png"
					},
					{
						title: "到期收益统计",
						text: "复利再投资",
						img: "../../static/images/common/img_3.png"
					},
					{
						title: "投资分析报表",
						text: "用数据说话",
						img: "../../static/images/common/img_4.png"
					}
				]
			};
		},
		computed:{
			...mapState(['hasLogin'])
		},
		onShow(){
			if(!this.hasLogin){
				this.menulist.forEach(item=>{
					item.url = '../mine/login'
				})	
			}else {
				let url = ['./incomeAnalysis','./income','./maturityIncome','./investment'];
				this.menulist.forEach((item,index)=>{
					item.url = url[index]
				})	
			}
		}
	}
</script>

<style scoped>
	.investStyle {
		height: 60px;
		width: 60%;
		margin-top: 10%;
		background-color: #FFFFFF;
		border-radius: 60px;
		margin-left: 15%;
		padding: 10px 20px;
	}
	image {
		width: 60px;
		height: 60px;
		float: left;
	}
	.name {
		font-size: 20px;
		line-height: 30px;
		margin-left: 10px;
	}
	.abstract {
		font-size: 16px;
		color: gray;
		margin-left: 20px;
	}

</style>
