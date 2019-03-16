注意：1.在uni中，组件传值采用props，经常会出现页面未重新渲染的情况，故采用了this.$refs的形式;
	   2.App 平台同时支持网络网页和本地网页，但本地网页及相关资源（js、css等文件）必须放在 uni-app 项目
	   根目录->hybrid->html 文件夹下
		 3.stats文件夹下income.vue、investment.vue、maturityIncome.vue页面指向本地html网页,其中domainUrl是写死的，
			每次更换服务器注意修改
	
已知Bug: 1.审批详情页，下载电子档案后，弹出第三方打开方式，取消后，页签会返回到第一个；
	     2.意见弹框，获取焦点，键盘会闪一下再收进去，目前采用强制弹出软键盘的方式；
	     3.echarts图表存在问题，故采用本地网页(html)的形式