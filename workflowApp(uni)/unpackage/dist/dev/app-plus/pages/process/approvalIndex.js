// { "framework": "Vue"} 

/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue?entry");
/******/ })
/************************************************************************/
/******/ ({

/***/ "../../../HBuilderProjects/demo/common/util.js":
/*!*********************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/common/util.js ***!
  \*********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
Object.defineProperty(exports, "__esModule", { value: true });exports.friendlyDate = friendlyDate;function friendlyDate(timestamp) {
  var formats = {
    'year': '%n% 年前',
    'month': '%n% 月前',
    'day': '%n% 天前',
    'hour': '%n% 小时前',
    'minute': '%n% 分钟前',
    'second': '%n% 秒前' };


  var now = Date.now();
  var seconds = Math.floor((now - timestamp) / 1000);
  var minutes = Math.floor(seconds / 60);
  var hours = Math.floor(minutes / 60);
  var days = Math.floor(hours / 24);
  var months = Math.floor(days / 30);
  var years = Math.floor(months / 12);

  var diffType = '';
  var diffValue = 0;
  if (years > 0) {
    diffType = 'year';
    diffValue = years;
  } else {
    if (months > 0) {
      diffType = 'month';
      diffValue = months;
    } else {
      if (days > 0) {
        diffType = 'day';
        diffValue = days;
      } else {
        if (hours > 0) {
          diffType = 'hour';
          diffValue = hours;
        } else {
          if (minutes > 0) {
            diffType = 'minute';
            diffValue = minutes;
          } else {
            diffType = 'second';
            diffValue = seconds === 0 ? seconds = 1 : seconds;
          }
        }
      }
    }
  }
  return formats[diffType].replace('%n%', diffValue);
}

/***/ }),

/***/ "../../../HBuilderProjects/demo/components/base/uni-tab-bar.nvue":
/*!***************************************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/components/base/uni-tab-bar.nvue ***!
  \***************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* script */
__vue_exports__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/script-loader!babel-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=script&index=0!./uni-tab-bar.nvue */ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/base/uni-tab-bar.nvue")
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "E:\\HBuilderX\\HBuilderProjects\\demo\\components\\base\\uni-tab-bar.nvue"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),

/***/ "../../../HBuilderProjects/demo/components/base/uni-tab-content.nvue":
/*!*******************************************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/components/base/uni-tab-content.nvue ***!
  \*******************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* script */
__vue_exports__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/script-loader!babel-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=script&index=0!./uni-tab-content.nvue */ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/base/uni-tab-content.nvue")
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "E:\\HBuilderX\\HBuilderProjects\\demo\\components\\base\\uni-tab-content.nvue"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),

/***/ "../../../HBuilderProjects/demo/components/base/uni-tabs.nvue":
/*!************************************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/components/base/uni-tabs.nvue ***!
  \************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* script */
__vue_exports__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/script-loader!babel-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=script&index=0!./uni-tabs.nvue */ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/base/uni-tabs.nvue")
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "E:\\HBuilderX\\HBuilderProjects\\demo\\components\\base\\uni-tabs.nvue"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),

/***/ "../../../HBuilderProjects/demo/components/myself/listTemp.nvue":
/*!**************************************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/components/myself/listTemp.nvue ***!
  \**************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/style-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/style-rewriter?id=data-v-93b03034!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=styles&index=0!./listTemp.nvue */ "./node_modules/weex-vue-loader/lib/style-loader.js!./node_modules/weex-vue-loader/lib/style-rewriter.js?id=data-v-93b03034!./node_modules/weex-vue-loader/lib/selector.js?type=styles&index=0!../../../HBuilderProjects/demo/components/myself/listTemp.nvue")
)

/* script */
__vue_exports__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/script-loader!babel-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=script&index=0!./listTemp.nvue */ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/myself/listTemp.nvue")

/* template */
var __vue_template__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/template-compiler?id=data-v-93b03034!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=template&index=0!./listTemp.nvue */ "./node_modules/weex-vue-loader/lib/template-compiler.js?id=data-v-93b03034!./node_modules/weex-vue-loader/lib/selector.js?type=template&index=0!../../../HBuilderProjects/demo/components/myself/listTemp.nvue")
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "E:\\HBuilderX\\HBuilderProjects\\demo\\components\\myself\\listTemp.nvue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-93b03034"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__


/***/ }),

/***/ "../../../HBuilderProjects/demo/http/config.js":
/*!*********************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/http/config.js ***!
  \*********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
Object.defineProperty(exports, "__esModule", { value: true });exports.default = void 0; //  http 请求配置项
var _default = {
  //	开发者服务器接口地址
  url: "http://192.168.101.180:8080/fund/",
  //	请求的参数	
  data: {},
  //	设置请求的 header，header 中不能设置 Referer。
  header: { 'content-type': 'application/x-www-form-urlencoded' },
  //	（需大写）有效值：OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT	
  method: "POST",
  //	json	如果设为json，会尝试对返回的数据做一次 JSON.parse	
  dataType: "json",
  //	text	设置响应的数据类型。合法值：text、arraybuffer	1.7.0
  responseType: "text",
  //	收到开发者服务成功返回的回调函数	
  success: function success() {},
  //	接口调用失败的回调函数	
  fail: function fail() {},
  //	接口调用结束的回调函数（调用成功、失败都会执行）
  complete: function complete() {} };exports.default = _default;

/***/ }),

/***/ "../../../HBuilderProjects/demo/http/index.js":
/*!********************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/http/index.js ***!
  \********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
Object.defineProperty(exports, "__esModule", { value: true });exports.default = exports.getInvestByCusMap = exports.deadline = exports.industry = exports.saveClientId = exports.faceMatch = exports.faceUrl = exports.faceUpload = exports.faceImgExist = exports.checkUpdate = exports.changePassWord = exports.checkUserPwd = exports.doProcess = exports.insertLineMeet = exports.getWkfRecords = exports.downloadFile = exports.fileIsExist = exports.imgThumb = exports.getDocInfoList = exports.getDetailData = exports.sloveInfo = exports.updateInfo = exports.deleteInfo = exports.getMessageList = exports.getUnReadInfoNum = exports.getSurveyDetial = exports.getInvestSurvey = exports.getInvestSurveyType = exports.getInvestProfit = exports.getTotalInvest = exports.login = void 0;var _interface = _interopRequireDefault(__webpack_require__(/*! ./interface */ "../../../HBuilderProjects/demo/http/interface.js"));function _interopRequireDefault(obj) {return obj && obj.__esModule ? obj : { default: obj };}

/**
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 * 将所有接口统一起来便于维护
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 * 如果项目很大可以将 url 独立成文件，接口分成不同的模块
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 * handle [boolean] 如果需要自己处理 catch 请求 ，传入 true ，交给接口统一处理 ，请传入 false或不传
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 */

// 单独导出

