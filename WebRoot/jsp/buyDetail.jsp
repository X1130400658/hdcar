<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>黄豆二手车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" href="<%=path %>/resources/plugins/img/favicon.ico" type="image/x-icon">
	<link rel="shortcut icon" href="<%=path %>/resources/plugins/img/favicon.ico" type="image/x-icon">
	 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
	<link href="<%=path %>/resources/plugins/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>   
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
  .form-control{margin-top:12px;width:25% !important;margin-right:20px;}
  #list img{height:100px;}
  .thumbnail{margin-bottom:2px !important;}
.images_1_of_3 {
    width: 18.5%;
    height:410px;
}
.grid_1{height:100%;} 
.price{margin-bottom:10px;}
.el-select .el-input {
    width: 110px;
  }
  .selectInput{
  	width: 600px;
  }
</style>
<!-- 引入样式 -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<!-- 引入组件库 -->
<script src="<%=path %>/resources/plugins/js/jquery-2.2.3.min.js"></script>
  <script src="<%=path %>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
  </head>
  
  <body>
<header>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <a class="navbar-brand" href="jsp/buycar3.jsp"><img src="resources/plugins/img/loginLogo.png" style="float:left;width: 30px;height: 30px;">
                <span>黄豆二手车</span>
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="jsp/buyrecord.jsp">购买记录</a></li>
                	
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="username"><a href="#">xzp</a></li>
                </ul>
            </div>
        </div>
    </nav>
 </header>
 <form>

		<input type="text" class="form-control" name="user" id="dealerS" readonly/>
		<input type="text" class="form-control" name="brand" id="menu" style="display:inline-block" readonly> 
		
		<input type="text" class="form-control" name="model" id="modelmenu" style="display:inline-block" readonly> 

		<input type="text" class="form-control" name="modelnote" id="modelnotemenu" style="display:inline-block"readonly> 
	
		<input type="text" class="form-control" placeholder="排量" name="enginesize" id="pl" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="排放标准" name="emission" id="pfbz" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="座位数" name="seatno" id="zws" style="display:inline-block" readonly/>
		
		<input type="text" class="form-control" placeholder="购入年份" name="buydate" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="上牌年份" name="regdate" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="年检有效期" name="motexp" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="保险有效期" name="insureexp" style="display:inline-block" readonly/>
		
		<input type="text" class="form-control" name="type" placeholder="车型" style="display:inline-block" readonly/> 
		<input type="text" class="form-control" placeholder="上牌地点" name="regsite" style="display:inline-block" readonly/>
		<input type="text" class="form-control" name="city" id="citymenu" style="display:inline-block" readonly/> 

		<input type="text" class="form-control" name="sunroof" style="display:inline-block" readonly/> 			
		<input type="number" class="form-control" placeholder="表显示公里" name="mileage" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="颜色" name="color" style="display:inline-block" readonly/>
		<input type="number" class="form-control" placeholder="售价" name="price" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="VIN车架号" name="vin" style="display:inline-block" readonly/>
	
		<input type="number" class="form-control" placeholder="事故次数" name="accidentno" style="display:inline-block" readonly/>
		<input type="text" class="form-control" placeholder="违章罚款额" name="fine" style="display:inline-block" readonly/>
		<input type="number" class="form-control" placeholder="过户次数" name="tradeno" style="display:inline-block" readonly/>	
	
		<textarea class="form-control" rows="3" name="location" placeholder="请填写详细地址(验车地点)" style="display:inline-block" readonly></textarea>
		<textarea class="form-control" rows="3" name="repairdes" placeholder="维修描述" style="display:inline-block" readonly></textarea>
		<textarea class="form-control" rows="3" name="refitdes" placeholder="改装描述" style="display:inline-block" readonly></textarea>
		
		<input type="tel" class="form-control" placeholder="手机号" name="sellertel" style="display:inline-block" readonly/>	
	</form>

  </body>
  <script src="<%=path %>/resources/plugins/js/jquery-2.2.3.min.js"></script>
    <!-- import Vue before Element -->
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <!-- import JavaScript -->
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</html>
<script type="text/javascript">
var username = localStorage.getItem("username"); 
var money = localStorage.getItem("money");
var listseq = localStorage.getItem("carId");
$("#username").html('<a href="#">欢迎：'+username+'！余额：'+money+'元</a>');
window.onload=function(){

	$.ajax({
        url:'car/carDetail/'+listseq,
        async: false,
        type:'get',
        dataType: 'json',    
        success:function (res) {
        	var buyDate=new Date(res.car.buydate);
			var buydate=buyDate.toLocaleDateString();
			var regDate=new Date(res.car.regdate);
			var regdate=regDate.toLocaleDateString();
			var Motexp=new Date(res.car.motexp);
			var motexp=Motexp.toLocaleDateString();
			var Insureexp=new Date(res.car.insureexp);
			var insureexp=Insureexp.toLocaleDateString();
      		$("input[name='user']").val(res.car.user);
      		$("input[name='brand']").val(res.car.brand); 
      		$("input[name='model']").val(res.car.model);
      		$("input[name='modelnote']").val(res.car.modelnote);
      		$("input[name='enginesize']").val(res.car.enginesize); 
      		$("input[name='emission']").val(res.car.emission); 
      		$("input[name='seatno']").val(res.car.seatno);
      		$("input[name='buydate']").val(buydate); 
      		$("input[name='regdate']").val(regdate); 
      		$("input[name='motexp']").val(motexp);
      		$("input[name='insureexp']").val(insureexp); 
      		$("input[name='type']").val(res.car.type); 
      		$("input[name='regsite']").val(res.car.regsite);
      		$("input[name='city']").val(res.car.city); 
      		$("input[name='sunroof']").val(res.car.sunroof); 
      		$("input[name='mileage']").val(res.car.mileage);
      		$("input[name='color']").val(res.car.color); 
      		$("input[name='price']").val(res.car.price); 
      		$("input[name='vin']").val(res.car.vin);
      		$("input[name='accidentno']").val(res.car.accidentno); 
      		$("input[name='fine']").val(res.car.fine); 
      		$("input[name='tradeno']").val(res.car.tradeno);
      		$("input[name='sellertel']").val(res.car.sellertel); 
      		$("textarea[name='location']").val(res.car.location);
      		$("textarea[name='repairdes']").val(res.car.repairdes);   
      		$("textarea[name='refitdes']").val(res.car.refitdes); 
        }
    })
	}

</script>
