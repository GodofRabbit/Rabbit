<template>
	<view>
		<view class="uni-card">
			<view class="uni-card-content">
				<view class="uni-card-content-inner">
					<label @tap="tap_finger">
						<view class="grace-list" hover-class="uni-list-cell-hover">
							<text class="grace-list-text">指纹识别</text>
							<mySwitch :checked="flag_finger"></mySwitch>
						</view>
					</label><br>
					<label @tap="tap_face">
						<view class="grace-list" hover-class="uni-list-cell-hover">
							<text class="grace-list-text">人脸识别</text>
							<mySwitch :checked="flag_face"></mySwitch>
						</view>
					</label>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import mySwitch from '@/components/myself/switch.vue';
	import { pathToBase64 } from '@/common/image-tools/index.js';
	export default {
		data() {
			return {
				flag_finger:false,
				flag_face:false
			};
		},
		components:{
			mySwitch
		},
		onShow(){
			let unlock = uni.getStorageSync('unlock');
			if(unlock==1){
				this.flag_finger = true;
			}else if(unlock==2){
				this.flag_face = true;
			}
		},
		methods:{
			tap_finger(){
				if(!this.flag_finger){//开启指纹识别
					if(!plus.fingerprint.isSupport()){
						plus.nativeUI.alert("当前设备不支持指纹识别");
						return false;
					}
					if(!plus.fingerprint.isKeyguardSecure()){
						plus.nativeUI.alert('当前设备未设置密码锁屏，无法使用指纹识别');
						return false;
					}
					if(!plus.fingerprint.isEnrolledFingerprints()) {
						plus.nativeUI.alert('当前设备未录入指纹，请到设置中录入');
					}else{
						uni.setStorageSync('unlock','1');
						this.flag_finger = true;
						this.flag_face = false;
					}
				}else {//关闭指纹解锁
					this.flag_finger = false;
					if(!this.flag_finger && !this.flag_face){//两个开关都关闭时移除
						uni.removeStorageSync('unlock');
					}
				} 
			},
			tap_face(){
				if(!this.flag_face){//开启人脸识别
					uni.showLoading({
						title: 'loading...',
						mask:true
					});
					let _self = this;
					let opNo = uni.getStorageSync('opNo');
					let saveName = opNo+'.jpg';
					this.$http.faceImgExist({saveName}).then(res=>{
						if(res.data.flag){
							uni.hideLoading();
							uni.setStorageSync('unlock','2');
							this.flag_face = true;
							this.flag_finger = false;
						}else {
							let cmr = plus.camera.getCamera();//图片默认保存在doc文件夹
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
												_self.$http.faceUpload({image: img,imgName:saveName,userId:opNo}).then(res=>{
													uni.hideLoading();
													if(res.data.flag){
														uni.setStorageSync('unlock','2');
														_self.flag_face = true;
														_self.flag_finger = false;
													}else {
														plus.nativeUI.toast('照片上传失败,请调整角度重试');
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
								uni.showToast({
									title: '照片上传失败',
									image: '../../static/images/common/data_error.png'
								})
							},{filename:"_doc/camera/"+saveName})
						}
					})
					
				}else {
					this.flag_face = false;
					if(!this.flag_finger && !this.flag_face){//两个开关都关闭时移除
						uni.removeStorageSync('unlock');
					}
				}
			}
		}
	}
</script>

<style scoped>
	.uni-card {
		width: 95%;
		border-radius: 10px;
		margin-left: 2.5%;
	}
	.grace-list {
		border-radius: 10px;
		width: 225%;
	}
</style>
