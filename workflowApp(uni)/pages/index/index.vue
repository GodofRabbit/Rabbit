<template>
	<view>
		<!--轮播图-->
		<swiper :indicator-dots="true" :autoplay="true" :interval="3000" :duration="1000" circular="true" indicator-active-color="orangered">
			<swiper-item v-for="(img,key) in imgUrls" :key="key">
				<view class="swiper-item"><image :src="img"></image></view>
			</swiper-item>
		</swiper>
		<!--金额面板-->
		<view>
			<ul class="menu-list">
			    <li>
			        <view class="list-name">
						<span class="money">{{ totalInvest/10000 }}</span>
						<span class="behalf">总投资金额(万元)</span>
			        </view>
			    </li>
				<li>
				    <view class="list-name">
				    	<span class="money">{{ totalProfit/10000 }}</span>
				    	<span class="behalf">投资收益(万元)</span>   
				    </view>
				</li>
			</ul>
		</view>
		<!--滚动公告栏-->
		<view class="uni-swiper-msg">
			<view class="uni-swiper-msg-icon">
				<image src="../../static/images/common/loading.png" mode="widthFix"></image>
			</view>
			<swiper autoplay="true" circular="true" interval="5000" class="uni-ellipsis">
				<swiper-item v-for="(item, index) in msg" :key="index">
					<navigator>{{item}}</navigator>
				</swiper-item>
			</swiper>
			<text class="uni-list-cell-navigate uni-navigate-right drag"></text>
		</view>
		<!-- 投资概况 -->
		<view class="panel"> 
			<view class="circle"></view>
			投资概况 
		</view>
		<view class="uni-list">
			<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in InvestSurveyType" :key="index" @tap="enterList(item.typeName)">
				<view class="uni-list-cell-navigate uni-navigate-right uni-media-list"><!-- 右侧箭头：uni-navigate-right -->
					<view class="uni-media-list-logo">
						<image v-show="index%3==0" src="../../static/images/common/icon_stock.png"></image>
						<image v-show="index%3==1" src="../../static/images/common/icon_fund.png"></image>
						<image v-show="index%3==2" src="../../static/images/common/icon_managem.png"></image>
					</view>
					<view class="uni-media-list-body">
						<view class="uni-media-list-text-top">{{ item.typeName }}</view>
						<view class="uni-media-list-text-bottom uni-ellipsis">
							总金额(万元) <span class="total">{{ item.totalInvest/10000 }}</span>
							笔数<span class="bum">{{ item.total }}</span>
						</view>
					</view>
				</view>
			</view>
		</view>
		<myloading></myloading>
	</view>
</template>

