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
  <link href="<%=path %>/resources/plugins/css/pageGroup.css" rel="stylesheet" type="text/css">
 <link href="<%=path %>/resources/plugins/css/jquery-ui.min.css" rel="stylesheet" type="text/css">
   <!-- 引入样式 -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
  </head>
  <style>
  .lab{width:60px;display:inline-block;}
  .form-control{margin-top:12px;width:25%;margin-right:10px;}
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
      <h1 style="float:left;">
  	添加车辆
      </h1>
    
    </section>

    <!-- Main content -->
    <section class="content">

   <form action="car/carAdd" id="caraddSubmit" method="post" enctype="multipart/form-data">

		<select class="form-control" name="user" id="dealerS"> 
		</select>
		<span class="lab">品牌</span>
		<select class="form-control" name="brand" id="menu" onchange="menuChange();" style="display:inline-block"> 
			<option>请选择品牌</option>
		</select>
		<span class="lab">车系</span>
		<select class="form-control" name="model" id="modelmenu" onchange="modelmenuChange();" style="display:inline-block"> 
			<option>请选择车系</option>
		</select>
		<span class="lab">车型</span>
		<select class="form-control" name="modelnote" id="modelnotemenu" onchange="noteChange();" style="display:inline-block"> 
			<option>车型注释</option>
		</select>
	<br>
		<span class="lab">排量</span><input type="text" class="form-control" placeholder="排量" name="enginesize" id="pl" style="display:inline-block"/>
		<span class="lab">排放标准</span><input type="text" class="form-control" placeholder="排放标准" name="emission" id="pfbz" style="display:inline-block"/>
		<span class="lab">座位数</span><input type="text" class="form-control" placeholder="座位数" name="seatno" id="zws" style="display:inline-block"/>
		<br>
		<span class="lab">购入年份</span><input type="text" class="form-control" placeholder="购入年份" name="buydate" id="datepicker" style="display:inline-block"/>
		<span class="lab">上牌年份</span><input type="text" class="form-control" placeholder="上牌年份" name="regdate" id="datepicker1" style="display:inline-block"/>
		<span class="lab">年检有效期</span><input type="text" class="form-control" placeholder="年检有效期" name="motexp" id="datepicker2" style="display:inline-block"/>
		<br>
		<span class="lab">保险有效期</span><input type="text" class="form-control" placeholder="保险有效期" name="insureexp" id="datepicker3" style="display:inline-block"/>
		<span class="lab">车型</span>
		<select class="form-control" name="type" placeholder="车型" style="display:inline-block"> 
			<option>SUV</option>
			<option>MPV</option>
			<option>面包车</option>
			<option>跑车</option>
			<option>中型车</option>
		</select>
		<span class="lab">上牌地点</span>
		<input type="text" class="form-control" placeholder="上牌地点" name="regsite" style="display:inline-block">
		<br>
		<span class="lab">车辆所在城市</span>
		<div id="app" style="display:inline-block">
			<template>
			  <el-select v-model="value8" filterable placeholder="请输入或请选择" name="city">
			    <el-option
			      v-for="item in options"
			      :key="item.city_name"
			      :label="item.city_name"
			      :value="item.city_name">
			    </el-option>
			  </el-select>
			</template>
		</div>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<span class="lab">天窗</span>
		<select class="form-control" name="sunroof" style="display:inline-block"> 
			<option value="无">无天窗</option>
			<option value="有">有天窗</option>
			<option value="全景天窗">全景天窗</option>
		</select>
		<span class="lab">表显示公里</span>	
		<input type="number" class="form-control" placeholder="表显示公里" name="mileage" style="display:inline-block" required="required"/>
		<br>
		<span class="lab">颜色</span>
		<input type="text" class="form-control" placeholder="颜色" name="color" style="display:inline-block">
		<span class="lab" style="width:40px;">售价</span>
		<input type="number" class="form-control" placeholder="售价" name="price" style="display:inline-block" required="required">
		元&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="lab">VIN车架号</span>
		<input type="text" class="form-control" placeholder="VIN车架号" name="vin" style="display:inline-block">
		<br>
	<span class="lab">事故次数</span>
		<input type="number" class="form-control" placeholder="事故次数" name="accidentno" style="display:inline-block" value="0">
		<span class="lab">违章罚款额</span>
		<input type="text" class="form-control" placeholder="违章罚款额" name="fine" style="display:inline-block" value="0">
		<span class="lab">过户次数</span>
		<input type="number" class="form-control" placeholder="过户次数" name="tradeno" style="display:inline-block" value="0">
		<br>
		<span class="lab">手机号</span>
		<input type="tel" class="form-control" placeholder="手机号" name="sellertel" style="display:inline-block" required="required">
	
		<textarea class="form-control" rows="3" name="location" placeholder="请填写详细地址(验车地点)" required="required"></textarea>
		<textarea class="form-control" rows="3" name="repairdes" placeholder="维修描述"></textarea>
		<textarea class="form-control" rows="3" name="refitdes" placeholder="改装描述"></textarea>
		<div class="form-group">
                  <label for="exampleInputFile">照片上传</label>
                  <input type="file" id="exampleInputFile" name="photos" required="required" multiple/>
        </div>
		<input type="hidden" class="form-control" value="2" name="status"/>
		<input class="btn btn-primary" type="submit" value="添加1" id="sub" style="display:none;">
		<button class="btn btn-primary" onclick="caraddSubmit()">添加</button>
		
	</form>


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
 <!-- 先引入 Vue -->
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <!-- 引入组件库 -->
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</body>
</html>
<script type="text/javascript">
	var name=localStorage.getItem("username");
	var status=localStorage.getItem("status");
	var userCount=localStorage.getItem("userCount");
	var userlogCount=localStorage.getItem("userlogCount");
	$(".username").html(name);
	if(status=="1"){
		$("#dealer").css("display","none");
		$("#deposit").css("display","none");
		$("#loadprod").css("display","none");
		$("#ch").css("display","none");
	}else{
		$("#userCount").html(userCount);
		$("#userlogCount").html(userlogCount);
	}
