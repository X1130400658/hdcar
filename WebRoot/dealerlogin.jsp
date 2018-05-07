<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录车商管理</title>

<link rel="icon" href="resources/plugins/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="resources/plugins/img/favicon.ico" type="image/x-icon">
	 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <meta name="keywords" content="黄豆二手车，二手车">
  <meta name="description" content="黄豆二手车平台，后台管理网站，制作人徐志平">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/css/skin-blue.min.css">
<style type="text/css">
.progress{
	position:absolute;
	z-index:1001;
	left: 50%; 
	top: 50%; 
	margin:-100px 0 0 -160px;
}
.alert{
 	position:absolute;
	z-index:1000;
	left: 50%; 
	top: 50%; 
	width:320px;
	heigth:200px;
	margin:-100px 0 0 -160px;
}
@media all and (orientation:portrait){
body{
 margain:0;
 background-image:url("resources/plugins/img/2c.jpg");
 background-repeat:no-repeat;
 background-size:100% 100%;
}
}
/* 横屏 */
@media all and (orientation:landscape){
body{
 margain:0;
 background-image:url("resources/plugins/img/1c.png");
 background-repeat:no-repeat;
 background-size:100% 100%;
}
}
#mydiv{

background-color:rgba(255, 255, 255, 0.66);
 	width:352px;  
   height:300px;  
   position:absolute;  
   left:50%;  
   top:50%;
   margin-top:-150px;
   margin-left:-176px;  
   border-radius:20px;
}
#form{
position:absolute;
left:60px;
top:80px;
}
.btn{
margin-top:0px !important;
padding:4px 50px !important;
line-height:1.3 !important;
}
.fr{
float:left !important;
}
</style>
<script src="resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
 <script src="resources/plugins/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
<div id="mydiv">
<img src="resources/plugins/img/loginLogo.png" style="heigth:70px;width:70px;"/><span style="font-size:40px;">黄豆二手车</span>
<div id="form">
  <div class="form-group">
    <label for="exampleInputEmail1">登录名</label>
    <input type="text" class="form-control" id="username" placeholder="请输入用户名" style="width:220px;" name="dealer.user">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">密码</label>
    <input type="password" class="form-control" id="password" placeholder="请输入密码" style="width:220px;" name="dealer.pass">
  </div>
<div style="position:absolute;">
  <button onclick="login()" class="btn btn-info" style="position:relative;left:40px;top:-12px;">登录</button>

  <label style="position:relative;left:-150px;top:22px;"><input name="Fruit" type="radio" value="dealer" checked/>车商登录 </label>
  <label style="position:relative;left:60px;top:-5px;"><input name="Fruit" type="radio" value="admin" />管理员登录 </label>
  <label style="position:relative;left:70px;top:-5px;"><input name="Fruit" type="radio" value="user" />用户登录 </label> <br>
  </div>
  <div style="position:relative;top:50px;"</div>
</div>
</div>
<div class="alert alert-warning alert-dismissible" style="display:none;">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-warning"></i> 警告!</h4>
                用户名或密码错误
</div>
</body>
</html>
<script type="text/javascript">
function login(){
	var username=document.getElementById("username").value;
    var password=document.getElementById("password").value;
    var id=document.getElementsByName("Fruit");
    var idname="";
    for(var i=0;i<id.length;i++){
    	if(id[i].checked){
    	idname =id[i].value;
    	}
    }
   
  	$.ajax({  
               type: 'post',
			   url: 'login/check', 
               data:  {username:username ,password:password ,idname:idname}, 
                    success : function(result) {//返回数据根据结果进行相应的处理  
                    	
                    if(result.msg=="success"){
							if(result.status==2){
								localStorage.setItem("username",result.user); 
								localStorage.setItem("money",result.money); 
								window.location.href="jsp/buycar3.jsp";
                    	} else{	
                    	localStorage.setItem("username",result.user);  
				  		localStorage.setItem("status",result.status); 
				  		localStorage.setItem("carCount",result.carCount);  
				  		localStorage.setItem("carNewCount",result.carNewCount);
				  		localStorage.setItem("order",result.order);  
				  		localStorage.setItem("orderPrepare",result.orderPrepare);
				  		localStorage.setItem("dealerCount",result.dealerCount);  
				  		localStorage.setItem("sumMoney",result.sumMoney); 
				  		localStorage.setItem("userCount",result.userCount);  
				  		localStorage.setItem("userlogCount",result.userlogCount);
				  		localStorage.setItem("Jan",result.Jan);  
				  		localStorage.setItem("Feb",result.Feb);
				  		localStorage.setItem("Mar",result.Mar);  
				  		localStorage.setItem("Apr",result.Apr);
				  		localStorage.setItem("May",result.May);  
				  		localStorage.setItem("Jun",result.Jun);
				  		localStorage.setItem("Jul",result.Jul);  
				  		localStorage.setItem("Aug",result.Aug);
				  		localStorage.setItem("Sep",result.Sep);  
				  		localStorage.setItem("Oct",result.Oct);
				  		localStorage.setItem("Nov",result.Nov);  
				  		localStorage.setItem("Dec",result.Dec); 
				  		localStorage.setItem("Total",result.Total);
				  		localStorage.setItem("loanJan",result.loanJan);  
				  		localStorage.setItem("loanFeb",result.loanFeb);
				  		localStorage.setItem("loanMar",result.loanMar);  
				  		localStorage.setItem("loanApr",result.loanApr);
				  		localStorage.setItem("loanMay",result.loanMay);  
				  		localStorage.setItem("loanJun",result.loanJun);
				  		localStorage.setItem("loanJul",result.loanJul);  
				  		localStorage.setItem("loanAug",result.loanAug);
				  		localStorage.setItem("loanSep",result.loanSep);  
				  		localStorage.setItem("loanOct",result.loanOct);
				  		localStorage.setItem("loanNov",result.loanNov);  
				  		localStorage.setItem("loanDec",result.loanDec); 
				  		localStorage.setItem("loanTotal",result.loanTotal);  
				  		localStorage.setItem("userlogJan",result.userlogJan);  
				  		localStorage.setItem("userlogFeb",result.userlogFeb);
				  		localStorage.setItem("userlogMar",result.userlogMar);  
				  		localStorage.setItem("userlogApr",result.userlogApr);
				  		localStorage.setItem("userlogMay",result.userlogMay);  
				  		localStorage.setItem("userlogJun",result.userlogJun);
				  		localStorage.setItem("userlogJul",result.userlogJul);  
				  		localStorage.setItem("userlogAug",result.userlogAug);
				  		localStorage.setItem("userlogSep",result.userlogSep);  
				  		localStorage.setItem("userlogOct",result.userlogOct);
				  		localStorage.setItem("userlogNov",result.userlogNov);  
				  		localStorage.setItem("userlogDec",result.userlogDec); 
				  		localStorage.setItem("userlogTotal",result.userlogTotal);
                    	window.location.href="jsp/index.jsp";
                    	}
                    }else{
                        $(".alert").show();
                    	
                    }
							
                        }  
                });  
        
} 
$(".close").click(function(){
	window.location.href="dealerlogin.jsp"; 
})
</script>