//登录
var login = function login(data) {
  return (0, _interface.default)({
    url: 'AppLoginAjax_loginAjax.action',
    data: data,
    handle: true });

};
//首页：总投资金额
exports.login = login;var getTotalInvest = function getTotalInvest() {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getTotalInvest.action' });

};
//首页：投资收益
exports.getTotalInvest = getTotalInvest;var getInvestProfit = function getInvestProfit() {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getInvestProfit.action' });

};
//首页：投资概况
exports.getInvestProfit = getInvestProfit;var getInvestSurveyType = function getInvestSurveyType() {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getInvestSurveyType.action' });

};
//首页=>投资概况列表页：投资类型对应列表数据
exports.getInvestSurveyType = getInvestSurveyType;var getInvestSurvey = function getInvestSurvey(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getInvestSurvey.action',
    data: data });

};
//首页=>投资概况列表页=>详情页：详细信息
exports.getInvestSurvey = getInvestSurvey;var getSurveyDetial = function getSurveyDetial(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getSurveyDetial.action',
    data: data });

};
//首页：消息条数
exports.getSurveyDetial = getSurveyDetial;var getUnReadInfoNum = function getUnReadInfoNum(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getUnReadInfoSizeAjax.action',
    data: data });

};
//首页=>消息页：消息列表
exports.getUnReadInfoNum = getUnReadInfoNum;var getMessageList = function getMessageList(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getMessageListAjax.action',
    data: data });

};
//首页=>消息页：批量删除消息
exports.getMessageList = getMessageList;var deleteInfo = function deleteInfo(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_deleteInfoAjax.action',
    data: data });

};
//首页=>消息页：标记为已读
exports.deleteInfo = deleteInfo;var updateInfo = function updateInfo(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_updateAllInfoPtsAjax.action',
    data: data });

};
//审批页：审批任务查询
exports.updateInfo = updateInfo;var sloveInfo = function sloveInfo(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_sloveInfoAppAjax.action',
    data: data });

};
//审批页=>详情页面：基本信息
exports.sloveInfo = sloveInfo;var getDetailData = function getDetailData(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getDetailDataAjax.action',
    data: data });

};
//审批页=>详情页面：电子资料
exports.getDetailData = getDetailData;var getDocInfoList = function getDocInfoList(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getDocInfoList.action',
    data: data });

};
//审批页=>详情页面：电子资料缩略图
exports.getDocInfoList = getDocInfoList;var imgThumb = 'MobileWebServiceActionAjax_openThumbnailFrontAction.action?saveName=';
//审批页=>详情页面：电子资料是否移除
exports.imgThumb = imgThumb;var fileIsExist = function fileIsExist(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_fileIsExistAjax.action',
    data: data });

};
//审批页=>详情页面：电子资料下载
exports.fileIsExist = fileIsExist;var downloadFile = 'MobileWebServiceActionAjax_downloadFileAjax.action?saveName=';
//审批页=>详情页面：流程节点
exports.downloadFile = downloadFile;var getWkfRecords = function getWkfRecords(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getWkfRecords.action',
    data: data });

};
//审批页=>详情页面：上传会议纪要
exports.getWkfRecords = getWkfRecords;var insertLineMeet = function insertLineMeet(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_insertLineMeetAjax.action',
    data: data });

};
//审批页=>详情页面：发起流程审批
exports.insertLineMeet = insertLineMeet;var doProcess = function doProcess(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_doProcess.action',
    data: data });

};
//我的=>密码修改页：原密码验证
exports.doProcess = doProcess;var checkUserPwd = function checkUserPwd(data) {
  return (0, _interface.default)({
    url: 'AppLoginAjax_checkUserPwdAjax.action',
    data: data });

};
//我的=>密码修改页：密码修改
exports.checkUserPwd = checkUserPwd;var changePassWord = function changePassWord(data) {
  return (0, _interface.default)({
    url: 'AppLoginAjax_changePassWordAjax.action',
    data: data });

};
//我的=>检查更新
exports.changePassWord = changePassWord;var checkUpdate = function checkUpdate(data) {
  return (0, _interface.default)({
    url: 'AppLoginAjax_checkVersionAppAjax.action',
    data: data });

};
//我的=>设置：人脸识别检测是否已上传人脸照片
exports.checkUpdate = checkUpdate;var faceImgExist = function faceImgExist(data) {
  return (0, _interface.default)({
    url: 'AipFaceActionAjax_fileIsExistAjax.action',
    data: data });

};
//我的=>设置：人脸识别上传照片
exports.faceImgExist = faceImgExist;var faceUpload = function faceUpload(data) {
  return (0, _interface.default)({
    url: 'AipFaceActionAjax_addUserFace.action',
    data: data });

};
//审批 =>详情页：已上传人脸照片
exports.faceUpload = faceUpload;var faceUrl = 'AipFaceActionAjax_downloadAipFaceImgAjax.action?saveName=';
//审批 =>详情页：人脸识别比较
exports.faceUrl = faceUrl;var faceMatch = function faceMatch(data) {
  return (0, _interface.default)({
    url: 'AipFaceActionAjax_match.action',
    data: data });

};
//登录时存储clientId
exports.faceMatch = faceMatch;var saveClientId = function saveClientId(data) {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_saveClientIdAjax.action',
    data: data });

};
//统计页=>投资分布统计：投资品种分布
exports.saveClientId = saveClientId;var industry = function industry() {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getDeliveryInvestData.action' });

};
//统计页=>投资分布统计：项目期限占比
exports.industry = industry;var deadline = function deadline() {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getDeadlineData.action' });

};
//统计页：投资分布统计=>交易对手投资详情
exports.deadline = deadline;var getInvestByCusMap = function getInvestByCusMap() {
  return (0, _interface.default)({
    url: 'MobileWebServiceActionAjax_getInvestByCusMap.action' });

};

// 默认全部导出
exports.getInvestByCusMap = getInvestByCusMap;var _default = {
  login: login,
  industry: industry,
  getTotalInvest: getTotalInvest,
  getInvestProfit: getInvestProfit,
  getInvestSurveyType: getInvestSurveyType,
  getInvestSurvey: getInvestSurvey,
  getSurveyDetial: getSurveyDetial,
  checkUserPwd: checkUserPwd,
  changePassWord: changePassWord,
  checkUpdate: checkUpdate,
  getUnReadInfoNum: getUnReadInfoNum,
  sloveInfo: sloveInfo,
  getDetailData: getDetailData,
  getDocInfoList: getDocInfoList,
  getWkfRecords: getWkfRecords,
  imgThumb: imgThumb,
  fileIsExist: fileIsExist,
  downloadFile: downloadFile,
  faceImgExist: faceImgExist,
  faceUpload: faceUpload,
  faceUrl: faceUrl,
  faceMatch: faceMatch,
  insertLineMeet: insertLineMeet,
  doProcess: doProcess,
  saveClientId: saveClientId,
  getInvestByCusMap: getInvestByCusMap,
  deadline: deadline,
  getMessageList: getMessageList,
  deleteInfo: deleteInfo,
  updateInfo: updateInfo };exports.default = _default;

/***/ }),

/***/ "../../../HBuilderProjects/demo/http/interface.js":
/*!************************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/http/interface.js ***!
  \************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(uni) {Object.defineProperty(exports, "__esModule", { value: true });exports.default = $http;var _config2 = _interopRequireDefault(__webpack_require__(/*! ./config */ "../../../HBuilderProjects/demo/http/config.js"));function _interopRequireDefault(obj) {return obj && obj.__esModule ? obj : { default: obj };} // 导入私有配置

function $http(options) {
  options.url = _config2.default.url + options.url;
  return new Promise(function (resolve, reject) {
    // 进行url字符串拼接
    // 拦截请求
    _config2.default.complete = function (response) {
      //  request請求访问成功
      if (response.statusCode === 200) {
        // 接口请求成功
        resolve(response);
      } else {
        // 处理catch 请求，不在本页面之外处理，统一在这里处理
        if (options.handle) {
          reject(response);
        } else {
          try {
            Promise.reject(response).catch(function (err) {
              // console.error(err);  
              _page_error(response.statusCode || response.errMsg);
            });
          } catch (e) {
            console.log(e);
          }
        }
      }

    };
    // 开始请求
    uni.request(Object.assign({}, _config2.default, options));
  });
}

// 接口錯誤
function _error(err) {var msg = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '';
  switch (err) {
    case 400:
      console.error(msg);
      // 错误码400的处理方式
      break;}

}
// request 錯誤
function _page_error(err) {
  switch (err) {
    case 401:
      uni.showToast({
        title: '请求被拒绝',
        image: '../static/images/common/data_error.png' });

      break;
    case 404:
      uni.showToast({
        title: '没有找到页面',
        image: '../static/images/common/data_error.png' });

      break;
    case 405:
      uni.showToast({
        title: '错误的请求',
        image: '../static/images/common/data_error.png' });

      break;}

}
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js */ "./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js")["default"]))

/***/ }),

/***/ "../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue?entry":
/*!*********************************************************************************!*\
  !*** E:/HBuilderX/HBuilderProjects/demo/pages/process/approvalIndex.nvue?entry ***!
  \*********************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/style-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/style-rewriter?id=data-v-0882a4ac!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=styles&index=0!./approvalIndex.nvue */ "./node_modules/weex-vue-loader/lib/style-loader.js!./node_modules/weex-vue-loader/lib/style-rewriter.js?id=data-v-0882a4ac!./node_modules/weex-vue-loader/lib/selector.js?type=styles&index=0!../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue")
)

/* script */
__vue_exports__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/script-loader!babel-loader!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=script&index=0!./approvalIndex.nvue */ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue")

/* template */
var __vue_template__ = __webpack_require__(/*! !../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/template-compiler?id=data-v-0882a4ac!../../../../HBuilderX/plugins/uniapp-cli/node_modules/weex-vue-loader/lib/selector?type=template&index=0!./approvalIndex.nvue */ "./node_modules/weex-vue-loader/lib/template-compiler.js?id=data-v-0882a4ac!./node_modules/weex-vue-loader/lib/selector.js?type=template&index=0!../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue")
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "E:\\HBuilderX\\HBuilderProjects\\demo\\pages\\process\\approvalIndex.nvue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-0882a4ac"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__
module.exports.el = 'true'
new Vue(module.exports)


/***/ }),

/***/ "./node_modules/@babel/runtime/regenerator/index.js":
/*!**********************************************************!*\
  !*** ./node_modules/@babel/runtime/regenerator/index.js ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(/*! regenerator-runtime */ "./node_modules/regenerator-runtime/runtime-module.js");


/***/ }),

/***/ "./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js":
/*!**************************************************************************************************!*\
  !*** ./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js ***!
  \**************************************************************************************************/
/*! exports provided: default */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
var isFn = function isFn(v) {
  return typeof v === 'function';
};

var handlePromise = function handlePromise(promise) {
  return promise.then(function (data) {
    return [null, data];
  }).catch(function (err) {
    return [err];
  });
};

var REGEX = /^on|^create|Sync$|Manager$|^pause/;
var API_NORMAL_LIST = ['os', 'stopRecord', 'stopVoice', 'stopBackgroundAudio', 'stopPullDownRefresh', 'hideKeyboard', 'hideToast', 'hideLoading', 'showNavigationBarLoading', 'hideNavigationBarLoading', 'canIUse', 'navigateBack', 'closeSocket', 'pageScrollTo', 'drawCanvas'];

var shouldPromise = function shouldPromise(name) {
  if (REGEX.test(name) && name !== 'createBLEConnection') {
    return false;
  }
  if (~API_NORMAL_LIST.indexOf(name)) {
    return false;
  }
  return true;
};

var promisify = function promisify(api) {
  return function () {
    for (var _len = arguments.length, params = Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++) {
      params[_key - 1] = arguments[_key];
    }

    var options = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};

    if (isFn(options.success) || isFn(options.fail) || isFn(options.complete)) {
      return api.apply(undefined, [options].concat(params));
    }
    return handlePromise(new Promise(function (resolve, reject) {
      api.apply(undefined, [Object.assign({}, options, {
        success: resolve,
        fail: reject
      })].concat(params));
      /* eslint-disable no-extend-native */
      Promise.prototype.finally = function (callback) {
        var promise = this.constructor;
        return this.then(function (value) {
          return promise.resolve(callback()).then(function () {
            return value;
          });
        }, function (reason) {
          return promise.resolve(callback()).then(function () {
            throw reason;
          });
        });
      };
    }));
  };
};

