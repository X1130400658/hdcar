<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>黄豆二手车</title>
    <link rel="icon" href="<%=path %>/resources/plugins/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="<%=path %>/resources/plugins/img/favicon.ico" type="image/x-icon">
	 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/css/AdminLTE.min.css">
   <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/bootstrap/css/bootstrap.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="<%=path %>/resources/plugins/css/skin-blue.min.css">

  <!-- 分页插件 -->
  <link href="<%=path %>/resources/plugins/css/pageGroup.css" rel="stylesheet" type="text/css" />
 <link href="<%=path %>/resources/plugins/css/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  </head>
  <style>
  .form-control{margin-top:12px;width:25%;margin-right:20px;}
.faa{margin-top:20px !important;}  
.modal-content{border-radius:6px !important;}
.modal-dialog{width:350px;}
  </style>
  <body class="hold-transition skin-blue fixed">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="javascript:;" class="logo">
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>黄豆</b>二手车</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
        <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">2</span>
            </a>
            <ul class="dropdown-menu">
             <li class="header">统计通知</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;"><ul class="menu" style="overflow: hidden; width: 100%; height: 200px;">
                  <li>
                   <a href="javascript:;">
                      <i class="fa fa-users text-aqua"></i> 用户数：<span id="userCount">22</span>
                  </a>
                  </li>
                 
                  <li>
                    <a href="javascript:;">
                      <i class="fa fa-users text-red"></i>  访问量：<span id="userlogCount">22</span>
                    </a>
                  </li>
                    
                </ul>
                </div>
              </li>
              <li class="footer"><a href="javascript:;">关闭</a></li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="resources/plugins/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs username">admin</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="resources/plugins/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p class="username">
                 admin
                </p>
              </li>

              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="javascript:;" class="btn btn-default btn-flat">重置</a>
                </div>
                <div class="pull-right">
                  <a href="<%=path %>/dealerlogin.jsp" class="btn btn-default btn-flat">退出</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="resources/plugins/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p class="username">admin</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu">
        <li class="header">主菜单</li>
        <!-- Optionally, you can add icons to the links -->

        <li class="treeview" id="dealer">
          <a href="#"><i class="glyphicon glyphicon-user"></i> <span>车商管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="jsp/dealerlist.jsp"><i class="fa fa-circle-o"></i>车商列表</a></li>
          </ul>
        </li>
        <li class="treeview" id="car">
          <a href="#"><i class="fa fa-car"></i> <span>车辆管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="jsp/carlist.jsp"><i class="fa fa-circle-o"></i>车辆列表</a></li>
            <li><a href="jsp/caradd.jsp"><i class="fa fa-circle-o"></i>添加车辆</a></li>
            <li><a href="jsp/carcheck.jsp"><i class="fa fa-circle-o"></i>检验车辆</a></li>
          </ul>
        </li>

        <li class="treeview" id="deposit">
          <a href="#"><i class="fa fa-cny"></i> <span>财务管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="jsp/refundlist.jsp"><i class="fa fa-circle-o"></i>退款申请</a></li>
            <li><a href="jsp/depositlist.jsp"><i class="fa fa-circle-o"></i>财务记录</a></li>
            <li><a href="jsp/depositCheck.jsp"><i class="fa fa-circle-o"></i>交易审核</a></li>
          </ul>
        </li>

       
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="content">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1 style="float:left;">
  		车辆详情
      </h1>
    
    </section>

    <!-- Main content -->
    <section class="content">

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
<div id="buttonGroup">

</div>
<div id="refundBtn">
</div>
	</section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- Default to the left -->
    <strong>Copyright &copy; 2017 <a href="#">xzp</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->


<!-- REQUIRED JS SCRIPTS -->

<script src="<%=path %>/resources/plugins/js/jquery-2.2.3.min.js"></script>
  <script src="<%=path %>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
   <script src="<%=path %>/resources/plugins/js/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=path %>/resources/plugins/js/app.min.js"></script>
