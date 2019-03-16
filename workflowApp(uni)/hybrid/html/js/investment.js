document.addEventListener('UniAppJSBridgeReady', function() {
	var domainUrl;
	var invest = echarts.init(document.getElementById('invest'));
	//投资类型占比echarts图绘制
	var option = {
	    tooltip: {
	        trigger: 'item',
	        confine: true,
	        formatter: "{a} <br/>{b}: {c}万 ({d}%)"
	    },
	    color:['#41daea','#3E98C5'],
	    series: [
	        {
	            name:'投资类型占比',
	            center: ["50%", "50%"],
	            radius: ["50%","85%"],
	            type:'pie',
	            avoidLabelOverlap: false,
	            label: {
	                normal: {
	                    show: true,
	                    position: 'inner',
	                    formatter:'{b}\n{d}%'
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:[]
	        }
	    ]
	   
	}
	//年度投资曲线echarts图绘制所需变量
	var placeHoledStyle = {
	    normal:{
	        barBorderColor:'rgba(0,0,0,0)',
	        color:'rgba(0,0,0,0)'
	    },
	    emphasis:{
	        barBorderColor:'rgba(0,0,0,0)',
	        color:'rgba(0,0,0,0)'
	    }
	};
	var dataStyle = { 
	    normal: {
	        label : {
	            show: true,
	            position: 'insideLeft',
	            formatter: '{c}万'
	        }
	    }
	};
	
		invest.setOption(option);
	
	
	domainUrl = 'http://192.168.101.180:8080/fund/';
	fun1();
	fun2();
	fun3();
	
	function fun1(){
		$.ajax({
			url:domainUrl+'MobileWebServiceActionAjax_getInvestByInvestTypeMap.action',
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
				if(data.investByInvestTypeMap!=null && data.investByInvestTypeMap!=''){
					jQuery('#ziying').html(data.investByInvestTypeMap[1].INVESTNUM+'笔');
					jQuery('#weituo').html(data.investByInvestTypeMap[0].INVESTNUM+'笔');
					invest.setOption({
						series:[{
							data:[{
								value:data.investByInvestTypeMap[1].MRMONEY,
								name:'自营'
							},
							{
								value:data.investByInvestTypeMap[0].MRMONEY, 
								name:'委托'
							}]
						}]
					})
				}else{
					jQuery('#ziying').html('0笔');
					jQuery('#weituo').html('0笔');
				}
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
			url:domainUrl+'MobileWebServiceActionAjax_getInvestByTypeAndYearMap.action',
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
				let invest_year = data.investByTypeYear;//年份
				let mrmoney_self = [];//自营
				let mrmoney_entrust = [];//委托
				data.investByTypeAndYearMap.forEach(function(item){
					if(item.INVEST_TYPE=='1'){
						mrmoney_self.push(item.MRMONEY);
					}else{
						mrmoney_entrust.push(item.MRMONEY);
					}
				})
				if(invest_year.length>4){
					jQuery('#investyear').height(250+(invest_year.length-4)*50);
				}
				let investyear = echarts.init(document.getElementById('investyear'));
				investyear.setOption({
					title: {},
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        },
				        //formatter : '{b}年<br/>{a0}:{c0}万<br/>{a1}:{c1}万'
				    },
				    color:['#41daea','#3E98C5'],
				    legend: {
				        y: 5,
				        data:['自营', '委托']
				    },
				    grid: {
				        y: 80,
				        y2: 30,
				        top:40,
				        left:60
				    },
				    xAxis : [
				        {
				            type : 'value',
				            position: 'top',
				            axisTick:{       
					          show:false
					        },
					        axisLine:{      
					          show:true
					        },
				            splitLine: {show: false},
				            axisLabel: {show: false}
				        }
				    ],
				    yAxis : [
				        {
				            type : 'category',
				            splitLine: {
				            	show: false
				            },
				            axisTick:{       //y轴刻度线
					          show:true
					        },
					        axisLine:{       //y轴
					          show:true
					        },
				            axisLabel: {
					            show: true,
					            formatter:'{value}年'
					        },
				            data : invest_year
				        }
				    ],
				    series : [
				        {
				            name:'自营',
				            type:'bar',
				            barWidth : 40,
				            stack: '总额',
				            itemStyle : dataStyle,
				            data:mrmoney_self
				        },
				        {
				            name:'委托',
				            type:'bar',
				            barWidth : 40,
				            stack: '总额',
				            itemStyle : dataStyle,
				            data:mrmoney_entrust
				        }
				    ]
				});
			},
			error:function(xhr, type, errorThrown){
				if(type=='timeout')
					plus.nativeUI.toast('当前网络不可用，请检查你的网络设置');
				if(errorThrown)
					plus.nativeUI.toast('获取数据失败');
			}
		})
	}
	function fun3(){
		$.ajax({
			url:domainUrl+'MobileWebServiceActionAjax_getInvestByProductTypeAndYearMap.action',
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
				let invest_year = data.typeYear;//年份
				let produType = [];//产品类型
				let mrmoney_entrust = [];//委托
				data.investByProductTypeAndYearMap.forEach(function(item){
					produType.push(item.PRODUCT_TYPE);
				})
				produType = produType.filter(function(element,index,self){//对类型去重并反转数组
					return self.indexOf(element) === index;
				}).reverse();
				//重点:根据年份数组长度动态创建相应数量数组并设值,同时动态生成echarts中的series,还有tooltip中的formatter
				let obj = {};
				let seriesData = [];
				//let toolmatter = '{b}';
				let yearinvest = [];
				invest_year.map(function(item,index){
					yearinvest.push(item.toString());
					let th = item;
					let ind = 'arr'+(index+1);
					obj[ind] = [];
					data.investByProductTypeAndYearMap.map(function(item,index){
						if(th==item.INVESTYEAR){
							obj[ind].push(item.MRMONEY);
						}
					})
					obj[ind].reverse();
					let serie = {
				            name:item,
				            type:'bar',
				            barWidth : 40,
				            stack: '总额',
				            itemStyle : dataStyle,
				            data:obj[ind]
				        }
					seriesData.push(serie);
					//toolmatter+='<br/>{a'+index+'}年:{c'+index+'}万'
				})
				if(produType.length>4){
					jQuery('#investpro').height(250+(produType.length-4)*50);
				}
				let investyear = echarts.init(document.getElementById('investpro'));
				investyear.setOption({
					title: {},
				    tooltip : {
				        trigger: 'axis',
				        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
				            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				        },
				        //formatter : toolmatter
				    },
				    color:[ '#2196f4','#41daea','#FC5832','#4086F9','#ee4065',
					    	'#6ccc00','#f9cb00','#c065ff','#FF5725','#FDBF2D',
							'#22BECB','#4489F6','#FFC002','#8640F9'
					],
				    legend: {
				        y: 5,
				        data:yearinvest
				    },
				    grid: {
				        y: 80,
				        y2: 30,
				        top:40,
				        left:100
				    },
				    xAxis : [
				        {
				            type : 'value',
				            position: 'top',
				            axisTick:{       
					          show:false
					        },
					        axisLine:{      
					          show:true
					        },
				            splitLine: {show: false},
				            axisLabel: {show: false}
				        }
				    ],
				    yAxis : [
				        {
				            type : 'category',
				            splitLine: {
				            	show: false
				            },
				            axisTick:{       //y轴刻度线
					          show:true
					        },
					        axisLine:{       //y轴
					          show:true
					        },
				            axisLabel: {
					            show: true,
					            formatter:'{value}'
					        },
				            data : produType
				        }
				    ],
				    series : seriesData
				});
			},
			error:function(xhr, type, errorThrown){
				if(type=='timeout')
					plus.nativeUI.toast('当前网络不可用，请检查你的网络设置');
				if(errorThrown)
					plus.nativeUI.toast('获取数据失败');
			}
		})
	}
	
})
