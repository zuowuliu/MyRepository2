<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
	<!--开始的相对路径，找资源，以当前资源的路径为基准，经常容易处问题 
	以/开始的相对路径，以服务器的路径为标准 
		http://localhost:3306/项目名
	-->
<link rel="stylesheet" href="static/bootstrap-3.3.7/dist/css/bootstrap.css">
<script type="text/javascript" src="static/js/jquery-2.0.0.min.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet"> -->
</head>
<body>
	<div class="container">
	<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>BBS后台<small><em>		/登录管理</em></small></h1>
			</div>
		</div>
	<!-- 按钮 -->
		<div class="row">
  			<div class="col-md-4 col-md-offset-8">
  				<button class="btn btn-primary">新增</button>
  				<button class="btn btn-danger">删除</button>
  			</div>
		</div>
	<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>id</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>department</th>
						<th>操作</th>
					<tr/>
					<c:forEach items="${pageInfo.list}" var="emp">
						<tr>
						<th>${emp.id}</th>
						<th>${emp.empName}</th>
						<th>${emp.gender=="M"?"男":"女"}</th>
						<th>${emp.email}</th>
						<th>${emp.department.deptName}</th>
						<th>
							<button class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">编辑</span>
							</button>
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true">删除</span>
							</button>
						</th>
					<tr/>
					</c:forEach>
					
				</table>			
			</div>
		</div>
	<!-- 分页信息 -->
		<div class="row">
			<!-- 显示分页文字信息 -->
			<div class="col-md-6">
				当前${pageInfo.pageNum}页，总共${pageInfo.pages}页,总${pageInfo.total}条记录
			</div>
			<!-- 显示分页条信息 -->
			<div class="col-md-6">
				<ul class="pagination">
			 		<li><a href="http://localhost:8080/bbs-crud/emps?pn=1">首页</a></li>
			 		<c:if test="${pageInfo.hasPreviousPage}">
			 			<li><a href="http://localhost:8080/bbs-crud/emps?pn=${pageInfo.pageNum-1}">&laquo;</a></li>
			 		</c:if>
			  		 
			  		<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
			  		 <c:if test="${page_Num == pageInfo.pageNum }">  <!-- 页码如果等于当前页码则高亮显示 -->
			  		    <li class="active"><a href="#">${page_Num}</a></li>
			  		 </c:if>	    
				   	<c:if test ="${page_Num !=pageInfo.pageNum}">
				   		<li><a href="http://localhost:8080/bbs-crud/emps?pn=${page_Num}">${page_Num}</a></li>  <!-- 显示下一页 -->
				   </c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage}">		 
				    	<li><a href="http://localhost:8080/bbs-crud/emps?pn=${pageInfo.pageNum+1}">&raquo;</a></li>
				    </c:if>
				    <li><a href="http://localhost:8080/bbs-crud/emps?pn=${pageInfo.pages}">末页</a></li>    
				</ul>
			</div>
		</div>
	</div>
<!-- 
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script> -->
</body>
</html>
<!-- 
	但是标准的逻辑格式应该是这样子，即使用AJAX的方式来做这个查询
	1、index.jsp页面将直接发送ajax请求进行员工分页数据的查询
	2、服务器将查出的数据以JSON字符串的形式返回给浏览器
	3、浏览器接收到JSON字符串，可以使用JS对JSON进行解析，使用JS通过DOM增删来改变页面
	4、返回JSON，实现客户端的无关性
 -->