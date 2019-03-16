<template><!-- 流程节点组件 -->
	<view>
		<scroll-view scroll-y="true" class="scroll-area" :class="[genre==0?'':'extend']">
			<view class="grace-timeline" v-for="(item,index) in flowNodal" :key="index">
				<view class="rows">
					<view class="grace-timeline-time">
						<view>{{ item.date }}</view>
						<view>{{ item.time }}</view>
					</view>
					<view class="grace-timeline-tips">
						<view class="grace-timeline-circular">
							<text v-if="genre==0 && index==0" class="grace-iconfont icon-time"></text>
							<text v-else>√</text>
						</view>
					</view>
					<view class="grace-timeline-content">
						<view class="msg-content-arrow"></view>
						<view class="m-content">
							<view class="m-content-head">
								<view class="m-content-head-home">
									<view>
										<text class="approval-name">{{ item.assignee }}</text>
										<text class="approval-level">{{ item.description }}</text>
									</view>
									<view v-if="genre==0 && index==0">
										<view class="approval-conent">您还未审批</view>
										<view class="approval-pass wait">待审批</view>
									</view>
									<view v-else>
										<view class="approval-conent">意见:{{ item.approveIdea }}</view>
										<view class="approval-pass">已审批</view>
									</view>
								</view>
							</view>
						</view>
					</view>
					<view class="grace-timeline-line"></view>    
				</view>
			</view>
		</scroll-view>
    </view>
</template>

<script>
	export default{
		props:{
			flowNode:{
				type:Object,
				default:function(){
					return {}
				}
			},
			genre:{
				type:Number,
				default:function(){
					return {}
				}
			}
		},
		computed:{
			flowNodal(){
				const nodes = this.flowNode.map(item=>{
					return {
						assignee:item.assignee,
						description:item.description,
						approveIdea:item.approveIdea,
						date:item.endTime==null?'':item.endTime.substring(0,10),
						time:item.endTime==null?'':item.endTime.substring(11,16)
					}
				})
				return  nodes;
			}
		}
	}
</script>

<style scoped>
	.scroll-area {
		height: 830upx;
	}
	.extend {
		height: 940upx;
	}
	.grace-h5{
		line-height:1.6em;
	}
	.grace-text{
		line-height:1.5em; 
		font-size:22rpx;
	}
	.grace-timeline-circular {
		border:10upx solid #FDC8C8;
		background: #FF5A4A;
	}
	.grace-timeline-line {
		background: #FDC8C8;
	}
	.grace-timeline-content {
		background: #FFFFFF;
	}
	.m-content {
		display: flex;
		flex: 1;
		flex-direction: column;
		justify-content: center;
		word-break: break-all;
	}
	.m-content-head {
		position: relative;
	}
	.m-content-head-home {
		text-align: left;
		background: #FFFFFF;
		border: 1px #dddddd solid;
		border-radius: 20upx;
		padding: 20upx;
		color: #000000;
		box-shadow: #dddddd 5px 5px 5px;
	}
	.msg-content-arrow {
		position: absolute;
		z-index: 99;
		border: solid 1px #dddddd;
		border-right: none;
		border-top: none;
		background-color: #FFFFFF;
		width: 10px;
		height: 10px;
		left: 252upx;
		top: 65upx;
		-webkit-transform: rotateZ(45deg);
		transform: rotateZ(45deg);
	}
	.approval-name {
		font-size: 35upx;
		margin-right: 5%;
	}
	.approval-level {
		color: gray;
		font-size: 28upx;
		margin-top: 2%;
	}
	.approval-conent {
		display: inline-block;
		width: 75%;
		color: gray;
		font-size: 25upx;
	}
	.approval-pass {
		display: inline-block;
		width: 25%;
		text-align: right;
		color: #0A98D5;
		font-size: 35upx;
		margin-top: -3%;
	}
	.wait {
		color: #FF6354;
	}
</style>
