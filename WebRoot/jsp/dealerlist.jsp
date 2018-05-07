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

  <!-- 分页插件 -->
  <link href="<%=path %>/resources/plugins/css/pageGroup.css" rel="stylesheet" type="text/css" />

  </head>
  <style>
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
  	车商列表
      </h1>
      <button style="float:right;"class="btn btn-primary" data-toggle="modal" data-target="#myModal2"  onclick="">添加</button>
    </section>

    <!-- Main content -->
    <section class="content">

      
 <table class="table table-striped" id="list">
		<tr>
			<th>登录名</th>
			<th>车商名</th>
			<th>地区</th>
			<th>操作</th>
		</tr>
		
</table>

	 <div class="box-footer clearfix">
              <ul class="pagination pagination-sm no-margin pull-right" id="getpage">

              </ul>
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
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">添加车商</h4>
      </div>
      <div class="modal-body">
      <form id="formId2" method="post" action="dealer/add">
  			<div class="form-group">
    			<label for="exampleInputEmail1">登录名</label>
    			<input type="text" name="user" class="form-control">
 			</div>
 			<div class="form-group">
    			<label for="exampleInputEmail1">车商名</label>
    			<input type="text" class="form-control" name="dname">
 			</div>
 			<div class="form-group">
    			<label for="exampleInputEmail1">地区</label>
    			<input type="text" class="form-control" name="city">
 			</div>
 			<div class="form-group" style="display:none;">
    			<label for="exampleInputEmail1">地区</label>
    			<input type="text" class="form-control" name="status" value="0">
 			</div>
			  <div class="form-group">
			    <label for="exampleInputPassword1">密码</label>
			    <input type="password" class="form-control" name="pass">
			  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="document.getElementById('formId2').submit();">添加</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">车商信息更改</h4>
      </div>
      <div class="modal-body">
      <form id="formId" method="post" action="dealer/update">
  			<div class="form-group">
    			<label for="exampleInputEmail1">登录名</label>
    			<input type="text" name="user" class="form-control" id="user" readonly="readonly">
 			</div>
 			<div class="form-group">
    			<label for="exampleInputEmail1">车商名</label>
    			<input type="text" class="form-control" id="dname" name="dname">
 			</div>
 			<div class="form-group">
    			<label for="exampleInputEmail1">地区</label>
    			<input type="text" class="form-control" id="city" name="city">
 			</div>
 			<div class="form-group" style="display:none;">
    			<label for="exampleInputEmail1">地区</label>
    			<input type="text" class="form-control" id="city" name="status" value="0">
 			</div>
			  <div class="form-group" style="display:none;">
			    <label for="exampleInputPassword1">密码</label>
			    <input type="password" class="form-control" id="pass" name="pass">
			  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="document.getElementById('formId').submit();">修改</button>
      </div>
    </div>
  </div>
</div>
<!-- REQUIRED JS SCRIPTS -->

<script src="<%=path %>/resources/plugins/js/jquery-2.2.3.min.js"></script>
  <script src="<%=path %>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=path %>/resources/plugins/js/app.min.js"></script>
</body>
</html>
<script type="text/javascript">
var pageSize=10;
var pageNum=0;
window.onload=function(){
	var name=localStorage.getItem("username");
	var status=localStorage.getItem("status");
	var userCount=localStorage.getItem("userCount");
	var userlogCount=localStorage.getItem("userlogCount");
	$(".username").html(name);
	if(status=="1"){
		$("#dealer").css("display","none");
		$("#deposit").css("display","none");
		$("#loadprod").css("display","none");
		$("#content").css("display","none");
	}else{
		$("#userCount").html(userCount);
		$("#userlogCount").html(userlogCount);
	}
	   $.ajax({
				  type: 'get',
				  url: 'dealer/getDealerList/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.dealerList.pageCount;
				   dealerlist=data.dealerList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(dealerlist);
				  },
				  error: function(xhr, type){
				  }
			})
	if('${e.message}'){
		alert('${e.message}')
	}
}
function xuanran(datalist){  
       tmp="<tr><th>登录名</th><th>车商名</th><th>地区</th><th>操作</th></tr>";
       for(var i=0;i<getJsonLength(datalist);i++)
       {
			tmp+='<tr><td>'+datalist[i].user+'</td><td>'+datalist[i].dname+'</td><td>'+datalist[i].city+'</td><td>'+
			'<button class="btn btn-primary" data-toggle="modal" data-target="#myModal"  onclick="getDetail(\''+datalist[i].user+'\')">修改</button></tr>'
		   
       }
       document.getElementById("list").innerHTML=tmp;
   }
function getJsonLength(json){
                var jsonLength=0;
                for (var i in json) {
                    jsonLength++;
                }
                return jsonLength;
            }
function getDetail(user){

    $.ajax({
		  type: 'get',
		  url: 'dealer/getDealerByUser/'+user,
		  data:  '',
		  success: function(data){
		     $("#user").val(data.dealer.user);
		     $("#dname").val(data.dealer.dname);
		     $("#city").val(data.dealer.city);
		     $("#pass").val(data.dealer.pass);
		  },
		  error: function(xhr, type){
		  }
	});
   }
		
function genPageList(pageCount,pageSize){
var ul_html = '<li><a href="javascript:;" onclick="last()">&laquo;</a></li>';
	   maxPageNum=Math.ceil(pageCount/pageSize);
	   if(maxPageNum < 5)
		   {
		   		for(var i=1;i<=maxPageNum;i++)
		   		{
		   			ul_html+='<li><a href="javascript:;" onclick="getThisPage('+i+')">'+i+'</a></li>'
		   		}
		   }
	   else
			{
		   		for(var i=1;i<=5;i++)
		   		{
		   			ul_html+='<li><a href="javascript:;" onclick="getThisPage('+i+')">'+i+'</a></li>'
		   		}
		   }
		   ul_html+='<li><a href="javascript:;" onclick="next('+maxPageNum+')">&raquo;</a></li>'				   
	   document.getElementById("getpage").innerHTML=ul_html;
   }
   function next(maxPageNum){
   if(pageNum<maxPageNum-1){
  	 ++pageNum;
   		  $.ajax({
				  type: 'get',
				  url: 'dealer/getDealerList/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.dealerList.pageCount;
				   dealerlist=data.dealerList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(dealerlist);
				  },
				  error: function(xhr, type){
				  }
			})
	}	
   }
    function last(){
    if(pageNum>0){
  	 --pageNum;
   		  $.ajax({
				  type: 'get',
				  url: 'dealer/getDealerList/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.dealerList.pageCount;
				   dealerlist=data.dealerList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(dealerlist);
				  },
				  error: function(xhr, type){
				  }
			})
	}	
   }
   
 function getThisPage(num){
 	pageNum=num-1;
 	 $.ajax({
				  type: 'get',
				  url: 'dealer/getDealerList/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.dealerList.pageCount;
				   dealerlist=data.dealerList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(dealerlist);
				  },
				  error: function(xhr, type){
				  }
			})
 }
</script>

