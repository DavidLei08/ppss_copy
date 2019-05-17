<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="SHORTCUT ICON"
	href="${pageContext.request.contextPath }/res/image/logo1.ico">
<link rel="ICON"
	href="${pageContext.request.contextPath }/res/image/logo1.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PPSS用户登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/button.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
	<style type="text/css">
	#login {
	position: absolute;
	width: 34%;
	height: 34%;
	z-index: 1;
	left: 33%;
	top: 33%;
	background-color: rgba(255,255,255, 0.5);
}
	</style>
	</head>
<body background="${pageContext.request.contextPath }/res/image/bg1.jpg">
	<div id="title" align="center" style="margin-top:10%">
		<h1>
			<font color="#0066FF" size="7">PPSS药品售卖系统</font>
		</h1>
	</div>
	<div id="login">
		<form action="${pageContext.request.contextPath}/auth/login"
			method="post">
			<table width="100%" height="100%" border="0">
				<tr>
					<td rowspan="7" width="39%"><img alt="图片"
						src="${pageContext.request.contextPath }/res/image/dl.png"
						 width="100%"></td>
					<td colspan="3" align="center"><h3>
							<font color="#0033FF"><i class="fa  fa-user-o fa-1x"></i>&nbsp;用户登录</font>
						</h3></td>
				</tr>
				<tr>
				<td colspan="3">
				<font color="red" style="font-size:13px">${message}</font>	<font color="blue" style="font-size:13px">${sucessMessage}</font>
				</td>
				</tr>
				<tr height="18%">
					<td width="20"><font color="#000099">用户名:&nbsp;</font></td>
					<td colspan="2"><input type="text" size="18"
						name="userName" id="userName" class="form-control"
						style="width: 85%" maxlength="16" type="text" placeholder="用戶名"></td>
				</tr>
				<tr height="18%">
					<td><font color="#000099">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;</font></td>
					<td colspan="2"><input type="password" size="18"
						name="password" id="password" class="form-control"
						style="width: 85%" maxlength="16" type="password" placeholder="密码"></td>
				</tr>
				<tr height="20%">
					<td colspan="3" align="center"><input type="submit" value="登录"
						class="button button-primary button-rounded button-small">
						&nbsp;&nbsp; <input type="button" value="注册" onclick="location.href='${pageContext.request.contextPath }/auth/regsiter'"
						class="button button-primary button-rounded button-small">
				</tr>
				<tr height="18%">

					<td colspan="3"><a href="#"><font color="#0066FF" size="1">账号密码忘了，账号找回</font></a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>