<script>
	import { mapState } from "vuex"
	export default {
		data() {
			return {
				imgUrls: [
					'../../static/images/banner/banner1.png',
					'../../static/images/banner/banner2.png',
					'../../static/images/banner/banner3.png'
				],
				totalInvest: 0,//总投资金额
				totalProfit: 0,//投资收益
				InvestSurveyType:[],//投资概况
				msg : [//滚动公告
					'uni-app行业峰会频频亮相，开发者反响热烈',
					'DCloud完成B2轮融资，uni-app震撼发布',
					'36氪热文榜推荐、CSDN公号推荐 DCloud CEO文章'
				]
			}
		},
		computed:{
			...mapState(['hasLogin'])
		},
		onNavigationBarButtonTap(e){
			if(e.index==1){
				if(this.hasLogin){
					uni.navigateTo({
						url:'./infoList'
					})
				}else {
					uni.navigateTo({
						url:'/pages/mine/login'
					})
				}
			}
		},
		onShow(){
			//获取当前位置
			plus.geolocation.getCurrentPosition(p=>{
				let city = p.address.city;
				this.setNavText(0,city);
			})
			//请求总投资金额(下面的写法是保证数据请求按顺序执行，而不是并发执行)
			this.$http.getTotalInvest().then((res)=>{
				if(res.data.flag){
					this.totalInvest = res.data.totalInvest;
				}else {
					uni.showToast({
						title: '获取数据失败',
						image: '../../static/images/common/data_error.png'
					})
				}
			}).then(()=>{
				//请求投资收益
				this.$http.getInvestProfit().then((res)=>{
					this.$hideLoading();
					if(res.data.flag){
						this.totalProfit = res.data.totalProfit;
					}else {
						uni.showToast({
							title: '获取数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
			}).then(()=>{
				//请求投资概况
				this.$http.getInvestSurveyType().then((res)=>{
					this.$hideLoading();
					if(res.data.flag){
						this.InvestSurveyType = res.data.InvestSurveyType;
					}else {
						uni.showToast({
							title: '获取数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
			}).then(()=>{
				let opNo = uni.getStorageSync('opNo');
				if(this.hasLogin){
						//请求未读消息条数
					this.$http.getUnReadInfoNum({opNo}).then((res)=>{
						if(res.data.flag){
							let num = res.data.unReadInfoSize;
							if(num==0){
								this.setStyle(1,false);
							}else{
								this.setStyle(1,true,num);
							}
						}else {
							uni.showToast({
								title: '获取数据失败',
								image: '../../static/images/common/data_error.png'
							})
						}
					})
				}
			})
		},
		methods:{
			enterList(typeName){
				uni.navigateTo({
					url: './investList?typeName='+typeName
				})
			},
			/**
			 * 修改导航栏buttons
			 * index[number] 修改的buttons 下标索引，最右边索引为0
			 * show[boolean] 显示还是隐藏角标或者红点
			 * text[string] 需要修改的角标的text 内容 ，如果定义redDot 此参数无效 ，如果定义badgeText请设置具体，如果不用输入
			 */
			setStyle(index, show,text) {
				let pages = getCurrentPages();
				let page = pages[pages.length - 1];
				// #ifdef APP-PLUS
				let currentWebview = page.$getAppWebview();
				if(show){
					if(index === 0){
						currentWebview.showTitleNViewButtonRedDot({index:index,text:text})
					}else{
						currentWebview.setTitleNViewButtonBadge({index:index,text:text})
					}
				}else{
					if(index === 0){
						currentWebview.hideTitleNViewButtonRedDot({index:index})
					}else{
						currentWebview.removeTitleNViewButtonBadge({index:index})
					}
				}
				// #endif
			},
			/**
			 * 修改导航栏buttons
			 * index[number] 修改的buttons 下标索引，最右边索引为0
			 * text[string] 需要修改的text 内容
			 */
			setNavText(index,text) {
				let pages = getCurrentPages();
				let page = pages[pages.length - 1];
				// #ifdef APP-PLUS
				let currentWebview = page.$getAppWebview();
				let titleNView = currentWebview.getStyle().titleNView;
				// 添加文字过长截取为3个字符，请根据自己业务需求更改
				if(text.length > 3){
					text = text.substr(0,3)+"..."
				}
				titleNView.buttons[0].text = text;
				currentWebview.setStyle({
					titleNView:titleNView
				});
				// #endif
			}
		}
		
	}
</script>

<style scoped>
	/* 点击效果 */
	.tap-hover {
		opacity: 0.6;
	}
	/* 轮播图 */
	.swiper-item image,swiper {
		width: 100%;
		height: 400upx;
	}
	/* 总投资额,投资收益 */
	.menu-list {
		position: absolute;
		z-index: 2;
		width: 95%;
		margin-left: 2.5%;
		margin-top: -8%;
		display: flex;
		background: #fff;
		border-radius: 5px;
	}
	.menu-list li {
	    flex: 1;
		list-style: none;
	}
	.list-name {
		text-align: center;
		display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    height: 90px;
	    width: 100%;
	}
	.menu-list li:first-child:after{
		content: '';
	    height: 40px;
	    width:1px;
	    background: darkgray;
	    display: inline-block;
	    vertical-align: middle;
	    position: absolute;
	    left: 50%;
	    top: 35%;
	} 
	.money{
		color: #FF5B4B;
		font-size: 30px;
		margin-bottom: -30upx;
		font-weight: bold;
	}
	.behalf{
		color:gray;
		font-size: 15px;
	}
	/* 滚动公告 */
	.uni-swiper-msg {
		margin-top: 18%;
		height: 60upx;
		background-color: #FFFFFF;
		padding-left: 30upx;
		padding-top: 20upx;
	}
	.uni-swiper-msg image {
		border-radius: 3px;
	}
	/* 投资概况 */
	.circle {
		width: 15upx;
		height: 15upx;
		background-color: orangered;
		border-radius: 50%;
		position: relative;
		right: 12upx;
		top: 27upx;
	}
	.panel {
	  height: 40px;
	  background: #FFFFFF;
	  margin-top: 1.5%;
	  font-size: 18px;
	  font-weight: bold;
	  padding-left: 50upx;
	  padding-top: 30upx;
	}
	.total {
		color: red;
		width: 80upx;
		margin:auto 40upx auto 20upx;
	}
	.bum {
		color: red;
		margin-left: 20upx;
	}
	.uni-media-list-text-top {
		font-size: 16px;
	}
	.uni-media-list-text-bottom {
		font-size: 13px;
	}
	.drag {
		font-size: 40upx;
		font-weight: bold;
	}
</style>
