document.addEventListener('UniAppJSBridgeReady', function() {
	var productDay=[];var productMonth=[];var productYear=[];
	var totalDay=totalMonth=totalYear=0;
	var myChart,domainUrl;
	var vm = new Vue({
		el:'.mui-content',
		data:{
			colorList:[
				'#FF5725','#8640F9','#4086F9','#FFC002',
		    	'#ee4065','#2196f4','#6ccc00','#f9cb00','#c065ff',
				'#41daea','#FC5832','#4489F6','#22BECB','#FDBF2D'
			],
			earns:[],
			totalEarn:'',
			earnType:'day'
		},
		computed:{
			colorArray:function(){
				let arr = [];
				this.colorList.forEach(function(item){
					arr.push('box-shadow:0 0 0 3px'+item) ;
				})
				return arr;
			}
		},
		mounted(){
			if(plus.device.model=='iPhoneSE'){
				jQuery('.dateSelect a').css('width','90px');
			}
			domainUrl = 'http://192.168.101.180:8080/fund/';
			fun1();//收益日报表
			fun2();//预期收益走势
		},
		methods:{
			incomeDay(){
				jQuery('.dateSelect a').removeClass('select-active');
				jQuery('.dateSelect a:eq(0)').addClass('select-active');
				vm.earnType = 'day';
				vm.totalEarn = totalDay;
				myChart.setOption({
					title : {
				        text: '收益日报表'
				    },
				    graphic:{
				    	style:{
				    		text:totalDay+'\n总收益(万元)'
				    	}
				    },
				    series: [
				        {
				            data:productDay
				        }
				    ]
				})
			},
			incomeMonth(){
				jQuery('.dateSelect a').removeClass('select-active');
				jQuery('.dateSelect a:eq(1)').addClass('select-active');
				vm.earnType = 'month';
				vm.totalEarn = totalMonth;
				myChart.setOption({
					title : {
				        text: '收益月报表'
				    },
				    graphic:{
				    	style:{
				    		text:totalMonth+'\n总收益(万元)'
				    	}
				    },
				    series: [
				        {
				            data:productMonth
				        }
				    ]
				})
			},
			incomeYear(){
				jQuery('.dateSelect a').removeClass('select-active');
				jQuery('.dateSelect a:eq(2)').addClass('select-active');
				vm.earnType = 'year';
				vm.totalEarn = totalYear;
				myChart.setOption({
					title : {
				        text: '收益年报表'
				    },
				    graphic:{
				    	style:{
				    		text:totalYear+'\n总收益(万元)'
				    	}
				    },
				    series: [
				        {
				            data:productYear
				        }
				    ]
				})
			}
		}
	})
	
	function fun1(){
		$.ajax({
			url:domainUrl+'MobileWebServiceActionAjax_getIncomeByProductType.action',
			dataType: 'json',
			type: 'post',
			timeout: 100000,
			beforeSend: function() {
		        plus.nativeUI.showWaiting("正在加载中...",{
					loading:{
						display:'block',
						icon:'/static/images/common/loading.png',
						height:'50px',
						interval:100,
					},
					background:'#F7F7F7 ',
					color:'#000000'
				});
		    },
		    complete: function() {
		        plus.nativeUI.closeWaiting();
		    },
			success: function(data) {
				vm.earns = data.incomeByProductTypeMap;
				data.incomeByProductTypeMap.forEach(function(item){
					let it = {name:item.PRODUCT_TYPE,value:item.INCOMEDAY};
					productDay.push(it);
					totalDay = totalDay.add(item.INCOMEDAY);
					let he = {name:item.PRODUCT_TYPE,value:item.INCOMEMONTH};
					productMonth.push(he);
					totalMonth = totalMonth.add(item.INCOMEMONTH);
					let she = {name:item.PRODUCT_TYPE,value:item.INCOMEYEAR};
					productYear.push(she);
					totalYear = totalYear.add(item.INCOMEYEAR);
				})
				vm.totalEarn = totalDay;
				myChart = echarts.init(document.getElementById('main'));
				myChart.setOption({
					title : {
				        text: '收益日报表',
				        x:'center'
				    },
				    tooltip: {
				        trigger: 'item',
				        confine: true,//防止提示超出图标
				        formatter: "{a} <br/>{b}: {c}万 ({d}%)"
				    },
				    color:vm.colorList,
				    graphic:{
				    	type:'text',
				    	left:'center',
				    	top:'center',
				    	style:{
				    		text:totalDay+'\n总收益(万元)',
				    		textAlign:'center',
				    		font: 'bolder 1em "Microsoft YaHei", sans-serif'
				    	}
				    },
				    series: [
				        {
				            name:'',
				            type:'pie',
				            radius: ['50%', '80%'],
				            avoidLabelOverlap: false,
				            label: {
				                normal: {
				                    show: false,
				                    position: 'center',
				                    formatter:function(){
				                    	return '';
				                    }
				                }
				            },
				            labelLine: {
				                normal: {
				                    show: false
				                }
				            },
				            data:productDay
				        }
				    ]
				})
			},
			error:function(xhr, type, errorThrown){
				if(type=='timeout')
					plus.nativeUI.toast('当前网络不可用，请检查你的网络设置');
				if(errorThrown)
					plus.nativeUI.toast('获取数据失败');
			}
		})
	}
	function fun2(){
		$.ajax({
			url:domainUrl+'MobileWebServiceActionAjax_getIncomeByMonthMap.action',
			dataType: 'json',
			type: 'post',
			timeout: 100000,
			beforeSend: function() {
		        plus.nativeUI.showWaiting("正在加载中...",{
					loading:{
						display:'block',
						icon:'/static/images/common/loading.png',
						height:'50px',
						interval:100,
					},
					background:'#F7F7F7 ',
					color:'#000000'
				});
		    },
		    complete: function() {
		        plus.nativeUI.closeWaiting();
		    },
			success: function(data) {
				let res = data.incomeByMonthMap;
				let red = res.map(function(item){
					return item.INCOME;
				});
				let bchart = echarts.init(document.getElementById('trend'));
				bchart.setOption({
					tooltip : {
					    trigger: 'axis',
					    confine: true,
					    axisPointer: {
					        type: 'cross',
					        label: {
					            backgroundColor: '#6a7985'
					        }
					    }
				    },
				    xAxis: {
				        type: 'category',
				        axisLine: {
				            show: true
				        },
				        axisTick: {
				            show: true
				        },
				        axisLabel: {
				            textStyle: {
				                color: '#999'
				            },
				            interval:0,
				            formatter:function(value){
	                            var ret = "";//拼接加\n返回的类目项
	                            var maxLength = 2;//每项显示文字个数
	                            var valLength = value.length;//X轴类目项的文字个数
	                            var rowN = Math.ceil(valLength / maxLength); //类目项需要换行的行数
	                            if (rowN > 1)//如果类目项的文字大于3,
	                            {
	                                for (var i = 0; i < rowN; i++) {
	                                    var temp = "";//每次截取的字符串
	                                    var start = i * maxLength;//开始截取的位置
	                                    var end = start + maxLength;//结束截取的位置
	                                    //这里也可以加一个是否是最后一行的判断，但是不加也没有影响，那就不加吧
	                                    temp = value.substring(start, end) + "\n";
	                                    ret += temp; //凭借最终的字符串
	                                }
	                                return ret;
	                            }
	                            else {
	                                return value;
	                            }
	                        }
				        },
				        data: [' 1月', ' 2月', ' 3月', ' 4月', ' 5月', ' 6月', ' 7月', ' 8月', ' 9月', '10月', '11月', '12月']
				    },
				    yAxis: {
				        type : 'value',
				        name:"单位:万",
				        nameLocation:'end',
				        nameTextStyle:{
				        	color:"#A7A7A7"
				        },
				        axisLine: {//去掉y轴
				            show: true
				        },
				        axisTick: {//隐藏刻度
				            show: true
				        },
				        axisLabel: {
				            show: true,
				            formatter:'{value}万'
				        },
				        splitLine:{//去掉网格线
							show:false
						}
				        
				    },
				    grid:{
				    	left:70
				    },
				    series: [{
				        data: red,
				        type: 'line',
				        itemStyle: {
				            color: '#FF5A4A'
				        },
				        label: {
				            normal: {
				                show: false
				            }
				        },
				        areaStyle: {
					    	normal: {
			                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1,
			                            [
			                                {offset: 0, color: '#FFE4B5'},
			                                {offset: 0.5, color: '#FFE4C4'},
			                                {offset: 1, color: '#FFF5EE'}
			                            ]
			                    )
					        }
				    	}
				    }]
				})
			},
			error:function(xhr, type, errorThrown){
				if(type=='timeout')
					plus.nativeUI.toast('当前网络不可用，请检查你的网络设置');
				if(errorThrown)
					plus.nativeUI.toast('获取数据失败');
			}
		})
	}
	//重写toFixed方法(四舍五入，原来是四舍六入五成双)
	Number.prototype.toFixed = function (s) {
	    var that = this, changenum, index;
	    // 负数
	    if (this < 0) {
	        that = -that;
	    }
	    changenum = (parseInt(that * Math.pow(10, s) + 0.5) / Math.pow(10, s)).toString();
	    index = changenum.indexOf(".");
	    if (index < 0 && s > 0) {
	        changenum = changenum + ".";
	        for (var i = 0; i < s; i++) {
	            changenum = changenum + "0";
	        }
	    } else {
	        index = changenum.length - index;
	        for (var i = 0; i < (s - index) + 1; i++) {
	            changenum = changenum + "0";
	        }
	    }
	    if (this < 0) {
	        return -changenum;
	    } else {
	        return changenum;
	    }
	}
	//由于js在浮点数计算时，是先转换为对应的二进制再进行计算 ，结果有误差，添加以下方法得到精确结果
	Number.prototype.add = function (arg){ 
		return accAdd(arg,this);
	}
	function accAdd(arg1,arg2){ 
		var r1,r2,m; 
		try{
			r1=arg1.toString().split(".")[1].length;
		}catch(e){
			r1=0
		}
		try{
			r2=arg2.toString().split(".")[1].length;
		}catch(e){
			r2=0
		} 
		m=Math.pow(10,Math.max(r1,r2));
		return (arg1*m+arg2*m)/m
	}
})
