<template>
	<view>
		<view class="panel" v-for="(product,index) in products" :key="index" @tap="toDetail(product.deliveryId)" hover-class="hover-list">
		  <view class="panel-hd">
		    <view class="panel-tit">
		      <span class="productName uni-ellipsis">{{ product.productName }}</span>
		    	<span class="term">有效期:{{ product.launchTermValidity }}天</span>
		    </view>
		  </view>
		  <view class="panel-bd">
		    <view class="product-star">
		      <view class="product-item">
		        <view class="product-name"><a href="javascript:void(0)"></a></view>
		        <ul class="product-info">
		          <li>
		            <view class="product-info-num uni-ellipsis">{{ product.performanceIndex }}%</view>
		            <view>业绩基准</view>
		          </li>
		          <li>
		            <view class="product-info-num">{{ product.holdPeriod || 0 }}天</view>
		            <view>持有期限</view>
		          </li>
		          <li>
		            <view class="product-info-num">{{ product.thisTimePutMoney/10000 }}万</view>
		            <view>投资金额</view>
		          </li>
		        </ul>
		      </view>
		    </view>
		  </view>
		</view>
		<uni-load-more :status="loadType"></uni-load-more>
		<back-top></back-top>
	</view>
</template>

<script>
	import uniLoadMore from "@/components/base/uni-load-more.vue"
	import backTop from "@/components/myself/backTop.vue"
	export default {
		components: {
			uniLoadMore,
			backTop
		},
		data() {
			return {
				loadType:'more',
				typeName:'',
				pageNo: 1,
				products:[]
			}
		},
		computed:{
			//uni不支持复杂表达式，统一在这里处理
			cacl_products: function(){//这里只是处理了下数据，这个属性并没有用到
				if(this.products.length != 0){
					this.products.forEach((item)=>{
						item.performanceIndex = (item.performanceIndex*100).toFixed(1);
					})
				}
				return this.products;
			}
		},
		onLoad: function (option) { 
			//动态设置导航栏标题
			this.typeName = option.typeName;
			uni.setNavigationBarTitle({
				title: this.typeName
			})
			this.loadType = 'loading';
			this.toLoad();
		},
		onReachBottom() {
			if(this.loadType == 'more'){
				this.loadType = 'loading';
				this.toLoad();
			}
		},
		methods:{
			toLoad(){
				//请求投资类型对应数据列表
				this.$http.getInvestSurvey({pageNo:this.pageNo,prodTypeName:this.typeName}).then((res)=>{
					if(res.data.flag){
						let investSurvey = res.data.investSurvey;
						this.products = this.products.concat(investSurvey);
						if(investSurvey.length < 15){
							this.loadType = 'noMore';
						}else {
							this.loadType = 'more';
							this.pageNo++;
						}
					}else {
						uni.showToast({
							title: '获取数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
			},
			toDetail(deliveryId){
				uni.navigateTo({
					url: './investDetail?deliveryId='+deliveryId
				})
			}
		}
	}
</script>

<style>
	.hover-list {
		opacity: 0.6;
	}
	.panel {
	  background: #fff;
	  margin-top: 8px;
	}
	.panel .panel-hd {
	  height: 45px;
	  border-bottom: 2px solid #F6F6F6;
	  position: relative;
	}
	.panel .panel-tit {
	  height: 43px;
	  line-height: 43px;
	  font-size: 16px;
	  padding-left: 14px;
	  position: relative;
	}
	.term {
	  font-size: 14px;
	  color: #999;
	  margin-right: 5px;
	  float: right;
	}
	.panel .panel-tit:before {
	  content: "";
	  float: left;
	  width: 2px;
	  height: 15px;
	  background: #21548D;
	  margin: 14px 10px 0 0;
	}
	.panel .panel-bd {
	  padding: 14px;
	}
	.product-star a {
	  color: #333;
	}
	.product-star .product-item {
	  border-bottom: 1px solid #E9E9E9;
	  padding: 10px 0;
	}
	.product-star .product-item:last-child {
	  border-bottom: none;
	}
	.product-star .product-name {
	  line-height: 20px;
	  overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	  font-size: 16px;
	  margin-bottom: 5px;
	}
	.product-star .product-info {
	  display: -webkit-box;
	  display: -ms-flexbox;
	  display: flex;
	}
	.product-star .product-info li {
	          flex: 1;
	  text-align: center;
	  font-size: 14px;
	  color: #999;
	  position: relative;
	  margin-left: 9%;
	}
	.product-star .product-info li:not(:last-child):after {
	  content: "";
	  position: absolute;
	  top: 50%;
	  right: 0;
	  -webkit-transform: translateY(-50%);
	          transform: translateY(-50%);
	  width: 1px;
	  height: 15px;
	  background: #e9e9e9;
	}
	.product-star .product-info-num {
	  color: #F66061;
	  font-size: 18px;
	  line-height: 30px;
	  text-align: center;
	}
	.productName {
		display: inline-block;
		width: 67%;
	}
</style>