var UNIAPP_LAUNCH_WEBVIEW_ID = '__UNIAPP_LAUNCH_WEBVIEW_ID';

var plus = weex.requireModule('plus');
var storage = weex.requireModule('plusstorage');
var globalEvent = weex.requireModule('globalEvent');

var id = 0;
var callbacks = {};

var WEBVIEW_ID = '';

storage && storage.getItem && storage.getItem(UNIAPP_LAUNCH_WEBVIEW_ID, function (evt) {
  if (evt.result === 'success' && evt.data) {
    WEBVIEW_ID = evt.data;
  }
});

globalEvent.addEventListener('plusMessage', function (e) {
  if (e.data.type === 'UniAppJsApi') {
    invoke(e.data.id, e.data.data);
  } else if (e.data.type === 'onNavigationBarButtonTap') {
    if (typeof onNavigationBarButtonTapCallback === 'function') {
      onNavigationBarButtonTapCallback(e.data.data);
    }
  }
});

var createCallback = function createCallback(args, type) {
  var callback = function callback(res) {
    if (isFn(args)) {
      args(res);
    } else if (args) {
      if (~res.errMsg.indexOf(':ok')) {
        isFn(args.success) && args.success(res);
      } else if (~res.errMsg.indexOf(':fail')) {
        isFn(args.fail) && args.fail(res);
      }
      isFn(args.complete) && args.complete(res);
    }
  };
  if (isFn(args) || args && isFn(args.callback)) {
    callback.keepAlive = true;
  }
  return callback;
};

var invoke = function invoke(callbackId, data) {
  var callback = callbacks[callbackId];
  if (callback) {
    callback(data);
    if (!callback.keepAlive) {
      delete callbacks[callbackId];
    }
  } else {
    console.error('callback[' + callbackId + '] is undefined');
  }
};

var publish = function publish(_ref) {
  var id = _ref.id,
      type = _ref.type,
      params = _ref.params;

  callbacks[id] = createCallback(params, type);
  if (WEBVIEW_ID) {
    plus.postMessage({
      id: id,
      type: type,
      params: params
    }, WEBVIEW_ID);
  } else {
    console.error('launch webview id is not ready');
  }
};

function postMessage(data) {
  if (WEBVIEW_ID) {
    plus.postMessage(data, WEBVIEW_ID);
  } else {
    console.error('launch webview id is not ready');
  }
}

var createPublish = function createPublish(name) {
  return function (args) {
    publish({
      id: id++,
      type: name,
      params: args
    });
  };
};

var onNavigationBarButtonTapCallback = void 0;
function onNavigationBarButtonTap(callback) {
  onNavigationBarButtonTapCallback = callback;
}

function requireNativePlugin(pluginName) {
  return weex.requireModule(pluginName);
}

var dom = weex.requireModule('dom');

function loadFontFace(_ref) {
  var family = _ref.family,
      source = _ref.source,
      desc = _ref.desc,
      success = _ref.success,
      fail = _ref.fail,
      complete = _ref.complete;

  dom.addRule('fontFace', {
    fontFamily: family,
    src: source.replace(/"/g, '\'')
  });
  var res = {
    errMsg: 'loadFontFace:ok',
    status: 'loaded'
  };
  isFn(success) && success(res);
  isFn(complete) && complete(res);
}

var globalEvent$1 = weex.requireModule('globalEvent');

var callbacks$1 = [];

globalEvent$1.addEventListener('plusMessage', function (e) {
  if (e.data.type === 'UniAppReady') {
    ready.isUniAppReady = true;
    if (callbacks$1.length) {
      callbacks$1.forEach(function (callback) {
        return callback();
      });
      callbacks$1 = [];
    }
  }
});

function ready(callback) {
  if (typeof callback === 'function') {
    if (this.isUniAppReady) {
      callback();
    } else {
      callbacks$1.push(callback);
    }
  }
}

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) {
  return typeof obj;
} : function (obj) {
  return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
};

var stream = weex.requireModule('stream');

// let requestTaskId = 0

var METHOD_GET = 'GET';
var METHOD_POST = 'POST';
var CONTENT_TYPE_JSON = 'application/json';
var CONTENT_TYPE_FORM = 'application/x-www-form-urlencoded';

var serialize = function serialize(data) {
  var method = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : METHOD_GET;
  var contentType = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : CONTENT_TYPE_FORM;

  if ((typeof data === 'undefined' ? 'undefined' : _typeof(data)) === 'object') {
    if (method.toUpperCase() === METHOD_POST && contentType.toLowerCase() === CONTENT_TYPE_JSON) {
      return JSON.stringify(data);
    } else {
      return Object.keys(data).map(function (key) {
        return encodeURIComponent(key) + '=' + encodeURIComponent(data[key]);
      }).join('&');
    }
  }
  return data;
};

function request(_ref) {
  var url = _ref.url,
      data = _ref.data,
      header = _ref.header,
      _ref$method = _ref.method,
      method = _ref$method === undefined ? 'GET' : _ref$method,
      _ref$dataType = _ref.dataType,
      dataType = _ref$dataType === undefined ? 'json' : _ref$dataType,
      responseType = _ref.responseType,
      success = _ref.success,
      fail = _ref.fail,
      complete = _ref.complete;

  // requestTaskId++
  var aborted = false;

  var hasContentType = false;
  var headers = {};
  if (header) {
    for (var name in header) {
      if (!hasContentType && name.toLowerCase() === 'content-type') {
        hasContentType = true;
        headers['Content-Type'] = header[name];
      } else {
        headers[name] = header[name];
      }
    }
  }
  if (method === METHOD_GET && data) {
    url = url + (~url.indexOf('?') ? url.substr(-1) === '&' || url.substr(-1) === '?' ? '' : '&' : '?') + serialize(data);
  }
  stream.fetch({
    url: url,
    method: method,
    headers: headers,
    type: dataType === 'json' ? 'json' : 'text',
    body: method !== METHOD_GET ? serialize(data, method, headers['Content-Type']) : ''
  }, function (_ref2) {
    var status = _ref2.status,
        ok = _ref2.ok,
        statusText = _ref2.statusText,
        data = _ref2.data,
        headers = _ref2.headers;

    var ret = {};
    if (!status || status === -1 || aborted) {
      ret.errMsg = 'request:fail';
      isFn(fail) && fail(ret);
    } else {
      ret.data = data;
      ret.statusCode = status;
      ret.header = headers;
      isFn(success) && success(ret);
    }
    isFn(complete) && complete(ret);
  });
  return {
    abort: function abort() {
      aborted = true;
    }
  };
}

var storage$1 = weex.requireModule('plusstorage');
var UNIAPP_STORAGE_DATA_TYPE = '__TYPE';

function getStorage(_ref) {
  var key = _ref.key,
      data = _ref.data,
      success = _ref.success,
      fail = _ref.fail,
      complete = _ref.complete;

  storage$1.getItem(key + UNIAPP_STORAGE_DATA_TYPE, function (ret) {
    if (ret.result === 'success') {
      var dataType = ret.data;
      storage$1.getItem(key, function (res) {
        if (res.result === 'success') {
          var result = res.data;
          if (dataType && result) {
            if (dataType !== 'String') {
              result = JSON.parse(result);
            }
            isFn(success) && success({
              errMsg: 'getStorage:ok',
              data: result
            });
          } else {
            res.errMsg = 'setStorage:fail';
            isFn(fail) && fail(res);
          }
        } else {
          res.errMsg = 'setStorage:fail';
          isFn(fail) && fail(res);
        }
        isFn(complete) && complete(res);
      });
    } else {
      ret.errMsg = 'setStorage:fail';
      isFn(fail) && fail(ret);
      isFn(complete) && complete(ret);
    }
  });
}
function setStorage(_ref2) {
  var key = _ref2.key,
      data = _ref2.data,
      success = _ref2.success,
      fail = _ref2.fail,
      complete = _ref2.complete;

  var dataType = 'String';
  if ((typeof data === 'undefined' ? 'undefined' : _typeof(data)) === 'object') {
    dataType = 'Object';
    data = JSON.stringify(data);
  }
  storage$1.setItem(key, data, function (res) {
    if (res.result === 'success') {
      storage$1.setItem(key + UNIAPP_STORAGE_DATA_TYPE, dataType, function (ret) {
        if (ret.result === 'success') {
          isFn(success) && success({
            errMsg: 'setStorage:ok'
          });
        } else {
          ret.errMsg = 'setStorage:fail';
          isFn(fail) && fail(ret);
        }
      });
    } else {
      res.errMsg = 'setStorage:fail';
      isFn(fail) && fail(res);
    }
    isFn(complete) && complete(res);
  });
}

function removeStorage(_ref3) {
  var key = _ref3.key,
      data = _ref3.data,
      success = _ref3.success,
      fail = _ref3.fail,
      complete = _ref3.complete;

  storage$1.removeItem(key, function (res) {
    if (res.result === 'success') {
      isFn(success) && success({
        errMsg: 'removeStorage:ok'
      });
    } else {
      res.errMsg = 'removeStorage:fail';
      isFn(fail) && fail(res);
    }
    isFn(complete) && complete(res);
  });
  storage$1.removeItem(key + UNIAPP_STORAGE_DATA_TYPE);
}

