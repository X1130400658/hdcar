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
    <link rel="icon" href="resources/plugins/img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="resources/plugins/img/favicon.ico" type="image/x-icon">
	 <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="resources/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/plugins/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect.
  -->
  <link rel="stylesheet" href="resources/plugins/css/skin-blue.min.css">

  </head>
  <style>
  .modal-content{border-radius:6px !important;}
.modal-dialog{width:350px;}
.faa{margin-top:20px !important;}  
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
                  <a href="javascript:;" class="btn btn-default btn-flat" data-toggle="modal" data-target="#myModal"  onclick="getDetail()">重置</a>
                </div>
                <div class="pull-right">
                  <a href="dealerlogin.jsp" class="btn btn-default btn-flat">退出</a>
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
            <li id="ch"><a href="jsp/carcheck.jsp"><i class="fa fa-circle-o"></i>检验车辆</a></li>
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
      <h1>
       最新消息
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
<div id="contentdiv">
<div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-automobile faa"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">车辆总量</span>
              <span class="info-box-number" id="carCount"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-automobile faa"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">今日新增车辆</span>
              <span class="info-box-number" id="carNewCount"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-files-o faa"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">成交笔数</span>
              <span class="info-box-number" id="order"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
         <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-files-o faa"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">拟成交笔数</span>
              <span class="info-box-number" id="orderPrepare"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="glyphicon glyphicon-user faa"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">车商数量</span>
              <span class="info-box-number" id="dealerCount"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
          <!-- /.col -->
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-cny faa"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">收款金额</span>
              <span class="info-box-number" id="sumMoney"></span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <!-- /.info-box -->
        </div>
        <!-- /.col -->
      </div>
    </div>
    <div class="row">
    	<div class="col-md-6">
    		<div class="box box-success">
	            <div class="box-header with-border">
	              <h3 class="box-title">信息统计表</h3>
	
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
	              <div class="chart">
	                <canvas id="barChart" style="height: 240px; width: 533px;" height="240" width="533"></canvas>
	              </div>
	            </div>
            <!-- /.box-body -->
      		</div>
      	</div>
      <div class="col-md-6">
	      <div class="box box-primary">
	            <div class="box-header with-border">
	              <h3 class="box-title">用户访问量(合计:<span id="userlogTotal"></span>)</h3>
	
	              <div class="box-tools pull-right">
	                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
	                </button>
	                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
	              </div>
	            </div>
	            <div class="box-body">
	              <div class="chart">
	                <canvas id="areaChart" style="height: 240px; width: 533px;" height="240" width="533"></canvas>
	              </div>
	            </div>
	            <!-- /.box-body -->
	        </div>
        </div>
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
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">车商信息更改</h4>
      </div>
      <div class="modal-body">
      <form id="formId" method="post" action="admin/updatePassword">
  			<div class="form-group">
    			<label for="exampleInputEmail1">登录名</label>
    			<input type="text" name="username" class="form-control" id="user" readonly="readonly">
 			</div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">新密码</label>
			    <input type="password" class="form-control" id="pass" name="password">
			  </div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">重复密码</label>
			    <input type="password" class="form-control" id="passT">
			  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="submit()">修改</button>
      </div>
    </div>
  </div>
</div>
<!-- REQUIRED JS SCRIPTS -->

<script src="resources/plugins/js/jquery-2.2.3.min.js"></script>
  <script src="resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="resources/plugins/js/app.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="resources/plugins/js/Chart.min.js"></script>
