<template><!-- 填写意见文本域组件 -->
	<view>
		<view v-if="showWindow">
			<view class="mask" @tap="close"></view>
			<!-- 小型文本框 -->
			<view class="option" :class="pattern">
				<textarea v-model="opinion" focus placeholder="写意见..." class="small-textarea" :class="child"/>
				<view class="englr" v-if="btnShow">
					<image src="../../static/images/common/icon_unfold.png" @tap="blow"></image>
					<button class="send" :class="{confirm:flag}" @tap="send">确定</button>
				</view>
				<view class="big-bottom" v-else>
					<button class="cancel" @tap="close">取消</button>
					<button class="ok" :class="{confirm:flag}" @tap="send">确定</button>
				</view>
			</view>
		</view>
		<myloading></myloading>
	</view>
</template>

<script>
	export default{
		props:{
			wkfState:{
				type:Object,
				default:function(){
					return {}
				}
			},
			meetData:{
				type:Object
			},
			option:{
				type:Object
			},
			opinionType:{
				type:Object
			}
		},
		data(){
			return{
				showWindow:false,
				opinion:'',
				btnShow:true,
				pattern:'',
				child:'',
				flag:false //确定按钮是否变红
			}
		},
		watch:{
			opinion(now,old){
				if(now.trim()!=''){
					this.flag = true;
				}else {
					this.flag = false;
				}
			}
		},
		methods:{
			show(){//显示弹层
				this.showWindow = true;
				plus.key.showSoftKeybord();//强制显示软键盘
			},
			close(){//关闭弹层
				this.showWindow = false;
				this.pattern = '';
				this.child = '';
				this.btnShow = true;
			},
			blow(){//框体放大
				plus.key.showSoftKeybord();
				this.pattern = 'option-pull';
				this.child = 'textarea-pull';
				this.btnShow = false;
			},
			send(){
				if(this.flag){
					this.$showLoading({text:'loading...'});
					this.showWindow = false;
					let sys = uni.getSystemInfoSync().platform;
					let deviceType = '';
					if(sys=='android'){//安卓系统
						deviceType = 'Android';
					}else { //ios系统
						deviceType = 'IOS';
					}
					let opNo = uni.getStorageSync('opNo');
					let brNo = this.$store.state.userInfo.brNo;
					let businessId = this.option.bizPkNo;
					let pasSubType = this.option.pasMinNo;
					let opinionType = this.opinionType;
					let approvalOpinion = this.opinion;
					let isIOS = deviceType;
					let datas = this.meetData;
					let ajaxData = datas.substr(0,datas.length-1)+',{"name":"businId","value":"'+businessId+'"}]';
					if(this.wkfState=='meet'){
						this.$http.insertLineMeet({ajaxData,opNo,brNo}).then(res=>{
							if(res.data.flag){
								this.doProcess(pasSubType,businessId,opNo,opinionType,approvalOpinion,isIOS);
							}else {
								this.$hideLoading();
								uni.showToast({
									title: '信息提交失败',
									image: '../../static/images/common/data_error.png'
								})
							}
						})
					}else {
						this.doProcess(pasSubType,businessId,opNo,opinionType,approvalOpinion,isIOS);
					}
					
				}
			},
			doProcess(pasSubType,businessId,opNo,opinionType,approvalOpinion,isIOS){
				this.$http.doProcess({pasSubType,businessId,assignee:opNo,opinionType,approvalOpinion,isIOS:isIOS || ''}).then(res=>{
					this.$hideLoading();
					if(res.data.flag){
						uni.showToast({
							title: '信息提交成功',
							image: '../../static/images/common/data_ok.png'
						})
						let pages = getCurrentPages();
						let page = pages[pages.length - 2];
						let currentWebview = page.$getAppWebview();
						plus.webview.postMessageToUniNView({
							refresh: true
						}, currentWebview.id);
						setTimeout(function(){uni.navigateBack();},1000)
					}else {
						uni.showToast({
							title: '信息提交失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
			}
		}
	}
</script>

<style scoped>
	.mask {
		position: fixed;
		z-index: 999;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		background: rgba(0,0,0,.6);
	}
	.option {
		position: fixed;
		z-index: 999;
		width: 100%;
		height: 240upx;
		background: #FFFFFF;
		bottom: 0;
		border-top: none;
	}
	.small-textarea {
		width: 82%;
		height: 200upx;
		border: 1px solid #DDDDDD;
		border-radius: 10upx;
		margin-left: 3%;
		margin-top: 15upx;
	}
	.englr {
		float: right;
		height: 220upx;
		width: 100upx;
	}
	.send {
		color: #FFFFFF;
		background: #D2D2D2;
		font-size: 30upx;
		text-align: center;
		line-height: 65upx;
		height: 130upx;
		width: 80upx;
	}
	image {
		width: 80upx;
		height: 80upx;
		margin-left: 15upx;
	}
	.big-bottom {
		height: 15%;
		width: 100%;
		background: #FFFFFF;
		padding-top: 20upx;
		background: #F0F0F0;
	}
	.ok {
		height: 60upx;
		width: 120upx;
		background: #DDDDDD;
		color: #FFFFFF;
		font-size: 25upx;
	}
	.cancel {
		height: 60upx;
		width: 120upx;
		background: #DDDDDD;
		color: #FFFFFF;
		font-size: 25upx;
	}
	.confirm {
		background: #FF6354;
	}
	/* 动画 */
	.option-pull { /* 背景窗体放大 */
		animation: option-pull 1s 1 forwards;
	}
	.textarea-pull { /* 文本域放大 */
		animation: textarea-pull 1s 1 forwards;
	}
	@keyframes option-pull{
		from{
			width: 100%;
			height: 240upx;
			border-top: none;
		}
		to{
			width: 100%;
			height: 100%;
			border-top: 1px solid #DDDDDD;
		}
	}
	@keyframes textarea-pull{
		from{
			width: 82%;
			height: 200upx;
			border: 1px solid #DDDDDD;
			border-radius: 10upx;
			margin-left: 3%;
			margin-top: 15upx;
			border-bottom: 0px solid #DDDDDD;
		}
		to{
			width: 100%;
			height: 85%;
			border: none;
			border-radius: 0upx;
			margin-left: 0;
			margin-top: 0;
			border-bottom: 1px solid #DDDDDD;
		}
	}
</style>