function clearStorage(_ref4) {
  var key = _ref4.key,
      data = _ref4.data,
      success = _ref4.success,
      fail = _ref4.fail,
      complete = _ref4.complete;
}

var clipboard = weex.requireModule('clipboard');

function getClipboardData(_ref) {
  var success = _ref.success,
      fail = _ref.fail,
      complete = _ref.complete;

  clipboard.getString(function (_ref2) {
    var data = _ref2.data;

    var res = {
      errMsg: 'getClipboardData:ok',
      data: data
    };
    isFn(success) && success(res);
    isFn(complete) && complete(res);
  });
}

function setClipboardData(_ref3) {
  var data = _ref3.data,
      success = _ref3.success,
      fail = _ref3.fail,
      complete = _ref3.complete;

  var res = {
    errMsg: 'setClipboardData:ok'
  };
  clipboard.setString(data);
  isFn(success) && success(res);
  isFn(complete) && complete(res);
}



var api = /*#__PURE__*/Object.freeze({
  loadFontFace: loadFontFace,
  ready: ready,
  request: request,
  getStorage: getStorage,
  setStorage: setStorage,
  removeStorage: removeStorage,
  clearStorage: clearStorage,
  getClipboardData: getClipboardData,
  setClipboardData: setClipboardData
});

var wx = {
  uploadFile: true,
  downloadFile: true,
  chooseImage: true,
  previewImage: true,
  getImageInfo: true,
  saveImageToPhotosAlbum: true,
  chooseVideo: true,
  saveVideoToPhotosAlbum: true,
  saveFile: true,
  getSavedFileList: true,
  getSavedFileInfo: true,
  removeSavedFile: true,
  openDocument: true,
  setStorage: true,
  getStorage: true,
  getStorageInfo: true,
  removeStorage: true,
  clearStorage: true,
  getLocation: true,
  chooseLocation: true,
  openLocation: true,
  getSystemInfo: true,
  getNetworkType: true,
  makePhoneCall: true,
  scanCode: true,
  setScreenBrightness: true,
  getScreenBrightness: true,
  setKeepScreenOn: true,
  vibrateLong: true,
  vibrateShort: true,
  addPhoneContact: true,
  showToast: true,
  showLoading: true,
  hideToast: true,
  hideLoading: true,
  showModal: true,
  showActionSheet: true,
  setNavigationBarTitle: true,
  setNavigationBarColor: true,
  navigateTo: true,
  redirectTo: true,
  reLaunch: true,
  switchTab: true,
  navigateBack: true,
  getProvider: true,
  login: true,
  getUserInfo: true,
  share: true,
  requestPayment: true,
  subscribePush: true,
  unsubscribePush: true,
  onPush: true,
  offPush: true
};

var uni = {};

var baseUni = {
  os: {
    nvue: true
  }
};

if (typeof Proxy !== 'undefined') {
  uni = new Proxy({}, {
    get: function get(target, name) {
      if (name === 'os') {
        return {
          nvue: true
        };
      }
      if (name === 'postMessage') {
        return postMessage;
      }
      if (name === 'requireNativePlugin') {
        return requireNativePlugin;
      }
      if (name === 'onNavigationBarButtonTap') {
        return onNavigationBarButtonTap;
      }
      var method = api[name];
      if (!method) {
        method = createPublish(name);
      }
      if (shouldPromise(name)) {
        return promisify(method);
      }
      return method;
    }
  });
} else {
  Object.keys(baseUni).forEach(function (key) {
    uni[key] = baseUni[key];
  });

  uni.postMessage = postMessage;

  uni.requireNativePlugin = requireNativePlugin;

  Object.keys(wx).forEach(function (name) {
    var method = api[name];
    if (!method) {
      method = createPublish(name);
    }
    if (shouldPromise(name)) {
      uni[name] = promisify(method);
    } else {
      uni[name] = method;
    }
  });
}

var uni$1 = uni;

/* harmony default export */ __webpack_exports__["default"] = (uni$1);


/***/ }),

/***/ "./node_modules/regenerator-runtime/runtime-module.js":
/*!************************************************************!*\
  !*** ./node_modules/regenerator-runtime/runtime-module.js ***!
  \************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

/**
 * Copyright (c) 2014-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

// This method of obtaining a reference to the global object needs to be
// kept identical to the way it is obtained in runtime.js
var g = (function() {
  return this || (typeof self === "object" && self);
})() || Function("return this")();

// Use `getOwnPropertyNames` because not all browsers support calling
// `hasOwnProperty` on the global `self` object in a worker. See #183.
var hadRuntime = g.regeneratorRuntime &&
  Object.getOwnPropertyNames(g).indexOf("regeneratorRuntime") >= 0;

// Save the old regeneratorRuntime in case it needs to be restored later.
var oldRuntime = hadRuntime && g.regeneratorRuntime;

// Force reevalutation of runtime.js.
g.regeneratorRuntime = undefined;

module.exports = __webpack_require__(/*! ./runtime */ "./node_modules/regenerator-runtime/runtime.js");

if (hadRuntime) {
  // Restore the original runtime.
  g.regeneratorRuntime = oldRuntime;
} else {
  // Remove the global property added by runtime.js.
  try {
    delete g.regeneratorRuntime;
  } catch(e) {
    g.regeneratorRuntime = undefined;
  }
}


/***/ }),

