<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
	
	<meta charset="UTF-8">
	<title>果然新鲜</title>
	<meta name="keywords" content="果然新鲜">
	<meta name="content" content="果然新鲜">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<!--     <link type="text/css" rel="stylesheet" href="<%=path %>/css/login.css"> -->
    <script type="text/javascript" src="<%=path %>/js/jquery.min.js"></script>
    
    <script type="text/javascript" src="<%=path %>/js/YMDClass.js"></script>
<style type="text/css">
#font {
    color: #CDCDCD;
}
</style>

<script type="text/javascript">
		var msg ="${message1}";
		if(msg!=""){
			alert(msg);
		}
</script>   

<script>
    //页面加载函数
    function iniState()
    {
        //默认获得输入焦点
        document.getElementById("txt_Uname").focus();
        //获得随机数
        getValidateCode();  
    }
    //生成四位随机数
    function getValidateCode()
    {
        var vCode = "0000";
        vCode = String(Math.round(Math.random()*10000));    
        while(vCode.length<4)
        {
            vCode = "0" + vCode;
        }
        //将vCode放入lable中显示在页面上
        document.getElementById("vCode").innerHTML=vCode;
    }
    //显示公用方法
    //显示错误信息div方法
    /*
    说明：显示错误信息函数
    参数 eId：要显示div的id
    参数 msg：要显示的信息内容
    */
    function showErrorMsg(eId,msg){
        document.getElementById(eId).innerHTML = msg;
        document.getElementById(eId).style.display = "";
    }   
    //隐藏错误信息div方法
    /*
    说明：隐藏错误信息函数
    参数eId：要隐藏的div的id
    */
    function clearMsg(eId){
        document.getElementById(eId).style.display = "none";    
    }
    //失去焦点事件
    /*
    用户名
    失去焦点时验证是否符合规则
    参数UName：用户输入的用户名
    参数eId：错误提示div的id
    返回值：若符合要求：返回true，不符合：返回false；
    */
    function verifyUName(UName,eId){
        var msg = "";
        var strUserName = UName.trim();
        //用户名必须6~20位.
        if(strUserName.length < 6 || strUserName.length > 20 ){
            msg = "<font color='red'>用户名必须6~20位</font>";
            showErrorMsg(eId,msg);
            return false;
        }
        
         $.ajax({
                   
                    type: "post",
					url:"<%=path%>/checkUserName.go",
					data:{"username":strUserName},
					async: false,
					success:function(data){
					if(1==data){
					msg = "<font color='red'>对不起，用户名已存在！</font>";
                    showErrorMsg(eId,msg);
                    }else if(2==data){
                      msg = "<font color='red'>恭喜，用户名可以使用！</font>";
                      showErrorMsg(eId,msg);
                    }
					},
					error:function(data){alert("出错了")}
				});
        
        //使用正则表达式验证
        var pattern = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,19}$/;
        if(pattern.test(strUserName)){
            clearMsg(eId);
  				  showErrorMsg(eId,msg);
            return true;
        }else{
            msg = "<font color='red'>用户名输入错误</font>";   
            showErrorMsg(eId,msg);
            return false;
        };
        return true;
        
    }
    /*
    密码
    失去焦点时验证是否符合规则
    参数UPass：用户输入的密码
    参数eId：错误提示div的id
    返回值：若符合要求：返回true，不符合：返回false；
    */
    function verifyPass(pwd,eId){
        var msg = "";
        var strPwd = pwd.trim();
        //密码必须6~20位.
        if(strPwd.length < 6 || strPwd.length > 20 ){
            msg = "<font color='red'>密码必须6~20位</font>";
            showErrorMsg(eId,msg);
            return false;
        }
        //使用正则表达式验证
        var pattern = /^[a-zA-Z0-9]{0,19}$/;
        if(pattern.test(strPwd)){
            clearMsg(eId);
            return true;
        }else{
            msg = "<font color='red'>密码格式不错误</font>";   
            showErrorMsg(eId,msg);
            return false;
        };
        return true;
    }
    /*
    重复密码
    失去焦点时验证是否符合规则
    参数UPass：用户输入的密码
    参数eId：错误提示div的id
    返回值：若符合要求：返回true，不符合：返回false；
    */
    function verifyRePass(pwd,pwd1,eId){
        var msg = "";
        var strPwd1 = pwd.trim();
        var strPwd2 = pwd1.trim();
        //密码必须6~20位.
        if(strPwd1 != strPwd2){
            msg = "<font color='red'>两次密码输入不一致</font>";
            showErrorMsg(eId,msg);
            return false;
        }else{
            clearMsg(eId);
            return true;    
        };
        return true;  
    }
	
	/*真实姓名*/
	function verifyRealName(RealName,eId){
        var msg = "";
        var strRealName = RealName.trim();
        if(strRealName.length < 1 ){
            msg = "<font color='red'>请输入您的姓名</font>";
            showErrorMsg(eId,msg);
            return false;
        }
        //使用正则表达式验证
        var pattern = /^[\u0391-\uFFE5]+$/;
        if(pattern.test(strRealName)){
            clearMsg(eId);
            return true;
        }else{
            msg = "<font color='red'>名字输入格式错误</font>";   
            showErrorMsg(eId,msg);
            return false;
        };
        return true;
    }
	
