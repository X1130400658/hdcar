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
  .thumbnail{margin-bottom:2px !important;}
  .modal-body img{
 width:auto;
 height:auto;
 max-width:100%;
 max-height:100%;
}
.faa{margin-top:20px !important;}  
.modal-content{border-radius:6px !important;}
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
  	验车列表
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">

      
 <table class="table table-striped" id="list">
		<tr>
			<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆信息</th>
			<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆照片</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">购入年份</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">上牌年份</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">里程数</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">排量</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">售价</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">联系电话</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">状态标记</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">操作</th>
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
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <form action="car/carCheckUnpass" method="post">
      		<input type="text" name="listseq" class="form-control" id="listseq" style="display:none;">
      		<textarea class="form-control" rows="3" name="note" placeholder="请填写未通过验车原因"></textarea>
      		<input class="btn btn-primary" type="submit" value="提交" style="float:right;">
      </form>
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
var t=0;
var carid=0;
var count=0;
var num=0;
var name="";
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
	}else{
		$("#userCount").html(userCount);
		$("#userlogCount").html(userlogCount);
	}
	   $.ajax({
				  type: 'get',
				  url: 'car/carCheck/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				
				  var pageCount=data.carList.pageCount;
				   carlist=data.carList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(carlist);
				  },
			})
}
function ddclick(id){
document.getElementById("listseq").setAttribute("value",id);
}
function xuanran(datalist){
var statusr="";
var checkCar="";
		
       var tmp='<tr><th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆信息</th>'+
       '<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆照片</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">购入年份</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">上牌年份</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">里程数</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">排量</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">售价</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">联系电话</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">状态标记</th>'+
       '<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">操作</th></tr>';
  
       for(var i=0;i<getJsonLength(datalist);i++)
       {
			checkCar='<a href="car/carCheckPass?listseq='+datalist[i].listseq+'" onclick="return ff()" class="thumbnail">通过验车</a><a id="'+datalist[i].listseq+'" href="" class="thumbnail dd" onclick="ddclick('+datalist[i].listseq+')" data-toggle="modal" data-target=".bs-example-modal-sm">未通过验车</a>';       	
       		if(datalist[i].status==1){
			statusr="可用";
		} else if(datalist[i].status==2){
			statusr="信用车";
		}else if(datalist[i].status==0){
			statusr="未缴纳保证金";
		}else if(datalist[i].status==3){
			statusr="要求撤销该车";
		}else if(datalist[i].status==5){
			statusr="已经被买车者锁定，等待验车";
		}else if(datalist[i].status==7){
			statusr="该车已验收通过"
		}else if(datalist[i].status==9){
			statusr="办理贷款";
		}else if(datalist[i].status==10){
			statusr="交易成功等待审核"
		}else if(datalist[i].status==11){
			statusr="交易佐证不足驳回";
		}else if(datalist[i].status==15){
			statusr="交易审核通过可以退款"
		}else if(datalist[i].status==20){
			statusr="验收未通过，保证金没收";
		}else if(datalist[i].status==88){
			statusr="交易正常关闭，退款成功"
		}else if(datalist[i].status==98){
			statusr="验收未通过退款买车者，退款成功";
		}else if(datalist[i].status==99){
			statusr="因下架，退款成功"
		}
		var buydate=new Date(datalist[i].buydate);
		var regdate=new Date(datalist[i].regdate);
		var date=buydate.toLocaleDateString();
		var reg=regdate.toLocaleDateString();
			tmp+='<tr><td>'+datalist[i].modelnote+'</td><td><a id="'+datalist[i].listseq+'" name="'+datalist[i].picsno+'" href=""'+
			'class="thumbnail dd" data-toggle="modal" data-target="#myModal"><img src="http://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+datalist[i].listseq+'.png" alt="..."></a></td><td>'+date+'</td><td>'+reg+'</td>'+
			'<td>'+datalist[i].mileage+'</td><td>'+datalist[i].enginesize+'</td><td>'+datalist[i].price+'</td><td>'+datalist[i].sellertel+'</td><td>'+statusr+'</td><td>'+checkCar+'</td></tr>'		   
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
				  url: 'car/carCheck/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.carList.pageCount;
				   carlist=data.carList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(carlist);
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
				  url: 'car/carCheck/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.carList.pageCount;
				   carlist=data.carList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(carlist);
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
				  url: 'car/carCheck/'+pageNum+'/'+pageSize,
				  async: false,
				  data:  '',
				  success: function(data){
				  var pageCount=data.carList.pageCount;
				   carlist=data.carList.objs;
				   genPageList(pageCount,pageSize)
				    xuanran(carlist);
				  },
				  error: function(xhr, type){
				  }
			})
 }

    $("#next").click(function(){
    			if(t<count-1)
    			{
    			
    				t++;
    		 	$(".modal-body").html("");
    		 	name=carid+'_'+t;
    		 	 image='<img src="http://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+name+'.png"/>';
   				$(".modal-body").append(image);
   				}
    	 });

    	$("#last").click(function(){
    		 
    		 	if(t==1){
    		 	t-=1;
    		 	$('.modal-body').html("");
    		 		image='<img src="http://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+carid+'.png"/>';
    		 		$(".modal-body").append(image);
    		 	}
    		 	else if(t>1){
    		 		$('.modal-body').html("");
    		 		t-=1;
    		 		var name=carid+'_'+t;
    		 	 	image='<img src="http://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+name+'.png"/>';
   					$(".modal-body").append(image);
   					}
    	});
    	
    	function rec(){
    alert("卖方或买方已交纳保证金，无法删除");
    }
      function ss(){
        var mymessage=confirm("确认删除？");
        if(mymessage==true)
        {
        	document.onclick = delete_confirm;
        }
        else
        {
        	return false; 
        }
 
    }
  function ff(){
        var mymessage=confirm("确定通过验车？");
        if(mymessage==true)
        {
        	document.onclick = unpass_confirm;
        }
        else
        {
        	return false; 
        }
 
    }
</script>