$.ajax({
                url:'dealer/getDealer/'+status,
                async: false,
                type:'get',
                dataType: 'json',
               
                
                success:function (res) {
              
                var output="<option>请选择车商</option>";
                if(res.msg==0){
                    for(var i=0;i<getJsonLength(res.dealerList);i++)
                    {
                        output+='<option value="'+res.dealerList[i].user+'">'+res.dealerList[i].dname+' '+res.dealerList[i].user+'</option>';

                    }
                }else{
               
                		output='<option>'+name+'</option>'
                }
                   /* $('#menu').append(output);*/
                  /*   console.log(res.brand_list[1].brand_name);
                    console.log(res.brand_list.length); */
                    $('#dealerS').append(output);
                }
            })
 $(function () {
    	 $("#datepicker").datepicker({
             dateFormat:'yy-mm-dd',  //更改时间显示模式
             showAnim:"slide",       //显示日历的效果slide、fadeIn、show等
             changeMonth:true,       //是否显示月份的下拉菜单，默认为false
             changeYear:true,        //是否显示年份的下拉菜单，默认为false
             showWeek:false,          //是否显示星期,默认为false
             showButtonPanel:true,   //是否显示取消按钮，并含有today按钮，默认为false
             closeText:'close',      //设置关闭按钮的值
             yearRange:'2000:2017',  //显示可供选择的年份
             defaultDate:+0          //表示默认日期是在当前日期加上7天
         });
    	 $("#datepicker2").datepicker({
             dateFormat:'yy-mm-dd',  //更改时间显示模式
             showAnim:"slide",       //显示日历的效果slide、fadeIn、show等
             changeMonth:true,       //是否显示月份的下拉菜单，默认为false
             changeYear:true,        //是否显示年份的下拉菜单，默认为false
             showWeek:false,          //是否显示星期,默认为false
             showButtonPanel:true,   //是否显示取消按钮，并含有today按钮，默认为false
             closeText:'close',      //设置关闭按钮的值
             yearRange:'2010:2019',  //显示可供选择的年份
             defaultDate:+0          //表示默认日期是在当前日期加上7天
         });
    	 $("#datepicker3").datepicker({
             dateFormat:'yy-mm-dd',  //更改时间显示模式
             showAnim:"slide",       //显示日历的效果slide、fadeIn、show等
             changeMonth:true,       //是否显示月份的下拉菜单，默认为false
             changeYear:true,        //是否显示年份的下拉菜单，默认为false
             showWeek:false,          //是否显示星期,默认为false
             showButtonPanel:true,   //是否显示取消按钮，并含有today按钮，默认为false
             closeText:'close',      //设置关闭按钮的值
             yearRange:'2010:2019',  //显示可供选择的年份
             defaultDate:+0          //表示默认日期是在当前日期加上7天
         });
    	 $("#datepicker1").datepicker({
             dateFormat:'yy-mm-dd',  //更改时间显示模式
             showAnim:"slide",       //显示日历的效果slide、fadeIn、show等
             changeMonth:true,       //是否显示月份的下拉菜单，默认为false
             changeYear:true,        //是否显示年份的下拉菜单，默认为false
             showWeek:false,          //是否显示星期,默认为false
             showButtonPanel:true,   //是否显示取消按钮，并含有today按钮，默认为false
             closeText:'close',      //设置关闭按钮的值
             yearRange:'2000:2017',  //显示可供选择的年份
             defaultDate:+0          //表示默认日期是在当前日期加上7天
         });
        $.ajax({
            url:"https://api.che300.com/service/getCarBrandList?token=1afdc96cffbef7ddb182a0c451c636ff",
            async: false,
            type:"get",
            dataType: 'jsonp',
            
            success:function (res) {
                /* $("#dd").html(res.bean[1].missionDes); */
            	 var output="";
                 for(var i=0;i<res.brand_list.length;i++)
                 {
                     output+='<option id="'+res.brand_list[i].brand_id+'">'+res.brand_list[i].brand_name+'</option>';

                 }
                $('#menu').append(output);
               /*   console.log(res.brand_list[1].brand_name);
                 console.log(res.brand_list.length); */
             
            }
        })
 $.ajax({
            url:"https://api.che300.com/service/getAllCity?token=1afdc96cffbef7ddb182a0c451c636ff",
            async: false,
            type:"get",
            dataType: 'jsonp',
            
            success:function (res) {
                /* $("#dd").html(res.bean[1].missionDes); */
            	 var output="";
                 for(var i=0;i<res.city_list.length;i++)
                 {
                     output+='<option id="'+res.city_list[i].city_id+'">'+res.city_list[i].city_name+'</option>';

                 }
                /* $('#menu').append(output);*/
               /*   console.log(res.brand_list[1].brand_name);
                 console.log(res.brand_list.length); */
                 $('#citymenu').append(output);
            }
        })
    })
     function menuChange(){
        	var options=$("#menu option:selected");
        	var brandid=options.attr("id");
        	brandid="https://api.che300.com/service/getCarSeriesList?token=1afdc96cffbef7ddb182a0c451c636ff&brandId="+brandid;
        	$("#modelmenu").empty();
        	$.ajax({
                url:brandid,
                async: false,
                type:"get",
                dataType: 'jsonp',
                
                success:function (res) {
                	var output="<option>请选择车系</option>";
                    for(var i=0;i<res.series_list.length;i++)
                    {
                        output+='<option id="'+res.series_list[i].series_id+'">'+res.series_list[i].series_name+'</option>';

                    }
                   /* $('#menu').append(output);*/
                  /*   console.log(res.brand_list[1].brand_name);
                    console.log(res.brand_list.length); */
                    $('#modelmenu').append(output);
                }
            })
           }
    function modelmenuChange(){
    	var options=$("#modelmenu option:selected");
    	var seriesid=options.attr("id");
    	seriesid="https://api.che300.com/service/getCarModelList?token=1afdc96cffbef7ddb182a0c451c636ff&seriesId="+seriesid;
    	$("#modelnotemenu").empty();
    	$.ajax({
            url:seriesid,
            async: false,
            type:"get",
            dataType: 'jsonp',
            
            success:function (res) {
            	var output="<option>车型注释</option>";
                for(var i=0;i<res.model_list.length;i++)
                {
                    output+='<option id="'+res.model_list[i].model_id+'">'+res.model_list[i].model_name+'</option>';

                }
                $('#modelnotemenu').append(output);
        
            }
        })
       }
    function noteChange(){
    	var options=$("#modelmenu option:selected");
    	var seriesid=options.attr("id");
    	var modelnoteoptions=$("#modelnotemenu option:selected");
    	var modelnoteid=modelnoteoptions.attr("id");
    	myurl="https://api.che300.com/service/getCarModelList?token=1afdc96cffbef7ddb182a0c451c636ff&seriesId="+seriesid;
    	$.ajax({
            url:myurl,
            async: false,
            type:"get",
            dataType: 'jsonp',
            
            success:function (res) {
       
            	for(var i=0;i<res.model_list.length;i++)
            		{
            			if(res.model_list[i].model_id==modelnoteid)
            			{
            				$("#pfbz").val(res.model_list[i].discharge_standard);
            				$("#pl").val(res.model_list[i].liter);
            				$("#zws").val(res.model_list[0].seat_number);
            			}
            		}
        
            }
        })
    };
    function getJsonLength(json){
                var jsonLength=0;
                for (var i in json) {
                    jsonLength++;
                }
                return jsonLength;
            }
      function caraddSubmit(){
      	if(vm.value8==''){
      		vm.$message({
      	          showClose: true,
      	          message: '请选择车辆所在城市'
      	        });
      	}else{
      		$("#sub").click();
      	}
      }
            
   var vm = new Vue({
   		el:'#app',
   		data:{ 
   		value8: '',
		options: []
	},
	mounted:function(){
		var _self=this;
		 var url="https://api.che300.com/service/getAllCity?token=1afdc96cffbef7ddb182a0c451c636ff";
		 $.ajax({
            url:url,
            async: false,
            type:"get",
            dataType: 'jsonp',
            
            success:function (res) {
        		_self.options=res.city_list;
            }
        })
	}
	
   })
</script>

