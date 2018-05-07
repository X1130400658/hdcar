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

 <table class="table table-striped" id="list">
		<tr>
			<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆信息</th>
			<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆照片</th>
			<th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">购入年份</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">里程数</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">排量</th>
			<th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">售价</th>
		</tr>
		
</table>
<!-- REQUIRED JS SCRIPTS -->
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <form action="user/depositPhoto" method="post" enctype="multipart/form-data">
      		<input type="text" name="listseq" class="form-control" id="listseq"/>
      		<div class="form-group">
                  <label for="exampleInputFile">交易凭证上传</label>
                  <input type="file" id="exampleInputFile" name="photos" required="required" multiple/>
            </div>
      		<input class="btn btn-primary" type="submit" value="提交" style="float:right;"/>
      </form>
    </div>
  </div>
</div>
  </body>
  <script src="<%=path %>/resources/plugins/js/jquery-2.2.3.min.js"></script>
    <!-- import Vue before Element -->
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <!-- import JavaScript -->
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
</html>
<<script type="text/javascript">
var username = localStorage.getItem("username"); 
var money = localStorage.getItem("money");
$("#username").html('<a href="#">欢迎：'+username+'！余额：'+money+'元</a>');
window.onload=function(){

	   $.ajax({
				  type: 'get',
				  url: 'deposit/getDepositByUser/'+username,
				  async: false,
				  data:  '',
				  success: function(data){
					  carlist=data.depositList;
					    xuanran(carlist);
				  },
			})
			$(".dt").click(function(){
				var id=this.id;
				document.getElementById("listseq").setAttribute("value",id);
			});
	}
function getJsonLength(json){
    var jsonLength=0;
    for (var i in json) {
        jsonLength++;
    }
    return jsonLength;
}
function xuanran(datalist){
	var statusr="";
	var deleteCar="";
			
	       var tmp='<tr><th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆信息</th><th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">车辆照片</th><th class="col-lg-2 col-md-2 col-sm-2 col-xs-2">购入年份</th><th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">里程数</th><th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">排量</th><th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">售价</th><th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">状态标记</th><th class="col-lg-1 col-md-1 col-sm-1 col-xs-1">操作</th></tr>';
	       for(var i=0;i<getJsonLength(datalist);i++)
	       {
	    	
	        		 if(datalist[i].car.status==7||datalist[i].car.status==11)
	         			{
	         			deleteCar='<a id="'+datalist[i].car.listseq+'" href="" class="thumbnail dt" data-toggle="modal" data-target=".bs-example-modal-sm">上传交易凭证</a>';
	         		}else{
	         			deleteCar='';
	         		}
	 
	       		if(datalist[i].car.status==1){
				statusr="可用";
			} else if(datalist[i].car.status==2){
				statusr="信用车";
			}else if(datalist[i].car.status==0){
				statusr="未缴纳保证金";
			}else if(datalist[i].car.status==3){
				statusr="要求撤销该车";
			}else if(datalist[i].car.status==5){
				statusr="已经被买车者锁定，等待验车";
			}else if(datalist[i].car.status==7){
				statusr="该车已验收通过"
			}else if(datalist[i].car.status==9){
				statusr="办理贷款";
			}else if(datalist[i].car.status==10){
				statusr="交易成功等待审核"
			}else if(datalist[i].car.status==11){
				statusr="交易佐证不足驳回";
			}else if(datalist[i].car.status==15){
				statusr="交易审核通过可以退款"
			}else if(datalist[i].car.status==20){
				statusr="验收未通过，保证金没收";
			}else if(datalist[i].car.status==88){
				statusr="交易正常关闭，退款成功"
			}else if(datalist[i].car.status==98){
				statusr="验收未通过退款买车者，退款成功";
			}else if(datalist[i].car.status==99){
				statusr="因下架，退款成功"
			}
			var buydate=new Date(datalist[i].car.buydate);
			var date=buydate.toLocaleDateString();
				tmp+='<tr><td>'+datalist[i].car.modelnote+'</td><td><img src="https://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+datalist[i].car.listseq+'.png" alt="..."></td><td>'+date+'</td>'+
				'<td>'+datalist[i].car.mileage+'</td><td>'+datalist[i].car.enginesize+'</td><td>'+datalist[i].car.price+'</td><td>'+statusr+'</td><td>'+deleteCar+'</td></tr>'		   
	       }
	       document.getElementById("list").innerHTML=tmp;
	   }
</script>
