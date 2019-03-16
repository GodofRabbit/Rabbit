<template>
	<view>
		<view class="uni-list-cell" hover-class="uni-list-cell-hover" v-for="(item,index) in user" :key="index">
			<view class="uni-list-cell-navigate">
				<view class="name">{{ item.name }}:</view>
				<view class="no-info" v-if="item.value=='暂无'">{{ item.value }}</view>
				<view class="info" v-else>{{ item.value }}</view>
			</view>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		computed: {
			...mapState(['userInfo']),
			user: function(){
				let sex = this.userInfo.sex=='1'?'女':'男';
				let user = [
					{'name':'姓名','value':this.userInfo.opName || '暂无'},
					{'name':'性别','value': sex },
					{'name':'生日','value':this.userInfo.birthday || '暂无'},
					{'name':'职位','value':this.userInfo.job || '暂无'},
					{'name':'身份证','value':this.userInfo.idNo || '暂无'},
					{'name':'邮箱','value':this.userInfo.email || '暂无'},
					{'name':'手机','value':this.userInfo.mobile || '暂无'},
					{'name':'办公电话','value':this.userInfo.businesstelephone || '暂无'},
				];
				return user;
			}
		}
	}
</script>

<style>
	page {
		background-color: #FFFFFF;
	}
	.info,.no-info {
		width: 40%;
		text-align: right;
	}
	.name,.info,.no-info {
		display: inline-block;
		font-size: 14px;
	}
	.name {
		width: 60%;
		color: #8b8b8b;
		font-weight: bold;
	}
	.no-info {
		font-size: 12px;
		font-style: italic;
		color: gray;
	}
</style>