/***/ "./node_modules/regenerator-runtime/runtime.js":
/*!*****************************************************!*\
  !*** ./node_modules/regenerator-runtime/runtime.js ***!
  \*****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

/**
 * Copyright (c) 2014-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

!(function(global) {
  "use strict";

  var Op = Object.prototype;
  var hasOwn = Op.hasOwnProperty;
  var undefined; // More compressible than void 0.
  var $Symbol = typeof Symbol === "function" ? Symbol : {};
  var iteratorSymbol = $Symbol.iterator || "@@iterator";
  var asyncIteratorSymbol = $Symbol.asyncIterator || "@@asyncIterator";
  var toStringTagSymbol = $Symbol.toStringTag || "@@toStringTag";

  var inModule = typeof module === "object";
  var runtime = global.regeneratorRuntime;
  if (runtime) {
    if (inModule) {
      // If regeneratorRuntime is defined globally and we're in a module,
      // make the exports object identical to regeneratorRuntime.
      module.exports = runtime;
    }
    // Don't bother evaluating the rest of this file if the runtime was
    // already defined globally.
    return;
  }

  // Define the runtime globally (as expected by generated code) as either
  // module.exports (if we're in a module) or a new, empty object.
  runtime = global.regeneratorRuntime = inModule ? module.exports : {};

  function wrap(innerFn, outerFn, self, tryLocsList) {
    // If outerFn provided and outerFn.prototype is a Generator, then outerFn.prototype instanceof Generator.
    var protoGenerator = outerFn && outerFn.prototype instanceof Generator ? outerFn : Generator;
    var generator = Object.create(protoGenerator.prototype);
    var context = new Context(tryLocsList || []);

    // The ._invoke method unifies the implementations of the .next,
    // .throw, and .return methods.
    generator._invoke = makeInvokeMethod(innerFn, self, context);

    return generator;
  }
  runtime.wrap = wrap;

  // Try/catch helper to minimize deoptimizations. Returns a completion
  // record like context.tryEntries[i].completion. This interface could
  // have been (and was previously) designed to take a closure to be
  // invoked without arguments, but in all the cases we care about we
  // already have an existing method we want to call, so there's no need
  // to create a new function object. We can even get away with assuming
  // the method takes exactly one argument, since that happens to be true
  // in every case, so we don't have to touch the arguments object. The
  // only additional allocation required is the completion record, which
  // has a stable shape and so hopefully should be cheap to allocate.
  function tryCatch(fn, obj, arg) {
    try {
      return { type: "normal", arg: fn.call(obj, arg) };
    } catch (err) {
      return { type: "throw", arg: err };
    }
  }

  var GenStateSuspendedStart = "suspendedStart";
  var GenStateSuspendedYield = "suspendedYield";
  var GenStateExecuting = "executing";
  var GenStateCompleted = "completed";

  // Returning this object from the innerFn has the same effect as
  // breaking out of the dispatch switch statement.
  var ContinueSentinel = {};

  // Dummy constructor functions that we use as the .constructor and
  // .constructor.prototype properties for functions that return Generator
  // objects. For full spec compliance, you may wish to configure your
  // minifier not to mangle the names of these two functions.
  function Generator() {}
  function GeneratorFunction() {}
  function GeneratorFunctionPrototype() {}

  // This is a polyfill for %IteratorPrototype% for environments that
  // don't natively support it.
  var IteratorPrototype = {};
  IteratorPrototype[iteratorSymbol] = function () {
    return this;
  };

  var getProto = Object.getPrototypeOf;
  var NativeIteratorPrototype = getProto && getProto(getProto(values([])));
  if (NativeIteratorPrototype &&
      NativeIteratorPrototype !== Op &&
      hasOwn.call(NativeIteratorPrototype, iteratorSymbol)) {
    // This environment has a native %IteratorPrototype%; use it instead
    // of the polyfill.
    IteratorPrototype = NativeIteratorPrototype;
  }

  var Gp = GeneratorFunctionPrototype.prototype =
    Generator.prototype = Object.create(IteratorPrototype);
  GeneratorFunction.prototype = Gp.constructor = GeneratorFunctionPrototype;
  GeneratorFunctionPrototype.constructor = GeneratorFunction;
  GeneratorFunctionPrototype[toStringTagSymbol] =
    GeneratorFunction.displayName = "GeneratorFunction";

  // Helper for defining the .next, .throw, and .return methods of the
  // Iterator interface in terms of a single ._invoke method.
  function defineIteratorMethods(prototype) {
    ["next", "throw", "return"].forEach(function(method) {
      prototype[method] = function(arg) {
        return this._invoke(method, arg);
      };
    });
  }

  runtime.isGeneratorFunction = function(genFun) {
    var ctor = typeof genFun === "function" && genFun.constructor;
    return ctor
      ? ctor === GeneratorFunction ||
        // For the native GeneratorFunction constructor, the best we can
        // do is to check its .name property.
        (ctor.displayName || ctor.name) === "GeneratorFunction"
      : false;
  };

  runtime.mark = function(genFun) {
    if (Object.setPrototypeOf) {
      Object.setPrototypeOf(genFun, GeneratorFunctionPrototype);
    } else {
      genFun.__proto__ = GeneratorFunctionPrototype;
      if (!(toStringTagSymbol in genFun)) {
        genFun[toStringTagSymbol] = "GeneratorFunction";
      }
    }
    genFun.prototype = Object.create(Gp);
    return genFun;
  };

  // Within the body of any async function, `await x` is transformed to
  // `yield regeneratorRuntime.awrap(x)`, so that the runtime can test
  // `hasOwn.call(value, "__await")` to determine if the yielded value is
  // meant to be awaited.
  runtime.awrap = function(arg) {
    return { __await: arg };
  };

  function AsyncIterator(generator) {
    function invoke(method, arg, resolve, reject) {
      var record = tryCatch(generator[method], generator, arg);
      if (record.type === "throw") {
        reject(record.arg);
      } else {
        var result = record.arg;
        var value = result.value;
        if (value &&
            typeof value === "object" &&
            hasOwn.call(value, "__await")) {
          return Promise.resolve(value.__await).then(function(value) {
            invoke("next", value, resolve, reject);
          }, function(err) {
            invoke("throw", err, resolve, reject);
          });
        }

        return Promise.resolve(value).then(function(unwrapped) {
          // When a yielded Promise is resolved, its final value becomes
          // the .value of the Promise<{value,done}> result for the
          // current iteration.
          result.value = unwrapped;
          resolve(result);
        }, function(error) {
          // If a rejected Promise was yielded, throw the rejection back
          // into the async generator function so it can be handled there.
          return invoke("throw", error, resolve, reject);
        });
      }
    }

    var previousPromise;

    function enqueue(method, arg) {
      function callInvokeWithMethodAndArg() {
        return new Promise(function(resolve, reject) {
          invoke(method, arg, resolve, reject);
        });
      }

      return previousPromise =
        // If enqueue has been called before, then we want to wait until
        // all previous Promises have been resolved before calling invoke,
        // so that results are always delivered in the correct order. If
        // enqueue has not been called before, then it is important to
        // call invoke immediately, without waiting on a callback to fire,
        // so that the async generator function has the opportunity to do
        // any necessary setup in a predictable way. This predictability
        // is why the Promise constructor synchronously invokes its
        // executor callback, and why async functions synchronously
        // execute code before the first await. Since we implement simple
        // async functions in terms of async generators, it is especially
        // important to get this right, even though it requires care.
        previousPromise ? previousPromise.then(
          callInvokeWithMethodAndArg,
          // Avoid propagating failures to Promises returned by later
          // invocations of the iterator.
          callInvokeWithMethodAndArg
        ) : callInvokeWithMethodAndArg();
    }

    // Define the unified helper method that is used to implement .next,
    // .throw, and .return (see defineIteratorMethods).
    this._invoke = enqueue;
  }

  defineIteratorMethods(AsyncIterator.prototype);
  AsyncIterator.prototype[asyncIteratorSymbol] = function () {
    return this;
  };
  runtime.AsyncIterator = AsyncIterator;

  // Note that simple async functions are implemented on top of
  // AsyncIterator objects; they just return a Promise for the value of
  // the final result produced by the iterator.
  runtime.async = function(innerFn, outerFn, self, tryLocsList) {
    var iter = new AsyncIterator(
      wrap(innerFn, outerFn, self, tryLocsList)
    );

    return runtime.isGeneratorFunction(outerFn)
      ? iter // If outerFn is a generator, return the full iterator.
      : iter.next().then(function(result) {
          return result.done ? result.value : iter.next();
        });
  };

  function makeInvokeMethod(innerFn, self, context) {
    var state = GenStateSuspendedStart;

    return function invoke(method, arg) {
      if (state === GenStateExecuting) {
        throw new Error("Generator is already running");
      }

      if (state === GenStateCompleted) {
        if (method === "throw") {
          throw arg;
        }

        // Be forgiving, per 25.3.3.3.3 of the spec:
        // https://people.mozilla.org/~jorendorff/es6-draft.html#sec-generatorresume
        return doneResult();
      }

      context.method = method;
      context.arg = arg;

      while (true) {
        var delegate = context.delegate;
        if (delegate) {
          var delegateResult = maybeInvokeDelegate(delegate, context);
          if (delegateResult) {
            if (delegateResult === ContinueSentinel) continue;
            return delegateResult;
          }
        }

        if (context.method === "next") {
          // Setting context._sent for legacy support of Babel's
          // function.sent implementation.
          context.sent = context._sent = context.arg;

        } else if (context.method === "throw") {
          if (state === GenStateSuspendedStart) {
            state = GenStateCompleted;
            throw context.arg;
          }

          context.dispatchException(context.arg);

        } else if (context.method === "return") {
          context.abrupt("return", context.arg);
        }

        state = GenStateExecuting;

        var record = tryCatch(innerFn, self, context);
        if (record.type === "normal") {
          // If an exception is thrown from innerFn, we leave state ===
          // GenStateExecuting and loop back for another invocation.
          state = context.done
            ? GenStateCompleted
            : GenStateSuspendedYield;

          if (record.arg === ContinueSentinel) {
            continue;
          }

          return {
            value: record.arg,
            done: context.done
          };

        } else if (record.type === "throw") {
          state = GenStateCompleted;
          // Dispatch the exception by looping back around to the
          // context.dispatchException(context.arg) call above.
          context.method = "throw";
          context.arg = record.arg;
        }
      }
    };
  }

  // Call delegate.iterator[context.method](context.arg) and handle the
  // result, either by returning a { value, done } result from the
  // delegate iterator, or by modifying context.method and context.arg,
  // setting context.delegate to null, and returning the ContinueSentinel.
  function maybeInvokeDelegate(delegate, context) {
    var method = delegate.iterator[context.method];
    if (method === undefined) {
      // A .throw or .return when the delegate iterator has no .throw
      // method always terminates the yield* loop.
      context.delegate = null;

      if (context.method === "throw") {
        if (delegate.iterator.return) {
          // If the delegate iterator has a return method, give it a
          // chance to clean up.
          context.method = "return";
          context.arg = undefined;
          maybeInvokeDelegate(delegate, context);

          if (context.method === "throw") {
            // If maybeInvokeDelegate(context) changed context.method from
            // "return" to "throw", let that override the TypeError below.
            return ContinueSentinel;
          }
        }

        context.method = "throw";
        context.arg = new TypeError(
          "The iterator does not provide a 'throw' method");
      }

      return ContinueSentinel;
    }

    var record = tryCatch(method, delegate.iterator, context.arg);

    if (record.type === "throw") {
      context.method = "throw";
      context.arg = record.arg;
      context.delegate = null;
      return ContinueSentinel;
    }

    var info = record.arg;

    if (! info) {
      context.method = "throw";
      context.arg = new TypeError("iterator result is not an object");
      context.delegate = null;
      return ContinueSentinel;
    }

    if (info.done) {
      // Assign the result of the finished delegate to the temporary
      // variable specified by delegate.resultName (see delegateYield).
      context[delegate.resultName] = info.value;

      // Resume execution at the desired location (see delegateYield).
      context.next = delegate.nextLoc;

      // If context.method was "throw" but the delegate handled the
      // exception, let the outer generator proceed normally. If
      // context.method was "next", forget context.arg since it has been
      // "consumed" by the delegate iterator. If context.method was
      // "return", allow the original .return call to continue in the
      // outer generator.
      if (context.method !== "return") {
        context.method = "next";
        context.arg = undefined;
      }

    } else {
      // Re-yield the result returned by the delegate method.
      return info;
    }

    // The delegate iterator is finished, so forget it and continue with
    // the outer generator.
    context.delegate = null;
    return ContinueSentinel;
  }

  // Define Generator.prototype.{next,throw,return} in terms of the
  // unified ._invoke helper method.
  defineIteratorMethods(Gp);

  Gp[toStringTagSymbol] = "Generator";

  // A Generator should always return itself as the iterator object when the
  // @@iterator function is called on it. Some browsers' implementations of the
  // iterator prototype chain incorrectly implement this, causing the Generator
  // object to not be returned from this call. This ensures that doesn't happen.
  // See https://github.com/facebook/regenerator/issues/274 for more details.
  Gp[iteratorSymbol] = function() {
    return this;
  };

  Gp.toString = function() {
    return "[object Generator]";
  };

  function pushTryEntry(locs) {
    var entry = { tryLoc: locs[0] };

    if (1 in locs) {
      entry.catchLoc = locs[1];
    }

    if (2 in locs) {
      entry.finallyLoc = locs[2];
      entry.afterLoc = locs[3];
    }

    this.tryEntries.push(entry);
  }

  function resetTryEntry(entry) {
    var record = entry.completion || {};
    record.type = "normal";
    delete record.arg;
    entry.completion = record;
  }

  function Context(tryLocsList) {
    // The root entry object (effectively a try statement without a catch
    // or a finally block) gives us a place to store values thrown from
    // locations where there is no enclosing try statement.
    this.tryEntries = [{ tryLoc: "root" }];
    tryLocsList.forEach(pushTryEntry, this);
    this.reset(true);
  }

  runtime.keys = function(object) {
    var keys = [];
    for (var key in object) {
      keys.push(key);
    }
    keys.reverse();

    // Rather than returning an object with a next method, we keep
    // things simple and return the next function itself.
    return function next() {
      while (keys.length) {
        var key = keys.pop();
        if (key in object) {
          next.value = key;
          next.done = false;
          return next;
        }
      }

      // To avoid creating an additional object, we just hang the .value
      // and .done properties off the next function object itself. This
      // also ensures that the minifier will not anonymize the function.
      next.done = true;
      return next;
    };
  };

  function values(iterable) {
    if (iterable) {
      var iteratorMethod = iterable[iteratorSymbol];
      if (iteratorMethod) {
        return iteratorMethod.call(iterable);
      }

      if (typeof iterable.next === "function") {
        return iterable;
      }

      if (!isNaN(iterable.length)) {
        var i = -1, next = function next() {
          while (++i < iterable.length) {
            if (hasOwn.call(iterable, i)) {
              next.value = iterable[i];
              next.done = false;
              return next;
            }
          }

          next.value = undefined;
          next.done = true;

          return next;
        };

        return next.next = next;
      }
    }

    // Return an iterator with no values.
    return { next: doneResult };
  }
  runtime.values = values;

  function doneResult() {
    return { value: undefined, done: true };
  }

  Context.prototype = {
    constructor: Context,

    reset: function(skipTempReset) {
      this.prev = 0;
      this.next = 0;
      // Resetting context._sent for legacy support of Babel's
      // function.sent implementation.
      this.sent = this._sent = undefined;
      this.done = false;
      this.delegate = null;

      this.method = "next";
      this.arg = undefined;

      this.tryEntries.forEach(resetTryEntry);

      if (!skipTempReset) {
        for (var name in this) {
          // Not sure about the optimal order of these conditions:
          if (name.charAt(0) === "t" &&
              hasOwn.call(this, name) &&
              !isNaN(+name.slice(1))) {
            this[name] = undefined;
          }
        }
      }
    },

    stop: function() {
      this.done = true;

      var rootEntry = this.tryEntries[0];
      var rootRecord = rootEntry.completion;
      if (rootRecord.type === "throw") {
        throw rootRecord.arg;
      }

      return this.rval;
    },

    dispatchException: function(exception) {
      if (this.done) {
        throw exception;
      }

      var context = this;
      function handle(loc, caught) {
        record.type = "throw";
        record.arg = exception;
        context.next = loc;

        if (caught) {
          // If the dispatched exception was caught by a catch block,
          // then let that catch block handle the exception normally.
          context.method = "next";
          context.arg = undefined;
        }

        return !! caught;
      }

      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        var record = entry.completion;

        if (entry.tryLoc === "root") {
          // Exception thrown outside of any try block that could handle
          // it, so set the completion value of the entire function to
          // throw the exception.
          return handle("end");
        }

        if (entry.tryLoc <= this.prev) {
          var hasCatch = hasOwn.call(entry, "catchLoc");
          var hasFinally = hasOwn.call(entry, "finallyLoc");

          if (hasCatch && hasFinally) {
            if (this.prev < entry.catchLoc) {
              return handle(entry.catchLoc, true);
            } else if (this.prev < entry.finallyLoc) {
              return handle(entry.finallyLoc);
            }

          } else if (hasCatch) {
            if (this.prev < entry.catchLoc) {
              return handle(entry.catchLoc, true);
            }

          } else if (hasFinally) {
            if (this.prev < entry.finallyLoc) {
              return handle(entry.finallyLoc);
            }

          } else {
            throw new Error("try statement without catch or finally");
          }
        }
      }
    },

    abrupt: function(type, arg) {
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        if (entry.tryLoc <= this.prev &&
            hasOwn.call(entry, "finallyLoc") &&
            this.prev < entry.finallyLoc) {
          var finallyEntry = entry;
          break;
        }
      }

      if (finallyEntry &&
          (type === "break" ||
           type === "continue") &&
          finallyEntry.tryLoc <= arg &&
          arg <= finallyEntry.finallyLoc) {
        // Ignore the finally entry if control is not jumping to a
        // location outside the try/catch block.
        finallyEntry = null;
      }

      var record = finallyEntry ? finallyEntry.completion : {};
      record.type = type;
      record.arg = arg;

      if (finallyEntry) {
        this.method = "next";
        this.next = finallyEntry.finallyLoc;
        return ContinueSentinel;
      }

      return this.complete(record);
    },

    complete: function(record, afterLoc) {
      if (record.type === "throw") {
        throw record.arg;
      }

      if (record.type === "break" ||
          record.type === "continue") {
        this.next = record.arg;
      } else if (record.type === "return") {
        this.rval = this.arg = record.arg;
        this.method = "return";
        this.next = "end";
      } else if (record.type === "normal" && afterLoc) {
        this.next = afterLoc;
      }

      return ContinueSentinel;
    },

    finish: function(finallyLoc) {
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        if (entry.finallyLoc === finallyLoc) {
          this.complete(entry.completion, entry.afterLoc);
          resetTryEntry(entry);
          return ContinueSentinel;
        }
      }
    },

    "catch": function(tryLoc) {
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        if (entry.tryLoc === tryLoc) {
          var record = entry.completion;
          if (record.type === "throw") {
            var thrown = record.arg;
            resetTryEntry(entry);
          }
          return thrown;
        }
      }

      // The context.catch method must only be called with a location
      // argument that corresponds to a known catch block.
      throw new Error("illegal catch attempt");
    },

    delegateYield: function(iterable, resultName, nextLoc) {
      this.delegate = {
        iterator: values(iterable),
        resultName: resultName,
        nextLoc: nextLoc
      };

      if (this.method === "next") {
        // Deliberately forget the last sent value so that we don't
        // accidentally pass it on to the delegate.
        this.arg = undefined;
      }

      return ContinueSentinel;
    }
  };
})(
  // In sloppy mode, unbound `this` refers to the global object, fallback to
  // Function constructor if we're in global strict mode. That is sadly a form
  // of indirect eval which violates Content Security Policy.
  (function() {
    return this || (typeof self === "object" && self);
  })() || Function("return this")()
);


/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/base/uni-tab-bar.nvue":
/*!**********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!E:/HBuilderX/HBuilderProjects/demo/components/base/uni-tab-bar.nvue ***!
  \**********************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
Object.defineProperty(exports, "__esModule", { value: true });exports.default = void 0;var _default =
{
  render: function render(createElement) {
    var vnodes = this.$slots.default;
    if (vnodes && vnodes.length) {
      for (var i = 0; i < vnodes.length; i++) {
        var vnode = vnodes[i];
        if (!vnode.data) {
          vnode.data = Object.create(null);
        }
        if (!vnode.data.on) {
          vnode.data.on = Object.create(null);
        }
        vnode.data.on.click = this._change;
      }
    }
    return createElement('div', { //如果需要左右滑动用scroller，不需要的话用div就行,添加个属性需要时将scroller添加 children
      style: {
        height: '100px',
        width: '750px',
        flexDirection: 'row',
        borderBottomWidth: "1px",
        borderColor: "#c8c7cc",
        borderBottomStyle: "solid",
        paddingLeft: "200px" } },

    [
    createElement('scroller', {
      attrs: {
        scrollDirection: 'horizontal',
        showScrollbar: 'false' },

      style: {
        height: '100px',
        width: '750px',
        flexDirection: 'row' } },

    this.$slots.default)]);

  },
  methods: {
    _change: function _change(e) {
      var ret = {
        index: e.index };

      if (e.type === 'click') {
        var target = e.target;
        ret.index = target.parentNode.children.findIndex(function (node) {return node === target;});
      }
      this.$emit('_tabBarClick', ret);
    } } };exports.default = _default;

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/base/uni-tab-content.nvue":
/*!**************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!E:/HBuilderX/HBuilderProjects/demo/components/base/uni-tab-content.nvue ***!
  \**************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
Object.defineProperty(exports, "__esModule", { value: true });exports.default = void 0;var _default =
{
  render: function render(createElement) {
    return createElement('slider', {
      style: {
        flex: 1 },

      attrs: {
        index: 0,
        infinite: false } },

    this.$slots.default);
  } };exports.default = _default;

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/base/uni-tabs.nvue":
/*!*******************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!E:/HBuilderX/HBuilderProjects/demo/components/base/uni-tabs.nvue ***!
  \*******************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
Object.defineProperty(exports, "__esModule", { value: true });exports.default = void 0;
var _uniTabContent = _interopRequireDefault(__webpack_require__(/*! ./uni-tab-content.nvue */ "../../../HBuilderProjects/demo/components/base/uni-tab-content.nvue"));function _interopRequireDefault(obj) {return obj && obj.__esModule ? obj : { default: obj };}var _default =
{
  props: {
    index: {
      type: Number,
      default: 0 } },


  data: function data() {
    return {
      tabIndex: this.index };

  },
  components: {
    uniTabContent: _uniTabContent.default },

  render: function render(createElement) {
    var vnodes = this.$slots.default;
    var newVNodes = [];
    if (vnodes && vnodes.length) {
      for (var i = 0; i < vnodes.length; i++) {
        var vnode = vnodes[i];
        if (!vnode || !vnode.componentOptions) {
          continue;
        }
        if (vnode.componentOptions.tag === 'uni-tab-content') {

          var newVNode = createElement('uni-tab-content', {
            staticClass: vnode.data.staticClass,
            'class': vnode.data['class'],
            style: vnode.data.style },
          vnode.componentOptions.children);

          if (!newVNode.data) {
            newVNode.data = Object.create(null);
          }
          if (!newVNode.data.attrs) {
            newVNode.data.attrs = Object.create(null);
          }
          if (!newVNode.data.props) {
            newVNode.data.props = Object.create(null);
          }
          if (!newVNode.data.on) {
            newVNode.data.on = Object.create(null);
          }
          newVNode.data.attrs.index = this.index;
          newVNode.data.on.change = this._change;
          newVNodes.push(newVNode);
        }
        if (vnode.componentOptions.tag === 'uni-tab-bar') {
          if (!vnode.componentOptions.listeners) {//监听子元素传递过来的事件
            vnode.componentOptions.listeners = Object.create(null);
          }
          vnode.componentOptions.listeners._tabBarClick = this._tabBarClick;
          newVNodes.push(vnode);
        }
      }
    }
    var newNode = createElement('div', {
      style: {
        flex: 1,
        flexDirection: 'column' },

      on: {
        change2: this._change2 } },

    newVNodes);
    return newNode;
  },
  methods: {
    _tabBarClick: function _tabBarClick(e) {
      this.tabIndex = e.index;
      this.$emit('change', e);
    },
    _change: function _change(e) {
      if (this.tabIndex === e.index) {
        return;
      }
      this.tabIndex = e.index;
      this.$emit('change', {
        index: e.index });

    } } };exports.default = _default;

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/components/myself/listTemp.nvue":
/*!*********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!E:/HBuilderX/HBuilderProjects/demo/components/myself/listTemp.nvue ***!
  \*********************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(uni) {Object.defineProperty(exports, "__esModule", { value: true });exports.default = void 0; //
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
var _default2 =
{
  props: {
    data: {
      type: Object,
      default: function _default(e) {
        return {};
      } },

    genre: {
      type: Object,
      default: function _default(e) {
        return {};
      } } },


  computed: {
    approvalType: function approvalType() {
      return this.genre == 0 ? '去审批' : '查看';
    } },

  methods: {
    goDetail: function goDetail() {
      uni.navigateTo({
        url: './approvalDetail?genre=' + this.genre + '&pasType=' + this.data.pasType + '&pasMinNo=' + this.data.pasMinNo + '&regName=' + this.data.regName + '&createDate=' + this.data.createDate + '&bizPkNo=' + this.data.bizPkNo });

    } } };exports.default = _default2;
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js */ "./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js")["default"]))

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib/index.js!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue":
/*!**********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/script-loader.js!./node_modules/babel-loader/lib!./node_modules/weex-vue-loader/lib/selector.js?type=script&index=0!E:/HBuilderX/HBuilderProjects/demo/pages/process/approvalIndex.nvue ***!
  \**********************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

"use strict";
/* WEBPACK VAR INJECTION */(function(uni) {Object.defineProperty(exports, "__esModule", { value: true });exports.default = void 0;var _regenerator = _interopRequireDefault(__webpack_require__(/*! ./node_modules/@babel/runtime/regenerator */ "./node_modules/@babel/runtime/regenerator/index.js"));


























var _uniTabContent = _interopRequireDefault(__webpack_require__(/*! @/components/base/uni-tab-content.nvue */ "../../../HBuilderProjects/demo/components/base/uni-tab-content.nvue"));
var _uniTabBar = _interopRequireDefault(__webpack_require__(/*! @/components/base/uni-tab-bar.nvue */ "../../../HBuilderProjects/demo/components/base/uni-tab-bar.nvue"));
var _uniTabs = _interopRequireDefault(__webpack_require__(/*! @/components/base/uni-tabs.nvue */ "../../../HBuilderProjects/demo/components/base/uni-tabs.nvue"));
var _listTemp = _interopRequireDefault(__webpack_require__(/*! @/components/myself/listTemp.nvue */ "../../../HBuilderProjects/demo/components/myself/listTemp.nvue"));
var _util = __webpack_require__(/*! @/common/util.js */ "../../../HBuilderProjects/demo/common/util.js");
var _index = _interopRequireDefault(__webpack_require__(/*! @/http/index.js */ "../../../HBuilderProjects/demo/http/index.js"));function _interopRequireDefault(obj) {return obj && obj.__esModule ? obj : { default: obj };}function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) {try {var info = gen[key](arg);var value = info.value;} catch (error) {reject(error);return;}if (info.done) {resolve(value);} else {Promise.resolve(value).then(_next, _throw);}}function _asyncToGenerator(fn) {return function () {var self = this,args = arguments;return new Promise(function (resolve, reject) {var gen = fn.apply(self, args);function _next(value) {asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value);}function _throw(err) {asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err);}_next(undefined);});};}

