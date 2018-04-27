function quit() {
          if(confirm("您确定退出系统吗？")){
           	delCookie("aid");
           	parent.location.href="OPLogin.html";
           	}else{
           	 return;
           	}
        }
        
        function changeAdmin(){
           if(confirm("您确定切换用户吗？")){
           	delCookie("aid");
           	parent.location.href="OPLogin.html";
           	}else{
           	 return;
           	}
        }
        
        function dispalyMenu(){
           var aid = getCookie("aid");
           $.ajax({
                resultType:"json",
				url:"dispalyMenu.do",
				data:{admin_id:aid},
				type:"post",
				success:function(data){
					$.each(data.data,function(i,j){
						
						if(j=="常用菜单"){
							$("#firstMenu").show();
						}
						if(j=="信息查询"){
							$("#SecondMenu").show();
						}
						if(j=="客户管理"){
							$("#ThirdMenu").show();
						}
						if(j=="入住管理"){
							$("#FourMenu").show();
						}
						if(j=="后台设置"){
							$("#FirthMenu").show();
						}
						if(j=="营业额统计"){
							$("#count").show();
						}
					});
						$("#todayIncome").text(data.list[0]);
						$("#weekIncome").text(data.list[1]);
						$("#monthIncome").text(data.list[2]);
						$("#allIncome").text(data.list[3]);
				}
        });
      }
  