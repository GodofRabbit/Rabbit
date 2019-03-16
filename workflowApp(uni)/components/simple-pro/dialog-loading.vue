<template>
	<view class="">
		<view class='simple-load load-modal' v-if="loading"> 
			<image :src='loadImage' class='png' mode='aspectFit'></image>
			<view class='has-desc-color'>{{ loadText }}</view>
		</view>
	</view>
</template>

<script>
	import { mapState } from 'vuex'
	export default {
		computed:{
			...mapState(['loading', 'loadImage', 'loadText'])
		}
	}
</script>

<style scoped>
	image {
		border-radius: 5px;
	}
	.has-desc-color {
		margin-left: 65%;
	}
</style>
