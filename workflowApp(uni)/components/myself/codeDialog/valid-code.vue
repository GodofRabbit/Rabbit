<template><!-- 自定义密码框组件 -->
	<view v-if="showDialog">
		<view class="mask"></view>
		<view class="box__body">
			<view class="close" @tap="close"></view>
			<view class="box_title">请输入账户密码,完成身份验证</view>
			<view class="password-box">
				<view class="password-item" @tap="hanldeOpenKeyboard">
					<view class="password-item-char" v-for="i in items" :key="i">
						<view class="password-item-char__dot" v-if="password[i] || password[i] === 0"></view>
					</view>
				</view>
			</view>
		</view>
		<NumberKeyboard ref="keyboard" @number="inputCode" @delete="deleteCode" @clearAll="empty"></NumberKeyboard>
	</view>
</template>
<script>

	import NumberKeyboard from './number-keyboard.vue';
	export default {
		components: {
			NumberKeyboard
		},
		data() {
			return {
				items: [0, 1, 2, 3, 4, 5],
				showDialog: false,
				keyboardVisible: true,
				password: [],
			}
		},
		methods:{
			close(){//关闭身份验证弹层
				this.showDialog = false;
				this.password = [];
			},
			show(){
				this.showDialog = true;
				this.keyboardVisible = true;
			},
			hanldeOpenKeyboard() {//显示自定义键盘
				this.$refs.keyboard.show();
			},
			inputCode(e){
				this.password.push(e);
				if(this.password.length===6){
					this.$emit('check',this.password);
				}
			},
			deleteCode(){
				this.password.pop();
			},
			empty(){
				this.password = [];
			}
		}
				
	}
</script>

<style lang="scss" scoped>
	@import './valid-code.scss'
</style>
