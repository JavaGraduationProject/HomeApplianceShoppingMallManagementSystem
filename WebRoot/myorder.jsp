。<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" rev="stylesheet"
	href="${pageContext.request.contextPath }/css/detail.css"
	type="text/css" media="all" />
<link rel="stylesheet" id="font-awesome-four-css"
	href="${pageContext.request.contextPath }/css/fontawesome-all.css"
	type='text/css' media='all' />
<title>我的订单</title>
<!--导入布局js，共享header和footer-->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/index.css">
<script src="${pageContext.request.contextPath }/js/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<!--导入布局js，共享header和footer-->


<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<script src="https://cdn.bootcss.com/layer/2.3/layer.js"></script>

</head>
<body>

	<c:if test="${not empty msg }">

		<script>
			layer.alert('${msg}');
		</script>
	</c:if>
	<!--引入头部-->
	<header id="header">
	<div class="shortcut">
		<c:if test="${empty username }">
            <!-- 未登录状态  -->
            <div class="login_out">
                <a href="login.jsp">登录</a>
                <a href="register.jsp">注册</a>
            </div>
            </c:if>
            <!-- 登录状态  -->
             <c:if test="${not empty username }">
            <div class="login">
            	
                <span id="span_username">你好,${username }</span>
                <a href="${pageContext.request.contextPath}/ToMyOrderServlet" class="collection">我的订单</a>
                <a href="javascript:location.href='exitServlet';">退出</a>
            </div>
            </c:if>    
	</div>
	<div class="header_wrap">
		<div class="topbar">
			<div class="logo">
				<a href="/"><img src="images/logo.jpg" alt=""></a>
			</div>
			
			<div class="hottel">
				<div class="hot_pic">
					<img src="images/hot_tel.jpg" alt="">
				</div>
				<div class="hot_tel">
					
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- 头部 end -->
	<!-- 首页导航 -->
	<div class="navitem">
		<ul class="nav">
			<li class="nav-active">
			
			<a
				href="${pageContext.request.contextPath }/IndexServlet">首页</a></li>
			<li>
			
			<c:if test="${not empty username }">
			<a   
				href="${pageContext.request.contextPath}/ToMyOrderCart"
				>购物篮</a>
			</c:if>
			<c:if test="${ empty username }">
			<a
				href="${pageContext.request.contextPath}/login.jsp"
				>购物篮</a>
			</c:if>
			</li>  
			   
		</ul>
	</div>

	<article id="post-622"
		class="post-622 post type-post status-publish format-standard hentry category-everygo">

	<header class="entry-header">
   
	<h1  class="entry-title"><font color="green">我的订单</font></h1>

   <div align="center">
             
   <c:if test="${empty list }">
   <script>
   layer.msg('暂无你的订单');   
   </script>
   </c:if>
    <c:if test="${not empty list }">
<table class="table">
   
			<tr class="danger">  
				<th>订单号</th>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>订单商品数</th>
				<th>订单总价格</th>
				
			
				<th>下单收货地址</th>
				<th>订单时间</th>
			</tr>


			<c:forEach varStatus="vs" var="v" items="${list}">
				<tr class="primary">

					<td>${v.ordernum }</td>        
					<td>
					<a href="${pageContext.request.contextPath}/FindDetailServlet?pid=${v.pid }">${v.pid }</a></td>
      
					<td>${v.pname}</td>
				    
					<td>${v.ocount }</td>
         
					<td>${v.oprice}</td>          
					  
				  
					  
					<td>${v.address}</td>
					
				<td>${v.ordertime}</td> 

				</tr>

			</c:forEach>


		</table>
 
		</c:if>
   </div>
</body>