<template>
	<view class="s-page-wrapper">
		<view class="s-page">
			<view class="is-100vh is-flex is-column is-justify-center is-align-center ">
				<image src="../../static/images/error/nonet.png" style="width: 50%;margin-top: -110px" mode="widthFix"></image>
				<center>
					<view class="has-title-color is-size-16 has-mgt-30">亲，网络断开连接</view>
					<view class="s-btn has-mgt-20 has-mgl-25">
						<navigator open-type="navigateBack" class="is-btn has-bg-red has-btn-radius ">返回上页</navigator>
					</view>
				</center>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title: 'Hello'
			};
		}
	}
</script>

<style>

</style>
