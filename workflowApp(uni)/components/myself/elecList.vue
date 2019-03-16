<template><!-- 电子资料组件 -->
	<view>
		<scroll-view scroll-y="true" class="scroll-area" v-if="eleSource.length!=0" :class="[genre==0?'':'extend']">
			<view class="uni-card">
				<view class="uni-card-content">
					<view class="uni-card-content-inner">
						<view class="uni-list">
							<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(elec,index) in eleSource" :key="index" @tap="download(elec.saveName,elec.docName,index)">
								<view class="uni-list-cell-navigate uni-navigate-right uni-media-list ">
									<view class="uni-media-list-logo">
										<image v-if="elec.docType=='img'" :src="imgThumb+elec.saveName"/>
										<image v-else-if="elec.docType=='word'" src="../../static/images/fileicons/word.png"/>
										<image v-else-if="elec.docType=='excel'" src="../../static/images/fileicons/excel.png"/>
										<image v-else-if="elec.docType=='ppt'" src="../../static/images/fileicons/ppt.png"/>
										<image v-else-if="elec.docType=='pdf'" src="../../static/images/fileicons/pdf.png"/>
										<image v-else-if="elec.docType=='txt'" src="../../static/images/fileicons/text.png"/>
										<image v-else-if="elec.docType=='audio'" src="../../static/images/fileicons/audio.png"/>
										<image v-else-if="elec.docType=='video'" src="../../static/images/fileicons/video.png"/>
										<image v-else src="../../static/images/fileicons/other.png"/>
									</view>
									<view class="uni-media-list-body">
										<view class="uni-media-list-text-top">{{ elec.docName }}</view>
										<view class="uni-media-list-text-bottom uni-ellipsis">
											{{ elec.uploadTime }}
											<progress v-if="elec.state" :percent="elec.rate" show-info stroke-width="3" activeColor="#FF6354" />
										</view>
									</view>
								</view>
							</view>
						</view>
					</view>
				</view>
			</view>
		</scroll-view>
		<view v-else class="s-page-wrapper">
			<view class="s-page">
				<view class="is-100vh is-flex is-column is-justify-center is-align-center ">
					<image src="../../static/images/error/no.png" style="width: 50%;" mode="widthFix"></image>
					<view class="has-title-color is-size-16 has-mgt-30">亲，还未上传资料</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	import _config from '@/http/config.js';
	export default{
		props:{
			eleSource:{
				type: Object,
				default: function(e) {
				    return {}
				}
			},
			genre:{
				type:Number,
				default: function(e) {
				    return {}
				}
			}
		},
		computed:{
			imgThumb(){
				return _config.url+this.$http.imgThumb;
			}
		},
		methods:{
			download(saveName,docName,index){
			    let doc = '_doc/download/'+docName;
			    plus.io.resolveLocalFileSystemURL(doc, ()=>{//检查本地是否含有该文件
						plus.runtime.openFile(doc, {}, function ( e ) {//文件已存在，直接调用第三方应用选择打开文件
							uni.showModal({title: '提示',content: '文件打开失败',showCancel:false});
					 	})
			        }, ()=>{//本地不存在该文件，先去判断文件是否移除，再去判断是否需要请求下载
			        	this.fileIsExist(saveName,docName,index);
			    })    
			},
			fileIsExist(saveName,docName,index){
				let url = _config.url+this.$http.downloadFile+saveName;
				this.$http.fileIsExist({saveName}).then(res=>{
					if(res.data.flag){
						uni.showModal({title: '提示',content: '文件需下载后查看',confirmText:'下载',
							success:res=>{
								if (res.confirm) {
									this.downloadFile(docName,url,index);
								}
							}
						});
					}else {
						uni.showModal({title: '提示',content: '文件已移除',showCancel:false});
					}
				})
			},
			downloadFile(docName,url,index){
				let dtask = null;
			    let options = {method:"GET",filename:'_doc/download/'+docName+''};
			    dtask = plus.downloader.createDownload( url, options );
			    dtask.addEventListener( "statechanged", (task,status)=>{              
			        switch(task.state) {
			            case 1: // 开始
			            	break;
			            case 2: // 已连接到服务器,显示进度条
							this.eleSource[index].state = true;
			            	break;
			            case 3: // 已接收到数据
			                let aldown = parseInt((task.downloadedSize/task.totalSize).toFixed(2)*100);
							this.eleSource[index].rate = aldown;
			            	break;
			            case 4: // 下载完成
			                if(status == 200){
								this.eleSource[index].state = false;
								plus.nativeUI.toast('下载完成');
								plus.runtime.openFile( task.filename, {}, function ( e ) {//调用第三方应用打开文件
									uni.showModal({title: '提示',content: '文件打开失败',showCancel:false});
								})
						    }else {
							    uni.showModal({title: '提示',content: '下载失败,请重试',showCancel:false});
			                }
			            	break;
			        }
			    } );
			    dtask.start();         
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
	.uni-card {
		width: 95%;
		border-radius: 10px;
		margin-left: 2.5%;
	}
	.uni-media-list-text-top {
		color: #000000;
	}
	.s-page {
		margin-top: -40%;
	}
	.has-title-color {
		margin-left: 65%;
	}
	.uni-media-list-body {
		height: 95upx;
	}
</style>
