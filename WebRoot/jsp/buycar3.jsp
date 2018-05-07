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
	<link href="<%=path %>/resources/plugins/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href='https://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>   
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
.dd img{height: 200px !important;}
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
                	<li>
                	<div id="app">
						<div style="margin-left: 100px;margin-top: 5px;margin-bottom: 5px;width: 600px;">
							<el-input class="selectInput" placeholder="请输入内容" v-model="input5" required="true"> 
								<el-select v-model="select" slot="prepend" placeholder="请选择"> 
									<el-option label="品牌" value="1"></el-option> 
									<el-option label="车型" value="2"></el-option> 
									<el-option label="颜色" value="3"></el-option>
								</el-select> 
							<el-button slot="append" icon="el-icon-search" v-on:click="itemSearch()"></el-button> 
							</el-input>	
						</div>
					</div>			
				</li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="username"><a href="#">xzp</a></li>
                </ul>
            </div>
        </div>
    </nav>
 </header>

    <div class="content-wrapper">		  
						<div class="content-top">
							 <div class="text" id="list"> 			
									
								</div>
						</div>
						
				</div>
	<div class="box-footer clearfix">	 			
              <ul class="pagination pagination-sm no-margin pull-right" id="getpage">
              </ul>
              <div style="float:right;">
              	第<input type="number" id="returnPage" style="width:50px;"/>页<button onclick="pageReturn()" style="margin:0px 4px 0px 4px;">跳转</button><span id="nowPage"></span>/<span id="sumPage"></span>
              </div>
      </div>
  <!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">车辆照片</h4>
      </div>
      <div class="modal-body">
      
      </div>
      <div class="modal-footer">
       <button type="button" class="btn btn-primary" id="last">上一张</button>
        <button type="button" class="btn btn-primary" id="next">下一张</button>
      </div>
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
var vm = new Vue({
	el:'#app',
	data : {
	    input5: "",
	    select: ''
	},
	methods: {
		itemSearch : function() {
			this.total = 0;
			var _self = this;
			var val = this.input5;
			if(val==""||_self.select=="")
				{
				_self.$alert('请填写搜索详情', '提示', {
			          confirmButtonText: '确定'
			        });
				}else{
						var url = "user/getCarBySearch/";
						$.get(url, { name: _self.select, str: val }, function(data) {
							var carlist1=data.carList;
							xuanran(carlist1);
						})
					}
		}, 
		open1: function(){
			this.$alert('金额不足', '提示', {
		          confirmButtonText: '确定'
		        });
		},
		open: function(id,username,balance){
			var _self = this;
			this.$confirm(
					'是否预定该车辆?',
					'提示',
					{
						confirmButtonText : '确定',
						cancelButtonText : '取消',
						type : 'warning',
						callback : function(action,
								instance, done) {
							if (action == "confirm") {
								var url = "user/buyCar/"+id+"/"+username+"/"+balance;
								$.get(url, function(data) {
									localStorage.setItem("money",money-300);
									console.log(data);	

								})
								_self.$message({
									type : 'success',
									message : '购买成功!'
								});

							} else {
								_self.$message({
									type : 'info',
									message : '取消成功'
								});
							}
						}
					})
		}
	}
})
var pageSize=20;
var pageNum=0;
window.onload=function(){

		   $.ajax({
					  type: 'get',
					  url: 'car/getCarList2/'+pageNum+'/'+pageSize,
					  async: false,
					  data:  '',
					  success: function(data){
					
					  var pageCount=data.carList.pageCount;
					  var x=Math.ceil(pageCount/pageSize);
					  $("#nowPage").html(pageNum+1);
					  $("#sumPage").html(x);
					   carlist=data.carList.objs;
					   genPageList(pageCount,pageSize)
					    xuanran(carlist);
					  },
				})
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
			
	       var tmp='';
	  
	       for(var i=0;i<getJsonLength(datalist);i++)
	       {
	    	  tmp+='<div class="grid_1_of_3 images_1_of_3"><div class="grid_1">'+
	    		  '<a id="'+datalist[i].listseq+'" name="'+datalist[i].picsno+'" href="" class="thumbnail dd" data-toggle="modal" data-target="#myModal" onclick="imageShow('+datalist[i].listseq+','+datalist[i].picsno+')"><img class="imgcar" src="https://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+datalist[i].listseq+'.png" alt="..."></a>'+
				  '<div class="grid_desc"><p class="title">'+datalist[i].modelnote+'</p><p class="title1">'+datalist[i].mileage+'公里</p>'+
				  '<div class="price" style="height: 19px;"><span class="reducedfrom">'+datalist[i].price+'元</span></div><div class="cart-button">'+
				  '<div class="cart"><a onclick="buyCar('+datalist[i].listseq+','+datalist[i].price+')" href="javascript:void(0)"><img src="resources/plugins/img/cart.png" alt=""/></a></div><button class="button" onclick="detail('+datalist[i].listseq+')"><span>详情</span></button>'+
				  '<div class="clear"></div></div></div></div><div class="clear"></div></div>';   
	       }
	       tmp+='<div class="clear"></div>';
	       document.getElementById("list").innerHTML=tmp;
	   }	
