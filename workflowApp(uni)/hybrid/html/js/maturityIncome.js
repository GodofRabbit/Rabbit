document.addEventListener('UniAppJSBridgeReady', function() {
	// 基于准备好的dom，初始化echarts实例
	var domainUrl;
	var myChart1 = echarts.init(document.getElementById('chart1'));
	var myChart2 = echarts.init(document.getElementById('chart2'));
	// 指定图表的配置项和数据(第一张图)
	var option1 = {
	    //鼠标触发提示数量
	    tooltip: {
	    	trigger: "axis",
	    	confine: true,
	    },
	    legend: {
	    	x : 'center',
	        y : 'top',
	        data:["投资收益"]
	    },
	    //x轴显示
	    xAxis: {
	        data: [],
	        axisLine: {
	            show: false
	        },
	        axisTick: {
	            show: false
	        },
	        splitLine:{
	        　　　　    show:false
	        　　    },
	        axisLabel:{
			    interval:0,//横轴信息全部显示
			    rotate:-30
			}
	    },
	    //y轴显示
	    yAxis: {
	    	axisLine: {
	            show: false
	        },
	        axisTick: {
	            show: false
	        },
	        axisLabel: {
	        	formatter:'{value}万',
	        },
	        name:"单位:万",
	        nameLocation:'end',
	        nameTextStyle:{
	        	color:"#A7A7A7"
	        }
	    },
	    grid: {
	        left: 70
	    },
	    dataZoom: [
	        {
	            type: 'slider',
	            show:false,     
	            xAxisIndex: 0,
	            start: 0,
	            end: 70
	        },
	        {
	            type: 'inside',
	            xAxisIndex: 0,
	            start: 0,
	            end: 70
	        }
	    ],
	    series: [
	    	{
		        name: "投资收益",
		        type: "bar",
		        stack: "业务",//折叠显示
		        data: [],
		        //显示颜色
		        itemStyle:{  
		             normal:{color:"#FDBF20"}  
		        }
		    }
	     ]
	};
		
	// 指定图表的配置项和数据 (第二张图)
	var option2 = {
		//鼠标触发提示数量
	    tooltip: {
	    	trigger: "axis",
	    	confine: true,
	    	axisPointer: {
	            type: 'cross',
	            crossStyle: {
	                color: '#999'
	            }
	        }
	    },
	    legend: {
	    	x: 'center',
	    	y: 'top',
	        data:['投资金额','投资收益']
	    },
	    xAxis: [
	        {
	            type: 'category',
	            data: [],
	            axisLine: {
	            	show: false
		        },
		        axisTick: {
		            show: false
		        },
		        axisLabel:{
				    interval:0,//横轴信息全部显示
				    rotate:-30,//-30度角倾斜显示
				}
	        }
	    ],
	    yAxis: [
	        {
	            name: '单位:万',
	            nameTextStyle:{
		        	color:"#A7A7A7"
		        },
		        axisLine: {
	            	show: false
		        },
		        axisTick: {
		            show: false
		        },
		        axisLabel:{
		        	formatter:'{value}万'
		        }
		       
	        },
	        {
	            name: '',
	            nameTextStyle:{
		        	color:"#A7A7A7"
		        },
		        axisLine: {
	            	show: false
		        },
		        axisTick: {
		            show: false
		        },
	            axisLabel:{
		        	formatter:''
		        }
	        }
	    ],
	    grid: {
	        left: 70
	    },
	    dataZoom: [
	        {
	            type: 'slider',
	            show:false,     
	            xAxisIndex: 0,
	           /* start: 0,
	            end: 70*/
	        },
	        {
	            type: 'inside',
	            xAxisIndex: 0,
	            /*start: 0,
	            end: 70*/
	        }
	    ],
	    series: [
	        {
	            name:'投资金额',
	            type:'bar',
	            barWidth:40,
	            data:[],
	            itemStyle:{  
	            	 normal:{color:"#FF8E34"}  
	       		 }
	        },
	        {
	            name:'投资收益',
	            type:'line',
	            yAxisIndex: 1,
	            smooth: true,
	            data:[],
	            itemStyle:{  
	            	 normal:{color:"#FC5832"}  
	       		 }
	        }
	    ]
	};
	
			myChart1.setOption(option1);
			myChart2.setOption(option2);
			
	domainUrl = 'http://192.168.101.180:8080/fund/';
	fun1();
	fun2();
	
	function fun1(){
		$.ajax({
			url:domainUrl+'MobileWebServiceActionAjax_getAllIncomeByProductTypeMap.action',
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
				let mrmoney = [];
				let productType = [];
				data.allIncomeByProductTypeMap.forEach(function(item){
					mrmoney.push(item.TOTLEMONEY);
					productType.push(item.PRODUCT_TYPE);
				})
				myChart1.setOption({
					xAxis: {
	        			data:productType,
					},
					series: [{
						data:mrmoney
					}]
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
	function fun2(){
		$.ajax({
			url:domainUrl+'MobileWebServiceActionAjax_getAllIncomeByCusMap.action',
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
				let revenue = [];//收益
				let cusname = [];//交易对手
				let invest = []; //投资
				data.allIncomeByCusMap.forEach(function(item){
					revenue.push(item.REVENUE_AMOUNT);
					cusname.push(item.CUS_NAME);
					invest.push(item.INVEST_AMOUNT);
				})
				myChart2.setOption({
					xAxis: [{
			            type: 'category',
			            data: cusname
		            }],
			        series: [{
			            data:invest
				    },{
				    	data:revenue
				    }]
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