</body>
</html>
<script type="text/javascript">
window.onload=function(){
	var name=localStorage.getItem("username");
	var status=localStorage.getItem("status");
	var carCount=localStorage.getItem("carCount");
	var carNewCount=localStorage.getItem("carNewCount");
	var order=localStorage.getItem("order");
	var orderPrepare=localStorage.getItem("orderPrepare");
	var sumMoney=localStorage.getItem("sumMoney");
	var dealerCount=localStorage.getItem("dealerCount");
	var userCount=localStorage.getItem("userCount");
	var userlogCount=localStorage.getItem("userlogCount");
	var Jan=localStorage.getItem("Jan");
	var Feb=localStorage.getItem("Feb");
	var Mar=localStorage.getItem("Mar");
	var Apr=localStorage.getItem("Apr");
	var May=localStorage.getItem("May");
	var Jun=localStorage.getItem("Jun");
	var Jul=localStorage.getItem("Jul");
	var Aug=localStorage.getItem("Aug");
	var Sep=localStorage.getItem("Sep");
	var Oct=localStorage.getItem("Oct");
	var Nov=localStorage.getItem("Nov");
	var Dec=localStorage.getItem("Dec");
	var Total=localStorage.getItem("Total");
	var loanJan=localStorage.getItem("loanJan");
	var loanFeb=localStorage.getItem("loanFeb");
	var loanMar=localStorage.getItem("loanMar");
	var loanApr=localStorage.getItem("loanApr");
	var loanMay=localStorage.getItem("loanMay");
	var loanJun=localStorage.getItem("loanJun");
	var loanJul=localStorage.getItem("loanJul");
	var loanAug=localStorage.getItem("loanAug");
	var loanSep=localStorage.getItem("loanSep");
	var loanOct=localStorage.getItem("loanOct");
	var loanNov=localStorage.getItem("loanNov");
	var loanDec=localStorage.getItem("loanDec");
	var loanTotal=localStorage.getItem("loanTotal");
	var userlogJan=localStorage.getItem("userlogJan");
	var userlogFeb=localStorage.getItem("userlogFeb");
	var userlogMar=localStorage.getItem("userlogMar");
	var userlogApr=localStorage.getItem("userlogApr");
	var userlogMay=localStorage.getItem("userlogMay");
	var userlogJun=localStorage.getItem("userlogJun");
	var userlogJul=localStorage.getItem("userlogJul");
	var userlogAug=localStorage.getItem("userlogAug");
	var userlogSep=localStorage.getItem("userlogSep");
	var userlogOct=localStorage.getItem("userlogOct");
	var userlogNov=localStorage.getItem("userlogNov");
	var userlogDec=localStorage.getItem("userlogDec");
	var userlogTotal=localStorage.getItem("userlogTotal");
	$("#userlogTotal").html(userlogTotal);
	$(".username").html(name);
	if(status=="1"){
		$(".content-header h1").css("display","none");
		$("#dealer").css("display","none");
		$("#deposit").css("display","none");
		$("#loadprod").css("display","none");
		$("#ch").css("display","none");
		$("#contentdiv").css("display","none");
		$("#content").css("display","none");
	}else{
		$("#carCount").html(carCount);	
		$("#carNewCount").html(carNewCount);
		$("#order").html(order);
		$("#orderPrepare").html(orderPrepare);
		$("#dealerCount").html(dealerCount);
		$("#sumMoney").html(sumMoney);
		$("#userCount").html(userCount);
		$("#userlogCount").html(userlogCount);
	}
    
 //--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $("#areaChart").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.
    var areaChart = new Chart(areaChartCanvas);

 var areaChartData = {
      labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
      datasets: [
         {
          label: "用户访问量",
          fillColor: "rgba(60,141,188,0.9)",
          strokeColor: "rgba(60,141,188,0.8)",
          pointColor: "#3b8bba",
          pointStrokeColor: "rgba(60,141,188,1)",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(60,141,188,1)",
          data: [userlogJan, userlogFeb, userlogMar, userlogApr, userlogMay, userlogJun, userlogJul, userlogAug, userlogSep, userlogOct, userlogNov, userlogDec]
        }
      ]
    };

    var areaChartOptions = {
      //Boolean - If we should show the scale at all
      showScale: true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines: false,
      //String - Colour of the grid lines
      scaleGridLineColor: "rgba(0,0,0,.05)",
      //Number - Width of the grid lines
      scaleGridLineWidth: 1,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines: true,
      //Boolean - Whether the line is curved between points
      bezierCurve: true,
      //Number - Tension of the bezier curve between points
      bezierCurveTension: 0.3,
      //Boolean - Whether to show a dot for each point
      pointDot: false,
      //Number - Radius of each point dot in pixels
      pointDotRadius: 4,
      //Number - Pixel width of point dot stroke
      pointDotStrokeWidth: 1,
      //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
      pointHitDetectionRadius: 20,
      //Boolean - Whether to show a stroke for datasets
      datasetStroke: true,
      //Number - Pixel width of dataset stroke
      datasetStrokeWidth: 2,
      //Boolean - Whether to fill the dataset with a color
      datasetFill: true,
     
      //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
      maintainAspectRatio: true,
      //Boolean - whether to make the chart responsive to window resizing
      responsive: true
    };

    //Create the line chart
    areaChart.Line(areaChartData, areaChartOptions);

    var barChartData = {
      labels: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月","合计"],
      datasets: [
        {
          label: "贷款申请量",
          fillColor: "rgba(255, 0, 0, 1)",
          strokeColor: "rgba(255, 0, 0, 1)",
          pointColor: "rgba(210, 214, 222, 1)",
          pointStrokeColor: "#c1c7d1",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(220,220,220,1)",
          data: [loanJan, loanFeb, loanMar, loanApr, loanMay, loanJun, loanJul, loanAug, loanSep, loanOct, loanNov, loanDec, loanTotal]
        },
        {
          label: "车辆新增",
          fillColor: "rgba(60,141,188,0.9)",
          strokeColor: "rgba(60,141,188,0.8)",
          pointColor: "#3b8bba",
          pointStrokeColor: "rgba(60,141,188,1)",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(60,141,188,1)",
          data: [Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Total]
        },
         {
          label: "用户访问量",
          fillColor: "rgba(60,141,188,0.9)",
          strokeColor: "rgba(60,141,188,0.8)",
          pointColor: "#3b8bba",
          pointStrokeColor: "rgba(60,141,188,1)",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "rgba(60,141,188,1)",
          data: [userlogJan, userlogFeb, userlogMar, userlogApr, userlogMay, userlogJun, userlogJul, userlogAug, userlogSep, userlogOct, userlogNov, userlogDec, userlogTotal]
        }
      ]
    };
  
    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $("#barChart").get(0).getContext("2d");
    var barChart = new Chart(barChartCanvas);
    barChartData.datasets[1].fillColor = "#00a65a";
    barChartData.datasets[1].strokeColor = "#00a65a";
    barChartData.datasets[1].pointColor = "#00a65a";
    var barChartOptions = {
      //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
      scaleBeginAtZero: true,
      //Boolean - Whether grid lines are shown across the chart
      scaleShowGridLines: true,
      //String - Colour of the grid lines
      scaleGridLineColor: "rgba(0,0,0,.05)",
      //Number - Width of the grid lines
      scaleGridLineWidth: 10,
      //Boolean - Whether to show horizontal lines (except X axis)
      scaleShowHorizontalLines: true,
      //Boolean - Whether to show vertical lines (except Y axis)
      scaleShowVerticalLines: true,
      //Boolean - If there is a stroke on each bar
      barShowStroke: true,
      //Number - Pixel width of the bar stroke
      barStrokeWidth: 2,
      //Number - Spacing between each of the X value sets
      barValueSpacing: 5,
      //Number - Spacing between data sets within X values
      barDatasetSpacing: 1,
      //String - A legend template
      
      //Boolean - whether to make the chart responsive
      responsive: true,
      maintainAspectRatio: true
    };

    barChartOptions.datasetFill = false;
    barChart.Bar(barChartData, barChartOptions);
}

function getDetail(){
	var user=localStorage.getItem("username");
    $.ajax({
		  type: 'get',
		  url: 'admin/getAdminByUser/'+user,
		  data:  '',
		  success: function(data){
		     $("#user").val(data.admin.username);
		     $("#pass").val(data.admin.password);
		  },
	});
   }	
function submit(){
if($("#pass").val()===$("#passT").val())
	{
		document.getElementById('formId').submit();
	}else{
		alert("两次输入的密码不同");
	}
}
</script>