function buyCar(id,price){
	if(money>=300){
		vm.open(id,username,money-300);
	}else{
		vm.open1();
	}
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
					  url: 'car/getCarList/'+pageNum+'/'+pageSize,
					  async: false,
					  data:  '',
					  success: function(data){
					  var pageCount=data.carList.pageCount;
					  var x=Math.ceil(pageCount/pageSize);
					  $("#nowPage").html(pageNum+1);
					  $("#sumPage").html(x);
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
					  url: 'car/getCarList/'+pageNum+'/'+pageSize,
					  async: false,
					  data:  '',
					  success: function(data){
					  var pageCount=data.carList.pageCount;
					  var x=Math.ceil(pageCount/pageSize);
					  $("#nowPage").html(pageNum+1);
					  $("#sumPage").html(x);
					   carlist=data.carList.objs;
					   genPageList(pageCount,pageSize)
					    xuanran(carlist);
					  },
					  error: function(xhr, type){
					  }
				})
		}	
	   }
	   function pageReturn(){
	   pageNum=$("#returnPage").val()-1;
	   		  $.ajax({
					  type: 'get',
					  url: 'car/getCarList/'+pageNum+'/'+pageSize,
					  async: false,
					  data:  '',
					  success: function(data){
					  var pageCount=data.carList.pageCount;
					  var x=Math.ceil(pageCount/pageSize);
					  $("#nowPage").html(pageNum+1);
					  $("#sumPage").html(x);
					   carlist=data.carList.objs;
					   genPageList(pageCount,pageSize)
					    xuanran(carlist);
					  },
					  error: function(xhr, type){
					  }
				})
	   }
	   
	 function getThisPage(num){
	 	pageNum=num-1;
	 	 $.ajax({
					  type: 'get',
					  url: 'car/getCarList/'+pageNum+'/'+pageSize,
					  async: false,
					  data:  '',
					  success: function(data){
					  var pageCount=data.carList.pageCount;
					  var x=Math.ceil(pageCount/pageSize);
					  $("#nowPage").html(pageNum+1);
					  $("#sumPage").html(x);
					   carlist=data.carList.objs;
					   genPageList(pageCount,pageSize)
					    xuanran(carlist);
					  },
					  error: function(xhr, type){
					  }
				})
	 }
	 function imageShow(thisId,picsno){
			t=0;   
		    $(".modal-body").html("");
		   	carid=Number(thisId);
		    count=Number(picsno);
		    var image='<img src="https://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+carid+'.png"/>';
		   $(".modal-body").append(image);
		}
	    $("#next").click(function(){
			if(t<count-1)
			{
			
				t++;
		 	$(".modal-body").html("");
		 	name=carid+'_'+t;
		 	 image='<img src="https://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+name+'.png"/>';
				$(".modal-body").append(image);
				}
	 });

	$("#last").click(function(){
		 
		 	if(t==1){
		 	t-=1;
		 	$('.modal-body').html("");
		 		image='<img src="https://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+carid+'.png"/>';
		 		$(".modal-body").append(image);
		 	}
		 	else if(t>1){
		 		$('.modal-body').html("");
		 		t-=1;
		 		var name=carid+'_'+t;
		 	 	image='<img src="https://hdcarfiles-1251224234.cossh.myqcloud.com/listingfiles/'+name+'.png"/>';
					$(".modal-body").append(image);
					}
	});
function detail(id){
	localStorage.setItem("carId",id);
	window.location.href="jsp/buyDetail.jsp"; 
}
</script>
