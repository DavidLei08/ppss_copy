<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script type="text/JavaScript"
	src="${pageContext.request.contextPath }/res/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/button.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/table.css">
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
<style>
input[type="text"] {
	width: 280px;
	height：26px;
}

input[type="password"] {
	width: 280px;
	height：26px;
}
</style>
<script src="${pageContext.request.contextPath }/res/checkjs/check.js"></script>
</head>
<body background="${pageContext.request.contextPath }/res/image/bg1.jpg">
	<br>
	<br>
	<center>
		<h1>
			<font color="blue">PPSS药品售卖系统</font>
		</h1>
	</center>
	<div
		style="width: 30%; margin-left: 34%; background-color: rgba(174, 235, 238, 0.2); border: 1px solid #0066FF;">
		<form action="${pageContext.request.contextPath}/auth/regsiter"
			method="post">
			<div style="margin-left: 2%;">
				<h2 align="center">
					<font color="blue">用户注册</font>
				</h2>
				<table width="90%" id="add"
					style="border-collapse: collapse; height: 450px;" border="0px">
					<tr>
						<th width="150px">用户名</th>
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
						<td><textarea name="userAddress" wrap="virtual" cols="37"
								rows="3">${userInfo.userAddress}</textarea></td>
					</tr>
					<tr>
						<th>联系电话</th>
						<td><input type="text" name="telNum"
							value="${userInfo.telNum}"></td>
					</tr>
					<tr>
						<th>登录密码</th>
						<td><input type="password" name="password" id="password"
							value="${userInfo.password}"></td>
					</tr>
					<tr>
						<th>确认密码</th>
						<td><input type="password" name="confirmpassword"
							id="confirmpassword"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="button button-primary button-rounded button-small"
								type="submit" onclick="return check()">
								<i class="fa fa-skyatlas  fa-1x"></i>&nbsp;注册
							</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="button button-primary button-rounded button-small"
								type="reset">
								<i class="fa fa-rotate-right   fa-1x"></i>&nbsp;取消
							</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>