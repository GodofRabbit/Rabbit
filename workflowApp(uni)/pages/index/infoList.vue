<template>
	<view>
		<view class="m-item" v-for="(item,index) in lists" :key="index">
			<view class="time">{{ item.time }}</view>
			<view class="m-left">
				<image v-if="item.pasSts==0" class="head_icon" src="../../static/images/common/icon_inform.png"></image>
				<image v-else class="head_icon" src="../../static/images/common/icon_alinform.png"></image>
			</view>
			<view class="m-content" hover-class="content-hover">
				<view class="m-content-head">
					<view v-if="item.pasSts==0" class="m-content-head-home" @tap="updateInfo(item.pasNo,index)">{{ item.detail }}</view>
					<view v-else class="m-content-head-grhome">{{ item.detail }}</view>
				</view>
			</view>
		</view>
		<uni-load-more :status="loadType"></uni-load-more>
	</view>
</template>

<script>
	import uniLoadMore from "@/components/base/uni-load-more.vue"
	export default{
		components: {
			uniLoadMore
		},
		data(){
			return {
				pageNo:1,
				lists:[],
				loadType:'more'
			}
		},
		onShow() {
			uni.startPullDownRefresh();
		},
		onPullDownRefresh() {
			this.pageNo = 1;
			this.lists = [];
			this.getList();
		},
		onReachBottom() {
			if(this.loadType == 'more'){
				this.loadType = 'loading';
				this.getList();
			}
		},
		methods:{
			getList(){
				let userNo = uni.getStorageSync('opNo');
				this.$http.getMessageList({userNo,pageNo:this.pageNo}).then(res=>{
					if(res.data.flag){
						this.lists = this.lists.concat(this.convert(res.data.sysTaskInfos));
						if(res.data.sysTaskInfos.length < 15){
							this.loadType = 'noMore';
						}else {
							this.loadType = 'more';
							this.pageNo++;
						}
						uni.stopPullDownRefresh();
					}else {
						uni.showToast({
							title: '加载数据失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
			},
			updateInfo(pasNo,index){
				let opNo = uni.getStorageSync('opNo');
				this.$http.updateInfo({opNo,pasNo}).then(res=>{
					if(res.data.flag){
						this.lists[index].pasSts = 1;
						plus.nativeUI.toast('已读!');
					}
				})
			},
			convert(items) {
				let newItems = [];
				items.forEach(function(item) {
					newItems.push({
						pasNo:item.pasNo,
						title: item.pasTitle,
						pasSts: item.pasSts,
						detail: item.pasContent.replace(/<.*?>/ig,""),
						time: item.createDate.substring(0,4)+"/"+item.createDate.substring(4,6)+"/"+item.createDate.substring(6)+" "+item.createTime
					});
				});
				return newItems;
			}
		}
	}
</script>

<style scoped>
	.m-item {
		display: flex;
		flex-direction: row;
		padding-top: 40upx;
		margin-top: 15upx;
	}
	.m-left {
		display: flex;
		width: 120upx;
		justify-content: center;
		align-items: flex-start;
	}
	.m-content {
		display: flex;
		flex: 2;
		flex-direction: column;
		justify-content: center;
		word-break: break-all;
	}
	.head_icon {
		width: 80upx;
		height: 80upx;
	}
	.m-content-head {
		position: relative;
	}
	.m-content-head-home {
		text-align: left;
		background: #FF6354;
		border: 1px #FF6354 solid;
		border-radius: 20upx;
		padding: 20upx;
		color: white;
		width: 500upx;
	}
	.m-content-head-home:before {
		border: 15upx solid transparent;
		border-right: 15upx solid #FF6354;
		left: -26upx;
		width: 0;
		height: 0;
		position: absolute;
		content: ' '
	}
	.m-content-head-grhome {
		text-align: left;
		background: #009688;
		border: 1px #009688 solid;
		border-radius: 20upx;
		padding: 20upx;
		color: white;
		width: 500upx;
	}
	.m-content-head-grhome:before {
		border: 15upx solid transparent;
		border-right: 15upx solid #009688;
		left: -26upx;
		width: 0;
		height: 0;
		position: absolute;
		content: ' '
	}
	.content-hover {
		opacity: 0.6;
	}
	.time {
		color: gray;
		text-align: center;
		margin-left: 35%;
	}
</style>
