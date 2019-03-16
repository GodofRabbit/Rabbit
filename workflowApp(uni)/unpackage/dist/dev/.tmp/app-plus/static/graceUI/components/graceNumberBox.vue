<template name="graceNumberBox">
	<view class="grace-number-box">
		<view class="doBtn" @tap="reduce">-</view>
		<input type="number" :value="inputNumber" :id="numberBoxId" @change="numberChange"></input>
		<view class="doBtn" @tap="add">+</view>
	</view>
</template>
<script>
export default {
	name: "graceNumberBox",
	props: {
		inputNumber : {
			type : Number,
			default : 0 
		},
		maxNum:{
			type: Number,
			default: 20
		},
		minNum: {
			type: Number,
			default: 1
		},
		numberBoxId :{
			type: String,
			default: 'numberBox_'
		}
	},
	methods: {
		add : function(){
			var newVal = this.inputNumber + 1;
			if (newVal > this.maxNum) { return; }
			this.inputNumber = newVal;
			this.numberChangeDo(newVal);
		},
		reduce: function () {
			var newVal = this.inputNumber - 1;
			if (newVal <= this.minNum){return ;}
			this.inputNumber = newVal;
			this.numberChangeDo(newVal);
		},
		numberChange : function(e){
			var newVal = e.detail.value;
			if (newVal > this.maxNum) {newVal = this.maxNum;}
			if (newVal < this.minNum) {newVal = this.minNum;}
			this.inputNumber = newVal;
			this.numberChangeDo(newVal);
		},
		numberChangeDo : function(val){
			this.$emit('numberBoxEvent', val, this.numberBoxId);
		}
  }
}
</script>
<style>
.grace-number-box{width:220rpx;}
.grace-number-box .doBtn{width:65rpx; line-height:50rpx; background:#FFFFFF; color:#000; justify-content:center; font-size:50rpx;}
.grace-number-box input{width:90rpx; height:30rpx; line-height:30rpx; color:#000; padding:10rpx 0; background:#F6F6F6; text-align:center;}
</style>