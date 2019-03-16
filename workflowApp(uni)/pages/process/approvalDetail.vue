<template>
	<view>
		<!-- 顶部 -->
		<view class="panel">
			<view class="title">{{ option.pasType }}</view>
			<view class="concent">
				<text class="regName">发起人: {{ option.regName }}</text>
				发起时间: {{ option.createDate }}
			</view>
		</view>
		<!-- 中间选项卡部分start -->
		<view class="grace-tab">
			<scroll-view class="grace-tab-title">
				<view class="main">
					<view v-for="(tab, index) in tabs" :class="[tabCurrentIndex == index ? 'grace-tab-current' : '']"  :id="'tabTag-'+index" @tap="tabChange" :key="index">{{tab.name}}</view>
				</view>
			</scroll-view>
			<swiper class="grace-tab-swiper" :class="[option.genre==0?'':'extend']"  :current="swiperCurrentIndex" @change="swiperChange">
				<!-- 基本信息组件 -->
				<swiper-item><base-info :baseInfo="baseInfo" :genre="option.genre"></base-info></swiper-item>
				<!-- 电子资料组件 -->
				<swiper-item><elec-list :eleSource="eleSource" :genre="option.genre"></elec-list></swiper-item>
				<!-- 审批节点组件 -->
				<swiper-item><work-flow-node :flowNode="flowNode" :genre="option.genre"></work-flow-node></swiper-item>
				<!-- 会议纪要组件 -->
				<swiper-item v-if="option.genre==0 && wkfState=='meet'"><meet-info ref="meets" @movetab="movetab" @showvalid="showvalid"></meet-info></swiper-item>
			</swiper>
		</view>
		<!-- 中间选项卡部分end -->
		<!-- 底部按钮组件 -->
		<view v-show="option.genre==0"><bottom-btn :wkfState="wkfState" :option="option" :meetData="meetData" @checkmeet="checkmeet" ref="bottombtn"></bottom-btn></view>
	</view>
</template>

<script>
	import baseInfo from "@/components/myself/baseInfo.vue";
	import elecList from "@/components/myself/elecList.vue";
	import workFlowNode from "@/components/myself/workFlowNode.vue";
	import meetInfo from "@/components/myself/meetInfo.vue";
	import bottomBtn from "@/components/myself/bottomBtn.vue";
	
	export default{
		components:{
			baseInfo,
			elecList,
			workFlowNode,
			meetInfo,
			bottomBtn
		},
		data(){
			return {
				option:'',
				tabCurrentIndex: 0,
				swiperCurrentIndex: 0,
				tabs: [
					{ name: '基本信息', id: 'basicInfo' },
					{ name: '电子资料', id: 'elecData' },
					{ name: '审批状态', id: 'approvalProcess' }
				],
				baseInfo:'', //基本信息
				eleSource:[],//电子资料列表
				flowNode:[], //流程节点
				wkfState:'', //节点类型 
				meetData:''  //会议纪要数据
			}
		},
		onLoad(options){
			this.option = options;
			let title = options.genre==0?'待审批':'已审批';
			uni.setNavigationBarTitle({
				title
			})
			this.$http.getDetailData({pasSubType:options.pasMinNo,businessId:options.bizPkNo}).then(res=>{
				if(res.data.flag){
					this.baseInfo = res.data.data;
					this.wkfState = res.data.wkfState;
					if(options.genre==0 && this.wkfState=='meet'){
						this.tabs.push({ name: '会议纪要', id: 'meetInfo' });
					}
				}else {
					uni.showToast({
						title: '未匹配的类型',
						image: '../../static/images/common/data_error.png'
					})
				}
			})
		},
		onBackPress(){
			plus.fingerprint.cancel();
		},
		methods:{
			tabChange: function (e) {
				var index = e.target.id.replace('tabTag-', '');
				this.swiperCurrentIndex = index;
				this.tabCurrentIndex    = index;
			},
			swiperChange: function (e) {
				var index = e.detail.current;
				this.tabCurrentIndex = index;
				//请求电子资料列表
				if(index===1){
					this.$http.getDocInfoList({pasMinNo:this.option.pasMinNo,docIdentity:this.option.bizPkNo}).then(res=>{
						if(res.data.flag){
							let list = res.data.docInfoList;
							let newlist = list.map((item)=>{
								return {
									saveName:item.saveName,
									docName:item.docName,
									docId:item.docId,
									docType:item.docType,
									uploadTime:item.uploadTime.replace('T',' '),
									//注入的新属性
									rate:0,  //进度条的进度
									state:false //进度条是否显示
								}
							})
							this.eleSource = newlist;
						}else {
							uni.showToast({
								title: '获取数据失败',
								image: '../../static/images/common/data_error.png'
							})
						}
					})
				}
				//请求流程节点
				if(index===2){
					this.$http.getWkfRecords({businessId:this.option.bizPkNo}).then(res=>{
						if(res.data.flag){
							this.flowNode = res.data.allWkfRecords;
						}else {
							uni.showToast({
								title: '获取数据失败',
								image: '../../static/images/common/data_error.png'
							})
						}
					})
				}
			},
			checkmeet(){//会议纪要非空验证
				this.$refs.meets.checkmeet();
			},
			movetab(){
				this.swiperCurrentIndex = 3;
				this.tabCurrentIndex    = 3;
			},
			showvalid(ajaxData){
				this.meetData = ajaxData;
				this.$refs.bottombtn.showDialog();
			}
		}
	}
</script>

<style scoped>
	.panel {
		height: 20%;
		width: 100%;
		background-color: #FFFFFF;
		padding-left: 35upx;
		padding-top: 30upx;
		padding-bottom: 20upx;
		margin-bottom: 1.5%;
	}
	.title {
		font-size: 35upx;
		font-weight: 800;
	}
	.regName {
		margin-right: 35upx;
	}
	.concent {
		font-size: 30upx;
		color: gray;
	}
	.grace-tab-swiper {
		margin-top: -1.5%;
		height: 830upx;
	}
	.extend {
		height: 940upx;
	}
	swiper-item{
		background: #FFFFFF; 
		text-align:center; 
		font-size:36px; 
		color:#888;
	}
	.main {
		height: 85upx;
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items:center;
		justify-content: center;
		border-bottom: 1px solid #EEEEEE;
	}
</style>
