<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户个人中心</title>
<link rel="SHORTCUT ICON"
	href="${pageContext.request.contextPath }/res/image/logo1.ico">
<link rel="ICON"
	href="${pageContext.request.contextPath }/res/logo1.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/button.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/table.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function changeTable() {
		$("#show").hide();
		$("#update").show();
	}
	function check(){
	var p1=	$("#password").val();
	var p2=$("#confirmpassword").val();
	if(p1!=p2){
		alert("两次密码不一致");
		return false;
	}
	return true;
	}
</script>
<style type="text/css">
input {
	width: 270px;
	height: 20px;
}
</style>
</head>
<body>
	<div style="margin-left: 1%;width；98%">
		<a class="button button-tiny" href='#'><font size="3"><i
				class="fa   fa-user-o  fa-1x"></i>&nbsp;个人中心</font></a><br>
		<hr>
		<div><span><font color="blue" style="font-size:13px">${sucessMessage}</font><font color="red" style="font-size:13px">${errorMessage}</font></span></div>
		<table width="40%" id="show"
			style="border: 1px solid #0066FF; border-collapse: collapse;"
			border="1px">
			<tr>
				<th colspan="2"
					style="height: 30px; text-align: left; background-color: #1b9af7; color: #ffffff;"><i
					class="fa fa-file-text-o fa-1x"></i>&nbsp;个人信息</th>
			</tr>
			<tr>
				<th>用户编号</th>
				<td>${userInfo.userId}</td>
			</tr>
			<tr>
				<th>用户名</th>
				<td>${userInfo.userName}</td>
			</tr>
			<tr>
				<th>真实姓名</th>
				<td>${userInfo.realName}</td>
			</tr>
			<tr>
				<th>身份证号</th>
				<td>${userInfo.identityId}</td>
			</tr>
			<tr>
				<th>收获地址</th>
				<td>${userInfo.userAddress}</td>
			</tr>
			<tr>
				<th>联系电话</th>
				<td>${userInfo.telNum}</td>
			</tr>
			<tr>
				<th>用户权限</th>
				<td><c:if test="${userInfo.status ==0 }">管理员</c:if>
					<c:if test="${userInfo.status ==1 }">普通用户</c:if></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="button button-primary button-rounded button-small"
						onclick="changeTable()" type="button">个人信息修改</button>
				</td>
			</tr>
		</table>
		<form action="${pageContext.request.contextPath }/simpleuser/update"
			method="post">
			<table width="40%" id="update"
				style="border: 1px solid #0066FF; border-collapse: collapse; display: none;"
				border="1px">
				<tr>
					<th colspan="2"
						style="height: 30px; text-align: left; background-color: #1b9af7; color: #ffffff;"><i
						class="fa fa-file-text-o fa-1x"></i>&nbsp;个人信息修改</th>
				</tr>
				<tr>
					<th>用户编号</th>
					<td><input type="text" value="${userInfo.userId}" name="userId"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>用户名</th>
					<td><input type="text" name="userName"
						value="${userInfo.userName}"></td>
				</tr>
				<tr>
					<th>真实姓名</th>
					<td><input type="text" name="realName"
						value="${userInfo.realName}"></td>
				</tr>
				<tr>
					<th>身份证号</th>
					<td><input type="text" name="identityId"
						value="${userInfo.identityId}"></td>
				</tr>
				<tr>
					<th>收获地址</th>
					<td><textarea name="userAddress" wrap="virtual" cols="40" rows="2">${userInfo.userAddress}</textarea></td>
				</tr>
				<tr>
					<th>联系电话</th>
					<td><input type="text" name="telNum" value="${userInfo.telNum}"></td>
				</tr>
				<tr>
					<th>用户权限</th>
					<td><input type="hidden" name="status" value="${userInfo.status}"><input
						value="<c:if test="${userInfo.status ==0 }">管理员</c:if><c:if test="${userInfo.status ==1 }">普通用户</c:if>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>登录密码</th>
					<td><input type="password" name="password" id="password"
						value="${userInfo.password}"></td>
				</tr>
				<tr>
					<th>确认密码</th>
					<td><input type="password" name="confirmpassword" id="confirmpassword"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="button button-primary button-rounded button-small"
							type="submit" onclick="return check()"><i class="fa fa-save  fa-1x"></i>&nbsp;保存</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	
	window.onload=function(){
		var str='${sucessMessage}';
		if(str!=''){
			alert(str+",2秒后将重新登录");
			setTimeout(' login()',2000);
		}
	}
	function login(){
		parent.location.href="${pageContext.request.contextPath }/auth/logout"
	}
	</script>
</body>
</html>