</body>
</html>
<script type="text/javascript">
	var listseq=localStorage.getItem("carId");
	var name=localStorage.getItem("username");
	var status=localStorage.getItem("status");
	var userCount=localStorage.getItem("userCount");
	var userlogCount=localStorage.getItem("userlogCount");
	$(".username").html(name);
	if(status=="1"){
		$("#dealer").css("display","none");
		$("#deposit").css("display","none");
		$("#loadprod").css("display","none");
	}else{
		$("#userCount").html(userCount);
		$("#userlogCount").html(userlogCount);
	}
$.ajax({
                url:'car/carDetail/'+listseq,
                async: false,
                type:'get',
                dataType: 'json',    
                success:function (res) {
                	localStorage.setItem("carStatus",res.car.status);
                    var htm='<a href="car/refundSuccess?listseq='+res.car.listseq+'"><button id="tuikuan" class="btn btn-info">退回保证金</button></a>';
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
              		$("#refundBtn").html(htm);     
                }
            })
$.ajax({
                url:'deposit/getTranno/'+listseq,
                async: false,
                type:'get',
                dataType: 'json',    
                success:function (res) {
                	 depositlist=res.depositList;
				    xuanran(depositlist);
                }
            })

 function xuanran(datalist){  
       var tmp="";
       for(var i=0;i<getJsonLength(datalist);i++)
       {

       		if(datalist[i].trantype=="卖车保证金转入")
       		{
       		
       			tmp+='<button id="'+datalist[i].tranno+'" class="btn btn-info btn1" style="display:none;">退回卖方保证金</button>';
       		}else if(datalist[i].trantype=="买车保证金转入")
       		{
       			tmp+='<button id="'+datalist[i].tranno+'" class="btn btn-info btn2" style="display:none;">退回买方保证金</button>';
       		}
       }
       $("#buttonGroup").html(tmp);
   }
    function getJsonLength(json){
                var jsonLength=0;
                for (var i in json) {
                    jsonLength++;
                }
                return jsonLength;
            }
            
$("#tuikuan").click(function(){
var carStatus=localStorage.getItem("carStatus");
alert("退款成功");
	if(carStatus==3){
		$(".btn1").click(function(){
		var tranno=this.id;
		var type=2;
$.ajax({
   //url:"/hdcarTest/rest/pay/payRefund",
   url:"https://70094161.qcloud.la/hdcar/rest/pay/payRefund",
    data:{
        tranno:tranno,
        type:type,
    },
    async:false,
    type:"post",
    dataType:"json",
    beforeSend: function(request) {
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        },
    success:function(res){
		alert(res.msg);
    }
});  
});
$(".btn1").click();
	}
	else if(carStatus==15){
		
	    $(".btn1").click(function(){
		var tranno=this.id;
				 $.ajax({
				    //url:"/hdcarTest/rest/pay/payRefund",
				    url:"https://70094161.qcloud.la/hdcar/rest/pay/payRefund",
				    data:{
				        tranno:tranno,
				        type:type,
				    },
				    async:false,
				    type:"post",
				    dataType:"json",
				    beforeSend: function(request) {
				        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				        },
				    success:function(res){
						alert(res.msg);
				    }
				}); 
				});
	    $(".btn2").click(function(){
			var tranno=this.id;
			var type=1;
 			$.ajax({
    				//url:"/hdcarTest/rest/pay/payRefund",  
					url:"https://70094161.qcloud.la/hdcar/rest/pay/payRefund",
    				data:{
        			tranno:tranno,
        			type:type,
    				},
    				async:false,
    				type:"post",
    				dataType:"json",
    				beforeSend: function(request) {
        			request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        			},
    				success:function(res){
							alert(res.msg);
    				}
			}); 
			});
			$(".btn1").click();
			$(".btn2").click();
		}
	else if(carStatus==20){
	   $(".btn2").click(function(){	
					var tranno=this.id;		
					var type=3;
					 $.ajax({
					 //url:"/hdcarTest/rest/pay/payRefund",  
					url:"https://70094161.qcloud.la/hdcar/rest/pay/payRefund",
				    data:{
				        tranno:tranno,
				        type:type
				    },
				    async:false,
				    type:"post",
				    dataType:"json",
				    beforeSend: function(request) {
				        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				        },
				    success:function(res){
						alert(res.msg);
				    }
				}); 
				});
				$(".btn2").click();
	}
})
</script>

