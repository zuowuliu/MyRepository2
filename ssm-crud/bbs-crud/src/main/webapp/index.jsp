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
<script type="text/javascript" src="static/js/jquery-2.0.0.min.js"></script>
<link rel="stylesheet" href="static/bootstrap-3.3.7/dist/css/bootstrap.css">
<script type="text/javascript" src="static/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 构建员工新增的模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      		</div> 
	      		<div class="modal-body">
	       		 	<form class="form-horizontal">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">empName</label>
						    <div class="col-sm-10" >
						      <input type="text" name="empName" class="form-control" id="emp_add_input" placeholder="员工姓名">
						      <span class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">email</label>
						    <div class="col-sm-10">
						      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@renbbs.com">
						      <span class="help-block"></span>      
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">gender</label>
						    <div class="col-sm-10">
						      <label class="radio-inline">
							  	<input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
							  </label>
							  <label class="radio-inline">
							  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
							  </label>
						    </div>
						  </div>
						  <div class="form-group">
						    	<label class="col-sm-2 control-label">deptName</label>
							  <div class="col-sm-4">
							      <!-- 部门提交ID即可 -->
							     <select class="form-control" name="dId">
							      	
								 </select>
							  </div>
						  </div>
					</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        		<button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
	      		</div>
    		</div>
  		</div>
	</div>
	
	<!-- 构建员工修改的模态框 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  		<div class="modal-dialog" role="document">
    		<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        		<h4 class="modal-title">员工修改</h4>
	      		</div> 
	      		<div class="modal-body">
	       		 	<form class="form-horizontal">
						  <div class="form-group">
						    <label class="col-sm-2 control-label">empName</label>
						    <div class="col-sm-10" >
						     <!--  <p class="form-control-static" id="empName_update_static"></p> -->
						      <input type="text" name="empName" class="form-control" id="emp_update_input" placeholder="员工姓名">
						      <span class="help-block"></span>
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">email</label>
						    <div class="col-sm-10">
						      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@renbbs.com">
						      <span class="help-block"></span>      
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-sm-2 control-label">gender</label>
						    <div class="col-sm-10">
						      <label class="radio-inline">
							  	<input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
							  </label>
							  <label class="radio-inline">
							  <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
							  </label>
						    </div>
						  </div>
						  <div class="form-group">
						    	<label class="col-sm-2 control-label">deptName</label>
							  <div class="col-sm-4">
							      <!-- 部门提交ID即可 -->
							     <select class="form-control" name="dId">
							      	
								 </select>
							  </div>
						  </div>
					</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        		<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
	      		</div>
    		</div>
  		</div>
	</div>
	
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
  				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
  				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
  			</div>
		</div>
	<!-- 表格 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th>
								<input type="checkbox" id="check_all">
							</th>
							<th>id</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>department</th>
							<th>操作</th>
						<tr/>
					</thead>
					<tbody>
						
					</tbody>
				</table>			
			</div>
		</div>
	<!-- 分页信息 -->
		<div class="row">
			<!-- 显示分页文字信息 -->
			<div class="col-md-6" id="page_info_area">
			
			</div>
			<!-- 显示分页条信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var totalRecord,currentPage;
		$(function(){
			//页面一进来就去首页
			toPage(1);
		});
		function toPage(pn){
			$.ajax({
				url:"http://localhost:8080/bbs-crud/emps",
				type:"GET",
				data:"pn="+pn,
				success:function(result){
					//解析并显示员工信息
					build_emps_table(result);
					//解析并显示分页信息
					build_page_info(result);
					//解析并显示分页条数据
					build_page_nav(result);
				}
			});
		}
		//构建员工信息表
		function build_emps_table(result){
			//每次执行以前先清空之前的数据信息
			$("#emps_table tbody").empty();
			$.each(result.extend.pageInfo.list,function(index,item){
					var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
					var idTd = $("<td></td>").append(item.id);
					var empNameTd = $("<td></td>").append(item.empName);
					var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
					var emailTd = $("<td></td>").append(item.email);
					var departmentTd = $("<td></td>").append(item.department.deptName);
					var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_Btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑"));
					editBtn.attr("edit_id",item.id);//深刻体会到了给按钮元素加自定义属性及属性值的好处
					var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm del_Btn").append($("<span></span>").addClass("glyphicon glyphicon-trash").append("删除"));
					delBtn.attr("del_id",item.id);
					var btn = $("<td></td>").append(editBtn).append(delBtn);
					$("<tr></tr>").append(checkBoxTd).append(idTd).append(empNameTd).append(genderTd).append(emailTd).append(departmentTd).append(btn).appendTo("#emps_table tbody");
				}
			)
		}
		//新建分页记录
		function build_page_info(result){
			//清空分页信息
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总共"+result.extend.pageInfo.pages+"页,总共"+result.extend.pageInfo.total+"条记录")
			totalRecord = result.extend.pageInfo.total;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//新建分页信息
		function build_page_nav(result){
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
			if(result.extend.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				prePageLi.click(function(){
					toPage(result.extend.pageInfo.pageNum-1);
				});
				firstPageLi.click(function(){
					toPage(1);
				});
			}
			
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			if(result.extend.pageInfo.hasNextPage == false){
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			}else{
				nextPageLi.click(function(){
					toPage(result.extend.pageInfo.pageNum+1);
				});
				lastPageLi.click(function(){
					toPage(result.extend.pageInfo.pages);
				});
			}
			ul.append(firstPageLi).append(prePageLi);
			$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
				var numLi =  $("<li></li>").append($("<a></a>").append(item));
				if(result.extend.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					toPage(item);
				})
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			var nav = $("<nav></nav>").append(ul);
			nav.appendTo("#page_nav_area");
		}
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");//清空输入框提示的样式
			$(ele).find(".help-block").text("");//清空span元素的文本信息
		}
		//点击新增按钮弹出模态框
		$("#emp_add_modal_btn").click(function(){
			//清除表单数据（表单完整重置（表单的数据，表单的样式））
			reset_form("#empAddModal form");
			//发送AJAX请求，查出部门信息，显示在下拉列表中
			getDepts("#empAddModal select");
			$("#empAddModal").modal({
				backdrop:"static",
				keyboard:"true"
			});
		});
		//查出所有部门信息并显示在下拉列表中
		function getDepts(ele){
			$(ele).empty();
			$.ajax({
				url:"http://localhost:8080/bbs-crud/depts",
				type:"GET",
				success:function(result){
					$.each(result.extend.depts,function(index,item){
						//$("#depts_add_select").append(item);
						var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
						$(ele).append(optionEle);
					})
				}
			});
		}
		//校验表单数据的内容
		function validate_add_form(){
			//拿到要校验的数据，使用正则表达式
			var empName = $("#emp_add_input").val();//可以使用ID直接拿到对应的这个元素的值，就是表单提交的数据
			var regName = /(^[a-zA-Z0-9_-]{2,16}$)|(^[\u2E80-\u9FFF]{2,5})/;//利用正则表达式来校验
			if(!regName.test(empName)){
				show_validate_msg("#emp_add_input","error","用户名应该是2-5位中文或者3-16位英文和数字的组合");
				return false;
			}else{
				show_validate_msg("#emp_add_input","success","");
				//错误之后再次输入正确的话得把input下面的span元素里面的文本信息清空才行
			}
			//校验邮箱的信息
			var email = $("#email_add_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_add_input","error","邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#email_add_input","success","");
			}
			return true;
		}
		function show_validate_msg(ele,status,msg){
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		//输入表单时校验是否有重名的员工
		$("#emp_add_input").change(function(){
			//使用AJAX去发送请求，查看是否有该重名的员工在数据库里面
			var empName = this.value;
			$.ajax({
				url:"http://localhost:8080/bbs-crud/checkuser",
				data:"empName="+empName,
				type:"POST",
				success:function(result){
					if(result.code == 100){
						show_validate_msg("#emp_add_input","success","用户名可以放心使用!");
						
					}else{
						show_validate_msg("#emp_add_input","error",result.extend.va_msg);
					}
				}
			});
		});
		//员工的保存
		$("#emp_save_btn").click(function(){
			//1、模态框中填写的表单数据提交给服务器进行保存
			//但是先要进行校验
			if(!validate_add_form()){
				return false;//return false之后这个点击的方法就结束了,也就是不会保存未通过校验的员工信息。
			};
				//2、发送AJAX请求保存员工
				$.ajax({
					url:"http://localhost:8080/bbs-crud/emp",
					type:"POST",
					data:$("#empAddModal form").serialize(),//识别表单提交过后的信息，通过表单input里面的name属性
					success:function(result){
						//当员工保存成功，关闭模态框，来到最后一页显示刚才保存的数据
						//1、关闭模态框
						$("#empAddModal").modal("hide");
						//2、来到最后一页看新保存的数据
						toPage(totalRecord);//totalRecord相当于是一个全局变量
					}
				});
		});
		//员工的修改发送AJAX请求
		//我们在editBtn等中添加了单独的标识样式在addClass中，作为定位的基准
		//但是如果真的直接定位到editBtn中添加click事件的话，绑定不上，而应该考虑在创建按钮的时候绑定，用on函数，在整个文档中查找
		$(document).on("click",".edit_Btn",function(){
			//每次单击编辑清除表单样式和getDepts()查询的部门信息
			reset_form("#empUpdateModal form");
			//1、查出员工信息，显示员工信息
			$("#empUpdateModal").modal({
				backdrop:"static",
				keyboard:"true"
			});
			getEmp($(this).attr("edit_id"));//因为edit_id是在函数内部定义的，
			//在全文定义的on函数，选择当前的这个按钮然后再通过attr调用自定义的属性值
			
			//2、查出部门信息，并显示部门列表
			getDepts("#empUpdateModal select");
			//在单击编辑按钮之后，把对应的员工ID的值“传递"给更新按钮，也就是为其新增一个属性
			$("#emp_update_btn").attr("edit_id",$(this).attr("edit_id"));
			
		});
		function getEmp(id){
			$.ajax({
				url:"http://localhost:8080/bbs-crud/emp/"+id,
				type:"GET",
				success:function(result){
					var empData = result.extend.emp;
					//$("#empName_update_static").text(empData.empName);
					$("#emp_update_input").val(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name = gender]").val([empData.gender]);
					$("#empUpdateModal select").val([empData.dId]);
				}
			});
		}
		//员工的更新
		$("#emp_update_btn").click(function(){
			//校验名字是否合法
			var empName = $("#emp_update_input").val();//可以使用ID直接拿到对应的这个元素的值，就是表单提交的数据
			var regName = /(^[a-zA-Z0-9_-]{2,16}$)|(^[\u2E80-\u9FFF]{2,5})/;//利用正则表达式来校验
			if(!regName.test(empName)){
				show_validate_msg("#emp_update_input","error","用户名应该是2-5位中文或者3-16位英文和数字的组合");
				return false;
			}else{
				show_validate_msg("#emp_update_input","success","");
				//错误之后再次输入正确的话得把input下面的span元素里面的文本信息清空才行
			}
			//验证邮箱是否合法
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_update_input","error","邮箱格式不正确");
				return false;
			}else{
				show_validate_msg("#email_update_input","success","");
			}
			$.ajax({
				url:"http://localhost:8080/bbs-crud/emp/"+$(this).attr("edit_id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					$("#empUpdateModal").modal("hide");
					toPage(currentPage);
				}
			});
			/**
			如果将AJAX发送的请求直接改为PUT的话，则会出现请求体中有数据但是Employee对象封装不上
			原因：
			Tomcat将请求体中的数据封装为一个map
			request.getParameter("empName")就会从这个map中取值
			SpringMVC封装POJO对象的时候会把POJO每个属性的值，request.getParameter("email");
			所以AJAX发送PUT请求，请求体中的数据，request.getParameter("empName")拿不到
			Tomcat一看是PUT不会封装请求体中的数据为map，只有POST形式的请求才封装请求体为map
			可以通过在web.xml中配置HttpPutFormContentFilter过滤器来解决这个问题（直接发送PUT之类的请求还要封装请求体中的数据）。
			它可以将请求体中的数据解析包装成一个map。
			**/
		});
		//单一员工的删除(利用在每一个删除按钮中添加的类来定位绑定单击事件)
		$(document).on("click",".del_Btn",function(){
			//1、弹出是否确认删除对话框
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var id = $(this).attr("del_id");
			if(confirm("你好，请问是否确认删除【"+empName+"】？")){//confirm确认对话框，在弹出对话框之后如果点击确认的话此函数就会返回true
				$.ajax({
					url:"http://localhost:8080/bbs-crud/emp/"+id,
					type:"DELETE",
					success:function(result){
						alert("恭喜你已成功删除该员工数据!");
						toPage(currentPage);
					}
				});
			}
		});
		//完成全选/全不选的功能
		$("#check_all").click(function(){
			//prop获取dom原生的属性，attr获取自定义属性的值
			var condition = $(this).prop("checked");
			$(".check_item").prop("checked",condition);
		});
		//为每一个单选框绑定事件，当选择完全的时候，check_all也会被勾选
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length == $(".check_item").length;
			$("#check_all").prop("checked",flag);
		});
		//点击全部删除，就批量删除
		$("#emp_delete_all_btn").click(function(){
			var empNames = "";
			$.each($(".check_item:checked"),function(){
				empNames+=($(this).parents("tr").find("td:eq(2)").text())+",";
				//去除多余的字符
				empNames = empNames.substring(0,empNames.length-1);
			});
			if(confirm("你好，请问确认删除【"+empNames+"】这些员工吗?")){
				//发送AJAX请求
			}
		});
	</script>
</body>
</html>
<!-- 
	但是标准的逻辑格式应该是这样子，即使用AJAX的方式来做这个查询（无需再重新载入这个页面）
	1、index.jsp页面将直接发送ajax请求进行员工分页数据的查询
	2、服务器将查出的数据以JSON字符串的形式返回给浏览器
	3、浏览器接收到JSON字符串，可以使用JS对JSON进行解析，使用JS通过DOM增删来改变页面
	4、返回JSON，实现客户端的无关性
 -->
 <!-- 
 	根据REST风格请求方式的不同发起的操作也不同
 	URI：
 	/emp/{id} GET查询员工
 	/emp 	  POST保存员工
 	/emp/{id} PUT修改员工
 	/emp/{id} DELETE删除员工
  -->