<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员用户信息添加</title>
<link rel="SHORTCUT ICON"
	href="${pageContext.request.contextPath }/res/image/logo1.ico">
<link rel="ICON"
	href="${pageContext.request.contextPath }/res/logo1.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/button.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/table.css">
<style type="text/css">
input[type="text"] {
	height: 18px;
	width: 270px
}
input[type="password"] {
	height: 18px;
	width: 270px
}

hr{
margin-top:4px;
border:0;
height:1px;
background:gray;

}
</style>
<script type="text/javascript">
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
</head>
<body>
<div style="margin-left:1%;width:98%">
<a class="button button-tiny" href="${pageContext.request.contextPath}/manageruser/init"><font size="3"><i class="fa fa-user-circle-o  fa-1x"></i>&nbsp;用户管理</font></a>-<a class="button button-tiny"><font size="3"><i class="fa fa-cogs fa-1x"></i>&nbsp;用户信息更新</font></a><br>
<hr>
<form action="${pageContext.request.contextPath }/manageruser/update"
			method="post">
			<table width="35%" id="update"
				style="border: 1px solid #0066FF; border-collapse: collapse;height:450px;"
				border="1px">
				<tr>
					<th colspan="2"
						style="height: 30px; text-align: left; background-color: #1b9af7; color: #ffffff;"><i
						class="fa fa-cogs fa-1x"></i>&nbsp;用户信息更新</th>
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
					<td><textarea name="userAddress" wrap="virtual" cols="40" rows="3">${userInfo.userAddress}</textarea></td>
				</tr>
				<tr>
					<th>联系电话</th>
					<td><input type="text" name="telNum" value="${userInfo.telNum}"></td>
				</tr>
				<tr>
					<th>用户权限</th>
					<td><input type="hidden" name="status" value="${userInfo.status}"><input type="text"
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
</body>
</html>