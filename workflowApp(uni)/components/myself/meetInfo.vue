<template><!-- 会议纪要组件 -->
	<view>
		<view class="uni-list-cell" v-for="(item,index) in info" :key="index">
			<view class="uni-list-cell-navigate">
				<view class="name">{{ item.name }}:</view>
				<view class="info"><input type="text" placeholder="必填" :name="item.subname" v-model="item.value" placeholder-style="color: red;font-style: italic;"></view>
			</view>
		</view>
		<view class="uni-list-cell"  @tap="onShowDatePicker">
			<view class="uni-list-cell-navigate">
				<view class="name">会议时间:</view>
				<view class="info sele" v-if="selectTime==''">选择</view>
				<view class="info" v-else>{{ selectTime }}</view>
			</view>
		</view>
		<view class="uni-list-cell">
			<view class="uni-list-cell-navigate">
				<view class="name">会议纪要:</view>
				<textarea name="meetSummary" placeholder="必填" v-model="meetcontent" placeholder-style="color: red;font-style: italic;"></textarea>
			</view>
		</view>
		<mx-datepicker v-model="showPicker" init="2019-02-13 00:00:00" type="datetime" @selected="onSelected" />
	</view>
</template>

<script>
	import MxDatepicker from "@/components/base/mx-datepicker.vue";
	export default{
		data(){
			return{
				showPicker: false,
				selectTime:'',
				meetcontent:'',
				info:[
					{name:'会号',subname:'meetNo',value:''},
					{name:'出席人员',subname:'meetPeople',value:''},
					{name:'缺席人员',subname:'noMeet',value:''},
					{name:'投委会秘书',subname:'secretary',value:''}
				]
			}
		},
		methods:{
			onShowDatePicker(){//显示
				uni.hideKeyboard();
                this.showPicker = true;
            },
            onSelected(data) {//选择
                this.selectTime = data.value;
            },
			checkmeet(){
				let flag = true;
				this.info.forEach((item,index)=>{
					let i = item.value.trim();
					if(i==''){
						flag = false;
					}
				})
				if(this.selectTime==''){
					flag = false;
				}
				if(this.meetcontent==''){
					flag = false;
				}
				if(flag){//传递数据给父组件
					let ajaxData = '[{"name":"meetNo","value":"'+this.info[0].value+'"},{"name":"meetPeople","value":"'+this.info[1].value+'"},{"name":"noMeet","value":"'+this.info[2].value+'"},{"name":"secretary","value":"'+this.info[3].value+'"},{"name":"meetDate","value":"'+this.selectTime+'"},{"name":"meetSummary","value":"'+this.meetcontent+'"}]';
					this.$emit('showvalid',ajaxData);
				}else {
					plus.nativeUI.toast('请先完善会议纪要');
					this.$emit('movetab');
				}
			}
		},
		components: {
            MxDatepicker
        }
	}
</script>

<style scoped>
	.name,.info {
		display: inline-block;
		font-size: 13px;
		color: #000000;
	}
	.name {
		width: 30%;
		text-align: left;
	}
	.info {
		width: 70%;
		text-align: right;
	}
	textarea {
		border: 1px solid #DDDDDD;
		border-radius: 10upx;
		text-align: left;
		margin-left: 5%;
		height: 280upx;
	}
	.sele {
		color: red;
		font-style: italic;
	}
</style>