//     /*
//     单选
//     提交时是否符合规则
//     参数radioName：一组单选按钮的name
//     参数eId：错误提示div的id
//     返回值：若符合要求：返回true，不符合：返回false；
//     */
//     function verifyRidio(radioName,eId){
//         var ridioName = document.getElementsByName(radioName);
//         for(var i=0;i<2;i++){
//             if(ridioName[i].checked){
//                 return true;
//             };
//         }
//         msg = "<font color='red'>请选择</font>";
//         showErrorMsg(eId,msg);
//         return false;
//     }
    /*
    手机号
    失去焦点时验证是否符合规则
    参数mail：用户输入的手机号
    参数eId：错误提示div的id
    返回值：若符合要求：返回true，不符合：返回false；
    */
    function verifyMail(mail,eId){
        var msg = "";
        var strMail = mail.trim();
        //密码必须6~20位.
        if(strMail.length < 6){
            msg = "<font color='red'>请输入正确的手机号</font>";
            showErrorMsg(eId,msg);
            return false;
        }
        //使用正则表达式验证邮箱
        var pattern = /^1[34578]\d{9}$/;
        if(pattern.test(strMail)){
            clearMsg(eId);
            return true;
        }else{
            msg = "<font color='red'>手机号格式错误</font>";   
            showErrorMsg(eId,msg);
            return false;
        };
        return true;
    }
    /*
    说明：主验证函数：验证所以输入选择是否符合要求
    规则：要求所以验证都符合规则
    返回值：若所以验证都符合：返回true，有一个不通过：返回false
    */
    function verifyInput(){
        //通过表单名称，得到输入表单
        var form = document.form_register;
        //以此验证
        if(verifyUName(form.txt_Uname.value,'div_uname') && 
            verifyPass(txt_Pwd1.value,'div_pwd1') && 
            verifyRePass(txt_Pwd1.value,txt_Pwd2.value,'div_pwd2') && 
//             verifyRidio('radio_name','div_ridio') && 
            verifyMail(txt_Mail.value,'div_mail') && 
            verifyRealName(txt_Realname.value,'div_realname')){
            
            return(true);
        }else{
            alert("注册失败，请按红色提示修改"); 
            return(false);
        };   
    }
</script>
<style type="text/css">
	
	#body {
		background:url(images/beijing.jpg) no-repeat;
	}