var dom = weex.requireModule('dom');
var globalEvent = weex.requireModule('globalEvent');var _default =

{
  components: {
    uniTabContent: _uniTabContent.default,
    uniTabBar: _uniTabBar.default,
    uniTabs: _uniTabs.default,
    listTemp: _listTemp.default },

  data: function data() {
    return {
      refreshing: false,
      refreshText: '下拉可以刷新',
      newsList: [], //信息列表
      tabIndex: 0, //横滑tab下标
      tabBars: [{
        name: '待审批' },
      {
        name: '已审批' }] };


  },
  created: function created() {var _this = this;
    //监听刷新(从详情页返回时)
    globalEvent.addEventListener("plusMessage", function (e) {
      if (e.data.refresh) {
        _this.onRefresh();
      }
    });

    var hasLogin = this.get_hasLogin();
  },
  methods: {
    get_hasLogin: function () {var _get_hasLogin = _asyncToGenerator( /*#__PURE__*/_regenerator.default.mark(function _callee() {var _this2 = this;var hasLogin;return _regenerator.default.wrap(function _callee$(_context) {while (1) {switch (_context.prev = _context.next) {case 0:_context.next = 2;return (
                  new Promise(function (resolve, reject) {
                    uni.getStorage({
                      key: 'hasLogin',
                      success: function success(res) {
                        resolve(res.data);
                      } });

                  }));case 2:hasLogin = _context.sent;
                if (hasLogin == 'yes') {
                  // 初始化列表信息
                  this.tabBars.forEach(function (tabBar, index) {
                    _this2.newsList.push({
                      data: [],
                      id: index,
                      pageNo: 1,
                      loadingText: '加载中...' });

                  });
                  this.getList();
                } else {
                  this.tabBars.forEach(function (tabBar, index) {
                    _this2.newsList.push({
                      data: [],
                      id: index,
                      pageNo: 1,
                      loadingText: '您还未登录' });

                  });
                  uni.navigateTo({
                    url: '/pages/mine/login' });

                }case 4:case "end":return _context.stop();}}}, _callee, this);}));function get_hasLogin() {return _get_hasLogin.apply(this, arguments);}return get_hasLogin;}(),

    get_opNo: function get_opNo() {
      return new Promise(function (resolve, reject) {
        uni.getStorage({
          key: 'opNo',
          success: function success(res) {
            resolve(res.data);
          } });

      });
    },
    getList: function () {var _getList = _asyncToGenerator( /*#__PURE__*/_regenerator.default.mark(function _callee2() {var _this3 = this;var action,opNo,activeTab,_args2 = arguments;return _regenerator.default.wrap(function _callee2$(_context2) {while (1) {switch (_context2.prev = _context2.next) {case 0:action = _args2.length > 0 && _args2[0] !== undefined ? _args2[0] : 1;_context2.next = 3;return (
                  this.get_opNo());case 3:opNo = _context2.sent;
                activeTab = this.newsList[this.tabIndex];
                if (action === 1) {//针对刷新时将页数重置回1
                  activeTab.pageNo = 1;
                }
                _index.default.sloveInfo({ opNo: opNo, id: activeTab.id, pageNo: activeTab.pageNo }).then(function (res) {
                  _this3.refreshing = false;
                  if (res.data.flag) {
                    var infoList = res.data.ipage;
                    if (action === 1) {
                      activeTab.data = infoList;
                    } else {
                      if (activeTab.data.length % 15 == 0) {
                        activeTab.data = activeTab.data.concat(infoList);
                      }
                    }
                    if (infoList.length < 15) {
                      activeTab.loadingText = '没有更多了';
                    } else {
                      activeTab.pageNo++;
                      activeTab.loadingText = '上拉加载更多';
                    }
                  } else {
                    uni.showToast({
                      title: '获取数据失败',
                      image: '../../static/images/common/data_error.png' });

                  }
                });case 7:case "end":return _context2.stop();}}}, _callee2, this);}));function getList() {return _getList.apply(this, arguments);}return getList;}(),


    loadMore: function loadMore() {
      this.getList(2);
    },
    changeTab: function () {var _changeTab = _asyncToGenerator( /*#__PURE__*/_regenerator.default.mark(function _callee3(event) {var activeNode, nodeSize, index, targetNode, activeTab;return _regenerator.default.wrap(function _callee3$(_context3) {while (1) {switch (_context3.prev = _context3.next) {case 0:
                this.tabIndex = event.index;
                activeNode = this.$refs[this.tabBars[event.index].id + event.index][0];_context3.next = 4;return (
                  this.getNodeSize(activeNode));case 4:nodeSize = _context3.sent;
                if (nodeSize.left + nodeSize.width > 750) {
                  index = event.index - 4;
                  targetNode = this.$refs[this.tabBars[index].id + index][0];
                  dom.scrollToElement(targetNode, {});
                } else if (nodeSize.left < 0) {
                  dom.scrollToElement(activeNode, {});
                }
                // 首次切换后加载数据
                activeTab = this.newsList[this.tabIndex];
                if (activeTab.data.length === 0) {
                  this.getList();
                }case 8:case "end":return _context3.stop();}}}, _callee3, this);}));function changeTab(_x) {return _changeTab.apply(this, arguments);}return changeTab;}(),

    getNodeSize: function getNodeSize(node) {
      return new Promise(function (resolve, reject) {
        dom.getComponentRect(node, function (result) {
          resolve(result.size);
        });
      });
    },
    onRefresh: function () {var _onRefresh = _asyncToGenerator( /*#__PURE__*/_regenerator.default.mark(function _callee4(event) {return _regenerator.default.wrap(function _callee4$(_context4) {while (1) {switch (_context4.prev = _context4.next) {case 0:
                this.refreshText = '正在刷新...';
                this.refreshing = true;
                this.getList();case 3:case "end":return _context4.stop();}}}, _callee4, this);}));function onRefresh(_x2) {return _onRefresh.apply(this, arguments);}return onRefresh;}(),

    onPullingDown: function onPullingDown(event) {
      if (this.refreshing) {
        return;
      }
      if (Math.abs(event.pullingDistance) > Math.abs(event.viewHeight)) {
        this.refreshText = "释放立即刷新";
      } else {
        this.refreshText = "下拉可以刷新";
      }
    } } };exports.default = _default;
