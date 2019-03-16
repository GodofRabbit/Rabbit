import https from './interface'

/**
 * 将所有接口统一起来便于维护
 * 如果项目很大可以将 url 独立成文件，接口分成不同的模块
 * handle [boolean] 如果需要自己处理 catch 请求 ，传入 true ，交给接口统一处理 ，请传入 false或不传
 */

// 单独导出

//登录
export const login = (data) => {
    return https({
        url: 'AppLoginAjax_loginAjax.action',
        data,
		handle:true
    })
}
//首页：总投资金额
export const getTotalInvest = () => {
	return https({
	    url: 'MobileWebServiceActionAjax_getTotalInvest.action'
	})
}
//首页：投资收益
export const getInvestProfit = () => {
	return https({
	    url: 'MobileWebServiceActionAjax_getInvestProfit.action'
	})
}
//首页：投资概况
export const getInvestSurveyType = () => {
	return https({
	    url: 'MobileWebServiceActionAjax_getInvestSurveyType.action'
	})
}
//首页=>投资概况列表页：投资类型对应列表数据
export const getInvestSurvey = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getInvestSurvey.action',
		data
	})
}
//首页=>投资概况列表页=>详情页：详细信息
export const getSurveyDetial = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getSurveyDetial.action',
		data
	})
}
//首页：消息条数
export const getUnReadInfoNum = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getUnReadInfoSizeAjax.action',
		data
	})
}
//首页=>消息页：消息列表
export const getMessageList = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getMessageListAjax.action',
		data
	})
}
//首页=>消息页：批量删除消息
export const deleteInfo = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_deleteInfoAjax.action',
		data
	})
}
//首页=>消息页：标记为已读
export const updateInfo = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_updateAllInfoPtsAjax.action',
		data
	})
}
//审批页：审批任务查询
export const sloveInfo = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_sloveInfoAppAjax.action',
		data
	})
}
//审批页=>详情页面：基本信息
export const getDetailData = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getDetailDataAjax.action',
		data
	})
}
//审批页=>详情页面：电子资料
export const getDocInfoList = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getDocInfoList.action',
		data
	})
}
//审批页=>详情页面：电子资料缩略图
export const imgThumb = 'MobileWebServiceActionAjax_openThumbnailFrontAction.action?saveName='
//审批页=>详情页面：电子资料是否移除
export const fileIsExist = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_fileIsExistAjax.action',
		data
	})
}
//审批页=>详情页面：电子资料下载
export const downloadFile = 'MobileWebServiceActionAjax_downloadFileAjax.action?saveName='
//审批页=>详情页面：流程节点
export const getWkfRecords = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_getWkfRecords.action',
		data
	})
}
//审批页=>详情页面：上传会议纪要
export const insertLineMeet = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_insertLineMeetAjax.action',
		data
	})
}
//审批页=>详情页面：发起流程审批
export const doProcess = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_doProcess.action',
		data
	})
}
//我的=>密码修改页：原密码验证
export const checkUserPwd = (data) => {
	return https({
	    url: 'AppLoginAjax_checkUserPwdAjax.action',
		data
	})
}
//我的=>密码修改页：密码修改
export const changePassWord = (data) => {
	return https({
	    url: 'AppLoginAjax_changePassWordAjax.action',
		data
	})
}
//我的=>检查更新
export const checkUpdate = (data) => {
	return https({
	    url: 'AppLoginAjax_checkVersionAppAjax.action',
		data
	})
}
//我的=>设置：人脸识别检测是否已上传人脸照片
export const faceImgExist = (data) => {
	return https({
	    url: 'AipFaceActionAjax_fileIsExistAjax.action',
		data
	})
}
//我的=>设置：人脸识别上传照片
export const faceUpload = (data) => {
	return https({
	    url: 'AipFaceActionAjax_addUserFace.action',
		data
	})
}
//审批 =>详情页：已上传人脸照片
export const faceUrl = 'AipFaceActionAjax_downloadAipFaceImgAjax.action?saveName='
//审批 =>详情页：人脸识别比较
export const faceMatch = (data) => {
	return https({
	    url: 'AipFaceActionAjax_match.action',
		data
	})
}
//登录时存储clientId
export const saveClientId = (data) => {
	return https({
	    url: 'MobileWebServiceActionAjax_saveClientIdAjax.action',
		data
	})
}
//统计页=>投资分布统计：投资品种分布
export const industry = () => {
	return https({
	    url: 'MobileWebServiceActionAjax_getDeliveryInvestData.action'
	})
}
//统计页=>投资分布统计：项目期限占比
export const deadline = () => {
	return https({
	    url: 'MobileWebServiceActionAjax_getDeadlineData.action'
	})
}
//统计页：投资分布统计=>交易对手投资详情
export const getInvestByCusMap = () => {
	return https({
	    url: 'MobileWebServiceActionAjax_getInvestByCusMap.action'
	})
}

// 默认全部导出
export default {
    login,
	industry,
	getTotalInvest,
	getInvestProfit,
	getInvestSurveyType,
	getInvestSurvey,
	getSurveyDetial,
	checkUserPwd,
	changePassWord,
	checkUpdate,
	getUnReadInfoNum,
	sloveInfo,
	getDetailData,
	getDocInfoList,
	getWkfRecords,
	imgThumb,
	fileIsExist,
	downloadFile,
	faceImgExist,
	faceUpload,
	faceUrl,
	faceMatch,
	insertLineMeet,
	doProcess,
	saveClientId,
	getInvestByCusMap,
	deadline,
	getMessageList,
	deleteInfo,
	updateInfo
}