</style>
</head>
<body onload="iniState()" id="body">
<form id="form1" name="form_register" method="post" action="<%=path%>/addUser.go">
  <table width="800" border="0" align="center">
    <tr align="right">
      <th colspan="6" align="center" bgcolor="#abc4e4" scope="col">用户注册</th>
    </tr>
    <tr align="right">
      <td height="1" colspan="6" bgcolor="#abc4e4"></td>
    </tr>
    <tr>
      <td height="50" align="right" width="200">用户名：</td>
      <td width="200" height="50" colspan="3">
        <input name="username" type="text" id="txt_Uname" onfocus="clearMsg('div_uname');" onblur="verifyUName(txt_Uname.value,'div_uname');"/>
      </td>
      <td width="200" height="50"><div id="div_uname"></div>&nbsp;</td>
      <td width="200" height="50"><code id="font">英文字母阿拉伯数字下划线组合，长度为6-20位，只能以字母开头</code></td>
    </tr>
    <tr>
      <td height="50" align="right">输入密码：</td>
      <td colspan="3"><input name="password" type="password" id="txt_Pwd1" onblur="verifyPass(txt_Pwd1.value,'div_pwd1');" onfocus="clearMsg('div_pwd1');" /></td>
      <td><div id="div_pwd1"></div></td>
      <td rowspan="2"><code id="font">英文字母阿拉伯数字组合，英文区分大小写，长度为6-20位</code></td>
    </tr>
    <tr>
      <td height="50" align="right">验证密码：</td>
      <td colspan="3"><input name="txt_Pwd2" type="password" id="txt_Pwd2" onfocus="clearMsg('div_pwd2')" onblur="verifyRePass(txt_Pwd1.value,txt_Pwd2.value,'div_pwd2');" /></td>
      <td><div id="div_pwd2"></div></td>
    </tr>
    <tr>
      <td height="1" colspan="6" bgcolor="#abc4e4"></td>
    </tr>
    
    <tr>
      <td height="1" colspan="6" bgcolor="#abc4e4"></td>
    </tr>
    
    
    <tr>
      <td height="50" align="right" width="200">姓名：</td>
      <td width="200" height="50" colspan="3">
        <input name="realname" type="text" id="txt_Realname" onfocus="clearMsg('div_realname');" onblur="verifyRealName(txt_Realname.value,'div_realname');"/>
      </td>
      <td width="200" height="50"><div id="div_realname"></div>&nbsp;</td>
      <td width="200" height="50"><code id="font">请输入您的真实名字</code></td>
    </tr>
    
    
    
    <tr>
      <td height="50" align="right">出生日期：</td>
      <td colspan="4">
          <input type="text" name="birthday">
      </td>
      <td rowspan="2"><code id="font">为方便您的使用，请填写真实信息</code></td>
    </tr>
    <tr>
      <td height="50" align="right">性别：</td>
      <td colspan="3">
      <input name="sex" type="radio" id="ridio1" value="男" checked="checked" />
      <label for="ridio1">男&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="radio" name="sex" id="ridio2" value="女" />
                                                    女</label></td>
      <td><div id="div_ridio"></div></td>
    </tr>
    <tr>
      <td height="50" align="right">手机号：</td>
      <td colspan="3"><input name="phone" type="text" id="txt_Mail" onfocus="clearMsg('div_mail')" onblur="verifyMail(txt_Mail.value,'div_mail')"/></td>
      <td><div id="div_mail"></div></td>
      <td><code id="font">请输入正确的手机号码，以便忘记密码找回</code></td>
    </tr>
    <tr>
      <td height="1" colspan="6" bgcolor="#abc4e4"></td>
    </tr>
    
    <tr>
      <td height="1" colspan="6" bgcolor="#abc4e4"></td>
    </tr>
    <tr>
      <td height="50" colspan="6" align="center"><a href="javascript:form1.submit();"  onclick="return verifyInput();"><input name="" type="submit" value="点击注册" /></a></td>
    </tr>
    <tr>
      <td height="1" colspan="6" bgcolor="#abc4e4"></td>
    </tr>
  </table>
</form>
</body>
           
 
<script>
	new YMDselect('year1','month1','day1');
</script>


</html>
