<template>
	<view>
		<!--投资品种分布-->	
		<view class="panel">
			<view class="circle"></view>
			<span class="title">投资品种分布</span> 
			<span class="unit">单位:万元</span>
		</view>
		<view class="canvasView1">
			<mpvue-echarts :echarts="echarts" :onInit="fun" canvasId="bar" />
		</view>
		<ul class="detail">
			<li v-for="(item,index) in compInvests" :key="index">
				<view class="square" :style="{background: item.color}"></view>
				<span class="type">{{ item.type }}</span>
				<span class="putTotleMoney">{{ item.putTotleMoney }}万</span>
				<span class="account">{{ item.taken }}%</span>
			</li>
		</ul>
		<!--交易对手投资详情-->	
		<view class="panel">
			<view class="circle"></view>
			<span class="title">交易对手投资详情</span> 
		</view>
		<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in rivals" :key="index">
			<view class="uni-list-cell-navigate">
				<view class="name">{{ item.COU_NAME }}</view>
				<view class="info">{{ item.MRMONEY }}万</view>
			</view>
		</view>
		<!--投资期限占比-->	
		<view class="panel">
			<view class="circle"></view>
			<span class="title">投资期限占比</span> 
		</view>
		<ul class="deadline">
			<li v-for="(item,index) in allotList" :key="index">
				<span class="datelong">{{ item.title }}</span>
				<view class="canvasView2">
					<mpvue-echarts :echarts="echarts" :onInit="item.init" :canvasId="item.id" />
				</view>
				<span>{{ item.perc }}</span>
			</li>
		</ul>
		<!-- loading组件 -->
		<myloading></myloading>
	</view>
</template>

