<template><!-- 自定义键盘组件 -->
	<view id="number-keyboard-component" class="numberkeyboard" v-show="numberKeyboardPopupVisible" :class="pattern">
		<view class="title" @tap="close"> 
			<image src="../../../static/images/common/down.png" style="width: 30upx;height: 30upx;"></image>
		</view>
		<view class="keys">
			<view hover-stay-time="50" hover-class="key-hover" class="key button" v-for="num in config.loop" :key="num.key" @tap="number(num.number)">{{num.number}}</view>
			<view hover-stay-time="50" hover-class="else-hover" class="key button else" @tap="clear">清空</view>
			<view hover-stay-time="50" hover-class="key-hover" class="key button" @tap="number(0)">0</view>
			<view hover-stay-time="50" hover-class="else-hover" class="key button else" @tap="del">
				<image src="../../../static/images/common/delete.png" style="width: 50upx;height: 50upx;"></image>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				config :{
					loop : [
						{
							number : 1,
							key : 'number-1',
						},
						{
							number : 2,
							key : 'number-2',
						},
						{
							number : 3,
							key : 'number-3',
						},
						{
							number : 4,
							key : 'number-4',
						},
						{
							number : 5,
							key : 'number-5',
						},
						{
							number : 6,
							key : 'number-6',
						},
						{
							number : 7,
							key : 'number-7',
						},
						{
							number : 8,
							key : 'number-8',
						},
						{
							number : 9,
							key : 'number-9',
						},
					]
				},
				numberKeyboardPopupVisible: true,
				pattern:''
			};
		},
		methods: {
			show(){//直接设值，页面未重新渲染，才出此下策
				this.numberKeyboardPopupVisible = true;
				this.pattern = 'slideup';
			},
			close(){
				this.pattern = 'slidedown';
				this.numberKeyboardPopupVisible = false;
			},
			del() {
				this.$emit("delete");
			},
			clear(){
				this.$emit("clearAll");
			},
			number(number) {
				this.$emit("number", number);
			}
		}
	}
</script>

<style scoped lang="scss">
	@import './number-keyboard.scss'
</style>
