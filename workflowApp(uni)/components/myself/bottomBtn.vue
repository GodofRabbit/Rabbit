<template><!-- 审批详情页底部按钮组件 -->
	<view>
		<view class="bottom">
			<button class="approval-btn pend-btn" @tap="agree" hover-class="button-hover">同意</button>
			<button v-if="wkfState=='normal'" class="approval-btn pend-btn" @tap="veto" hover-class="button-hover">否决</button>
			<button v-if="wkfState=='vote'" class="approval-btn pend-btn" @tap="disagree" hover-class="button-hover">不同意</button>
			<button v-if="wkfState=='normal'" class="approval-btn back-btn" @tap="toback" hover-class="button-hover">退回</button><!-- 这里指退回初审 -->
		</view>
		<code-dialog ref="shui" @check="validate"></code-dialog>
		<finger-dialog ref="finger" @check="validfinger"></finger-dialog>
		<face-dialog ref="face" @check="validface" :now="nowFace"></face-dialog>
		<opinion ref="opin" :meetData="meetData" :option="option" :opinionType="opinionType" :wkfState="wkfState"></opinion>
	</view>
</template>

<script>
	import codeDialog from "@/components/myself/codeDialog/valid-code.vue";
	import fingerDialog from "@/components/myself/codeDialog/valid-finger.vue";
	import faceDialog from "@/components/myself/codeDialog/valid-face.vue";
	import opinion from "@/components/myself/opinion.vue";
	import md5 from "@/static/js/md5.min.js";
	import { pathToBase64 } from '@/common/image-tools/index.js';
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
			}
		},
		data(){
			return {
				nowFace:'',
				opinionType:'', //意见类型
				valiFlag:false  //验证是否通过标记
			}
		},
		methods:{
			agree(){
				this.opinionType = '1';
				//介于会议纪要只有'同意'按钮,暂且写在这里
				if(this.wkfState=='meet'){
					this.$emit('checkmeet');
				}else {
					this.showDialog();
				}
			},
			veto(){
				this.opinionType = '2';
				this.showDialog();
			},
			disagree(){
				this.opinionType = '5';
				this.showDialog();
			},
			toback(){
				this.opinionType = '4';
				this.showDialog();
			},
			showDialog(){
				let unlock = uni.getStorageSync('unlock');
				if(this.valiFlag){
					this.$refs.opin.show();
				}else {
					if(unlock==1){//指纹识别
						this.$refs.finger.show();
					}else if(unlock==2){//人脸识别
						uni.showModal({
							title:'身份验证',
							content:'进行人脸识别将打开摄像头',
							showCancel:true,
							success: res=> {
								if (res.confirm) {
									this.faceDete();
								}
							}
						})
					}else {//密码解锁 
						this.$refs.shui.show();
					}
				}
			},
			faceDete(){ 
				let _self = this;
				let userId = uni.getStorageSync('opNo');
				let cmr = plus.camera.getCamera();
				cmr.captureImage(function(path){//拍照后对图片进行压缩
					plus.io.resolveLocalFileSystemURL(path,function(entry){
						plus.zip.compressImage({
							src: entry.toLocalURL(),
							dst: entry.toLocalURL(),
							overwrite: true,
							format: "jpg",
							width: "30%"
						},function(zip){
							let file_url = zip.target;
							pathToBase64(file_url)
								.then(base64 => {
									let i = base64.indexOf(',')+1;
									let img = base64.slice(i);
									_self.nowFace = base64;
									_self.$forceUpdate();
									_self.$refs.face.show();
									_self.$http.faceMatch({image: img,userId}).then(res=>{
										if(res.data.flag){
											uni.showToast({
												title: '比对成功',
												image: '../../static/images/common/data_ok.png'
											})
											_self.$refs.face.close();
											_self.$refs.opin.show();
											_self.valiFlag = true;
										}else {
											plus.nativeUI.toast('识别失败，请重试');
										}
									})
								})
								.catch(error => {
									uni.hideLoading();
									uni.showToast({
										title: '照片上传失败',
										image: '../../static/images/common/data_error.png'
									})
								})
							
						})
					})
				},function(error){
					
				  },{filename:"_doc/camera/"})
			},
			validate(password){ //请求后台进行密码验证
				let opNo = uni.getStorageSync('opNo');
				let passwordhash = md5.base64(password.join(''));
				this.$http.checkUserPwd({opNo,passwordhash}).then(res=>{
					if(res.data.flag){
						this.valiFlag = true;
						uni.showToast({
							title: '验证通过',
							image: '../../static/images/common/data_ok.png'
						})
						setTimeout(()=>{
							this.$refs.shui.close();
							this.$refs.opin.show();
						},1000)
					}else {
						uni.showToast({
							title: '验证失败',
							image: '../../static/images/common/data_error.png'
						})
					}
				})
			},
			validfinger(){//指纹验证
				plus.fingerprint.authenticate(()=>{
					uni.showToast({
						title: '识别成功',
						image: '../../static/images/common/data_ok.png'
					})
					this.$refs.finger.close();
					this.$refs.opin.show();
					this.valiFlag = true;
				}, function(e){
					switch(e.code) {
						case e.AUTHENTICATE_MISMATCH:
							plus.nativeUI.toast('指纹匹配失败，请重新输入');
							break;
						case e.AUTHENTICATE_OVERLIMIT:
							plus.nativeUI.alert('指纹识别失败次数超出限制，请使用其它方式进行认证');
							break;
						/* default:
							mui.alert('指纹识别失败，请重试','','确定',null,'div');
							break; */
					}
				})
			}
		},
		components:{
			codeDialog,
			fingerDialog,
			faceDialog,
			opinion
		}
	}
</script>

<style scoped>
	.button-hover {
		opacity: 0.6;
	}
	.bottom {
		background-color: #FFFFFF;
		width: 100%;
		height: 100upx;
		border-top: 1px solid #EEEEEE;
		padding-top: 20upx;
		margin-top: -1.5%;
	}
	.approval-btn {
		width: 28%;
		height: 35px;
		border-radius: 60px;
		text-align: center;
		line-height: 75upx;
	}
	.pend-btn {
		color: #FFFFFF;
		background-color: #FF5A4A;
	}
	.back-btn {
		color: #FF5A4A;
		background-color: #FEEFED;
		border:2px solid #F8B1AA;
	}
</style>