<script>
	import * as echarts from '@/components/echarts/echarts.simple.min.js';
	import mpvueEcharts from '@/components/mpvue-echarts/src/echarts.vue';
		
	export default {
		data() {
			return {
				echarts,
				invests:[],
				rivals:[],
				totalMoney:'',
				colorList: ['#ee4065','#2196f4','#6ccc00','#f9cb00','#c065ff',//先定义十四种颜色，随机生成的颜色太相近
						'#41daea','#FC5832','#4489F6','#22BECB','#FDBF2D',
						'#FF5725','#8640F9','#4086F9','#FFC002'],
				allotList:[
					{ title:'1个月', id:'pie1',init:this.fn1,perc:'' },
					{ title:'3个月', id:'pie2',init:this.fn2,perc:'' },
					{ title:'6个月', id:'pie3',init:this.fn3,perc:'' },
					{ title:'12个月', id:'pie4',init:this.fn4,perc:'' },
				]
			};
		},
		computed:{
			compInvests(){//对invests中数据进行处理
				let ins = this.invests.map((item,index)=>{
					return {
						color: this.colorList.slice(0,this.invests.length).reverse()[index%14],
						type: item.PRODUCT_TYPE,
						putTotleMoney: item.PUT_TOTLE_MONEY/10000,
						taken: (item.PUT_TOTLE_MONEY*100/this.totalMoney).toFixed(2)
					}
				})
				return ins;
			}
		},
		onShow() {
			this.$showLoading();
			this.$http.getInvestByCusMap().then(res=>{
				this.$hideLoading();
				if(res.data.flag){
					this.rivals = res.data.investByCusMap;
				}else {
					uni.showToast({
						title: '加载数据失败',
						image: '../../static/images/common/data_error.png'
					})
				}
			})
		},
		methods:{
			async fun(canvas, width, height){//同步函数,必须等待请求完成,否则echarts数据摄入失败
				let tnum = [];
				let total = 0;
				let putTotleMoney = [];
				await this.$http.industry().then((res)=>{
					if(res.data.flag){
						this.invests = res.data.totleMoneyMap;
						for(let i=res.data.totleMoneyMap.length;i>0;i--){
							tnum.push(i);
						}
						res.data.totleMoneyMap.forEach(function(item){
							putTotleMoney.unshift(item.PUT_TOTLE_MONEY/10000);
							total += item.PUT_TOTLE_MONEY;
						})
						this.totalMoney = total;
					}else {
						uni.showToast({
							title: '加载数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
				let chart = echarts.init(canvas, null, {
					width: width,
					height: height
				})
				canvas.setChart(chart);
				let option = {
				   grid:{ 
					   borderWidth:0,
					   x:'10%',
					   y:'15%',
					   x2:'15%',
					   y2:'15%',     
				   },
				   xAxis: [{ 
				       type: 'value',
				       show:false,
				       boundaryGap:true,
				       axisLabel:{
				           margin:0
				       },  
				   }
				],
				yAxis: [
				   {
				       type: 'category',
				       boundaryGap:false,
				       axisTick:{
				           show:false
				       },
				       axisLine:{
				           show:false,     // y 轴线    
				       },
						data:tnum
				   }
				],
			  dataZoom: [
					{
						type: 'slider',
						show:false,     
						yAxisIndex: 0,
						start: 0,
						end: 120
					},
					{
						type: 'inside',
						yAxisIndex: 0,
						start: 0,
						end: 60
					}
					],
				   series : [
				       {
				           name:'',
				           type:'bar',
						   barWidth : 20,
				           itemStyle : {
				               normal: {
									barBorderRadius:[0, 50, 50, 0],
				                    color: (params)=> {
				                       return this.colorList[params.dataIndex]
				                   },
				               },
				               emphasis:{
				                   label : {
				                       show: true,
				                       textStyle:{
				                           fontSize:12
				                       }
				
				                   }
				               }
				           },
				           data:putTotleMoney
				       }
				   ]
				}
				chart.setOption(option)
				return chart;
			},
			async fn1(canvas, width, height){
				let line = [];
				let term = 0;
				await this.$http.deadline().then(res=>{
					if(res.data.flag){
						res.data.projectTerminalMap.forEach(function(item){
							term += item.TOTLE;
						})
						line.push((res.data.projectTerminalMap[0].TOTLE*100/term).toFixed(2));
						line.push(100-line[0]);
						this.allotList[0].perc = line[0]+'%';
					}else {
						uni.showToast({
							title: '加载数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
				let chart = echarts.init(canvas, null, {
					width: width,
					height: height
				})
				canvas.setChart(chart);
				let option = {
					color:['#FDBF2D','#EFF6FF'],
					series : [
						{
							name: '',
							type: 'pie',
							radius : '65%',
							data:line,
							labelLine: {
								normal: {
									show: false
								}
							}
						}
					]
				}
				chart.setOption(option)
				return chart;
			},
			async fn2(canvas, width, height){
				let line = [];
				let term = 0;
				await this.$http.deadline().then(res=>{
					if(res.data.flag){
						res.data.projectTerminalMap.forEach(function(item){
							term += item.TOTLE;
						})
						line.push((res.data.projectTerminalMap[1].TOTLE*100/term).toFixed(2));
						line.push(100-line[0]);
						this.allotList[1].perc = line[0]+'%';
					}else {
						uni.showToast({
							title: '加载数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
				let chart = echarts.init(canvas, null, {
					width: width,
					height: height
				})
				canvas.setChart(chart);
				let option = {
					color:['#58CF6F','#EFF6FF'],
					series : [
						{
							name: '',
							type: 'pie',
							radius : '65%',
							data:line,
							labelLine: {
								normal: {
									show: false
								}
							}
						}
					]
				}
				chart.setOption(option)
				return chart;
			},
			async fn3(canvas, width, height){
				let line = [];
				let term = 0;
				await this.$http.deadline().then(res=>{
					if(res.data.flag){
						res.data.projectTerminalMap.forEach(function(item){
							term += item.TOTLE;
						})
						line.push((res.data.projectTerminalMap[2].TOTLE*100/term).toFixed(2));
						line.push(100-line[0]);
						this.allotList[2].perc = line[0]+'%';
					}else {
						uni.showToast({
							title: '加载数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
				let chart = echarts.init(canvas, null, {
					width: width,
					height: height
				})
				canvas.setChart(chart);
				let option = {
					color:['#4489F6','#EFF6FF'],
					series : [
						{
							name: '',
							type: 'pie',
							radius : '65%',
							data:line,
							labelLine: {
								normal: {
									show: false
								}
							}
						}
					]
				}
				chart.setOption(option)
				return chart;
			},
			async fn4(canvas, width, height){
				let line = [];
				let term = 0;
				await this.$http.deadline().then(res=>{
					if(res.data.flag){
						res.data.projectTerminalMap.forEach(function(item){
							term += item.TOTLE;
						})
						line.push((res.data.projectTerminalMap[3].TOTLE*100/term).toFixed(2));
						line.push(100-line[0]);
						this.allotList[3].perc = line[0]+'%';
					}else {
						uni.showToast({
							title: '加载数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
				let chart = echarts.init(canvas, null, {
					width: width,
					height: height
				})
				canvas.setChart(chart);
				let option = {
					color:['#FD947C','#EFF6FF'],
					series : [
						{
							name: '',
							type: 'pie',
							radius : '65%',
							data:line,
							labelLine: {
								normal: {
									show: false
								}
							}
						}
					]
				}
				chart.setOption(option)
				return chart;
			}
		},
		components:{
			mpvueEcharts
		}
	}
	
	
</script>

<style scoped>
	.canvasView1 {
		width: 100%;
		height: 150upx;
		padding-top: 40upx;
		padding-bottom: 40upx;
		background-color: #FFFFFF;
	}
	.canvasView2 {
		width: 150upx;
		height: 180upx;
		margin-left: 2%;
	}
	.panel {
		background-color: #2F4056;
		color: #FFFFFF;
		height: 45upx;
		border-bottom: 1px #D4D4D4 solid;
		align-content: center;
		padding: 3% 3%;
		font-size: 16px;
	}
	.circle {
		height: 8px;
		width: 8px;
		border-radius: 50%;
		background-color: #FF5A4A;
		float: left;
		margin-top: 1.5%;
		margin-right: 2.5%;	
	}
	.unit {
		font-size: 14px;
		color: gray;
		margin-left: 5%;
	}
	.title {
		display: inline-block;
		margin-top: -1%;
	}
	.detail {
		background-color: #FFFFFF;
		padding-bottom: 20upx;
	}
	.square {
		height: 10px;
		width: 10px;
		float: left;
		margin:2% 3% auto 6%;
	}
	.type {
		width: 40%;
	}
	.putTotleMoney {
		width: 25%;
	}
	.account {
		width: 20%;
		color: #FF6354;
	}
	.name,.info {
		display: inline-block;
		font-size: 13px;
		width: 50%;
	}
	.name {
		color: #009688;
		text-align: left;
	}
	.info{
		color: #000000;
		text-align: right;
	}
	.deadline {
		display: flex;
		flex-direction: row;
		flex-wrap: nowrap;
		align-items: center;
		align-content: center;
		justify-content: center;
		background-color: #FFFFFF;
		margin-top: 0%;
		padding-top: 2%;
		padding-bottom: 3%;
	}
	.deadline li span{
		margin-left: 20%;
	}
	.datelong {
		color: gray;
	}
</style>