/* WEBPACK VAR INJECTION */}.call(this, __webpack_require__(/*! ./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js */ "./node_modules/@dcloudio/vue-cli-plugin-hbuilderx/packages/uni-app-plus-nvue/dist/index.js")["default"]))

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/style-loader.js!./node_modules/weex-vue-loader/lib/style-rewriter.js?id=data-v-0882a4ac!./node_modules/weex-vue-loader/lib/selector.js?type=styles&index=0!../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue":
/*!*************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/style-loader.js!./node_modules/weex-vue-loader/lib/style-rewriter.js?id=data-v-0882a4ac!./node_modules/weex-vue-loader/lib/selector.js?type=styles&index=0!E:/HBuilderX/HBuilderProjects/demo/pages/process/approvalIndex.nvue ***!
  \*************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = {
  "tab-bar-item": {
    "width": "150",
    "height": "100",
    "flexDirection": "column",
    "alignItems": "center",
    "justifyContent": "center",
    "marginRight": 50
  },
  "tab-bar-title": {
    "height": "100",
    "lineHeight": "100",
    "fontSize": "30",
    "color": "#555555"
  },
  "active": {
    "color": "#FF6345"
  },
  "loadmore": {
    "height": "70",
    "width": "750",
    "flexDirection": "column",
    "justifyContent": "center"
  },
  "loadmore-text": {
    "fontSize": "30",
    "textAlign": "center",
    "color": "#999999"
  },
  "refresh": {
    "width": "750",
    "height": "70",
    "flexDirection": "row",
    "alignItems": "center",
    "justifyContent": "center"
  },
  "refresh-text": {
    "textAlign": "center",
    "fontSize": "28",
    "color": "#999999"
  }
}

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/style-loader.js!./node_modules/weex-vue-loader/lib/style-rewriter.js?id=data-v-93b03034!./node_modules/weex-vue-loader/lib/selector.js?type=styles&index=0!../../../HBuilderProjects/demo/components/myself/listTemp.nvue":
/*!************************************************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/style-loader.js!./node_modules/weex-vue-loader/lib/style-rewriter.js?id=data-v-93b03034!./node_modules/weex-vue-loader/lib/selector.js?type=styles&index=0!E:/HBuilderX/HBuilderProjects/demo/components/myself/listTemp.nvue ***!
  \************************************************************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = {
  "number": {
    "color": "#FFA299",
    "fontSize": "25",
    "marginTop": "50",
    "marginLeft": "30"
  },
  "list-cell": {
    "width": "750"
  },
  "media-list": {
    "borderBottomWidth": "1",
    "borderBottomStyle": "solid",
    "borderBottomColor": "#c8c7cc"
  },
  "media-title": {
    "flexDirection": "row",
    "textOverflow": "ellipsis",
    "fontSize": "32",
    "color": "#555555",
    "height": "90"
  },
  "media-info": {
    "flexDirection": "row"
  },
  "people": {
    "width": "180"
  },
  "info-text": {
    "color": "#999999",
    "fontSize": "28",
    "marginRight": "60"
  },
  "media-foot": {
    "marginTop": "10",
    "marginBottom": "30",
    "marginLeft": "40"
  },
  "approval-btn": {
    "width": "140",
    "height": "60",
    "paddingTop": "10",
    "borderStyle": "solid",
    "borderColor": "#FFA07A",
    "borderWidth": "2",
    "backgroundColor": "#FFE4E1",
    "borderRadius": "30",
    "position": "absolute",
    "top": 60,
    "right": 35,
    "opacity": 1,
    "opacity:active": 0.5
  },
  "approval-text": {
    "fontSize": "30",
    "textAlign": "center",
    "color": "#FF4500"
  }
}

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/template-compiler.js?id=data-v-0882a4ac!./node_modules/weex-vue-loader/lib/selector.js?type=template&index=0!../../../HBuilderProjects/demo/pages/process/approvalIndex.nvue":
/*!***************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/template-compiler.js?id=data-v-0882a4ac!./node_modules/weex-vue-loader/lib/selector.js?type=template&index=0!E:/HBuilderX/HBuilderProjects/demo/pages/process/approvalIndex.nvue ***!
  \***************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('view', [_c('uni-tabs', {
    attrs: {
      "index": _vm.tabIndex
    },
    on: {
      "change": _vm.changeTab
    }
  }, [_c('uni-tab-bar', _vm._l((_vm.tabBars), function(tabBar, index) {
    return _c('view', {
      key: index,
      ref: tabBar.id + index,
      refInFor: true,
      staticClass: ["tab-bar-item"]
    }, [_c('text', {
      staticClass: ["tab-bar-title"],
      class: [_vm.tabIndex === index ? 'active' : '']
    }, [_vm._v(_vm._s(tabBar.name))])])
  })), _c('uni-tab-content', _vm._l((_vm.newsList), function(tabItem, tabIndex) {
    return _c('list', {
      key: tabIndex,
      staticClass: ["list"],
      attrs: {
        "loadmoreoffset": "10"
      },
      on: {
        "loadmore": function($event) {
          _vm.loadMore(tabIndex)
        }
      }
    }, [_c('refresh', {
      staticClass: ["refresh"],
      attrs: {
        "display": _vm.refreshing ? 'show' : 'hide'
      },
      on: {
        "refresh": _vm.onRefresh,
        "pullingdown": _vm.onPullingDown
      }
    }, [_c('text', {
      staticClass: ["refresh-text"]
    }, [_vm._v(_vm._s(_vm.refreshText))])]), _vm._l((tabItem.data), function(newsItem, newsIndex) {
      return _c('cell', {
        key: newsIndex,
        appendAsTree: true,
        attrs: {
          "append": "tree"
        }
      }, [_c('list-temp', {
        attrs: {
          "data": newsItem,
          "genre": tabIndex
        }
      })], 1)
    }), _c('cell', {
      staticClass: ["loadmore"],
      appendAsTree: true,
      attrs: {
        "append": "tree"
      }
    }, [_c('text', {
      staticClass: ["loadmore-text"]
    }, [_vm._v(_vm._s(tabItem.loadingText))])])], 2)
  }))], 1)], 1)
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ }),

/***/ "./node_modules/weex-vue-loader/lib/template-compiler.js?id=data-v-93b03034!./node_modules/weex-vue-loader/lib/selector.js?type=template&index=0!../../../HBuilderProjects/demo/components/myself/listTemp.nvue":
/*!**************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/weex-vue-loader/lib/template-compiler.js?id=data-v-93b03034!./node_modules/weex-vue-loader/lib/selector.js?type=template&index=0!E:/HBuilderX/HBuilderProjects/demo/components/myself/listTemp.nvue ***!
  \**************************************************************************************************************************************************************************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports={render:function (){var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;
  return _c('view', [_c('view', {
    staticClass: ["list-cell"]
  }, [_c('view', {
    staticClass: ["media-list"]
  }, [_c('view', {
    staticClass: ["media-title"]
  }, [_vm._v("\n\t\t" + _vm._s(_vm.data.pasType))]), _c('view', {
    staticClass: ["media-foot"]
  }, [_c('view', {
    staticClass: ["media-info"]
  }, [_c('text', {
    staticClass: ["info-text", "people"]
  }, [_vm._v("发起人:" + _vm._s(_vm.data.regName))]), _c('text', {
    staticClass: ["info-text"]
  }, [_vm._v("发起时间:" + _vm._s(_vm.data.createDate))])])]), _c('button', {
    staticClass: ["approval-btn"],
    on: {
      "click": function($event) {
        _vm.goDetail()
      }
    }
  }, [_c('text', {
    staticClass: ["approval-text"]
  }, [_vm._v(_vm._s(_vm.approvalType))])])], 1)])])
},staticRenderFns: []}
module.exports.render._withStripped = true

/***/ })

/******/ });