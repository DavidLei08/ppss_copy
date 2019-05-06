<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员用户管理</title>
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
	<style type="text/css">
input[type="text"] {
	height: 18px;
	width: 190px
}

hr{
margin-top:4px;
border:0;
height:1px;
background:gray;

}
</style>
<script type="text/javascript">
var checkNum='';

function setCheckNum(userId){
	checkNum=userId;
}

function add(){
	location.href='${pageContext.request.contextPath }/manageruser/add';
}

function update(){
	var userId=checkNum;
	if(userId!=''&&confirm('确认更新编号为'+userId+'的用户记录？')){
		location.href='${pageContext.request.contextPath }/manageruser/update/'+userId;
	}
}

function del(){
	var userId=checkNum;
	if(userId!=''&&confirm('确认删除编号为'+userId+'的用户记录？')){
		location.href='${pageContext.request.contextPath }/manageruser/del/'+userId;
	}
}
</script>
</head>
<body>
<div style="margin-left:1%;width:98%">
<a class="button button-tiny"><font size="3"><i class="fa fa-user-circle-o fa-1x"></i>&nbsp;用户管理</font></a><br>
<hr>
<form action="${pageContext.request.contextPath}/manageruser/search" method="post">
<table width="100%">
<tr>
<td>用户编号</td>
<td><input type="text" name="userId" value="${userInfo.userId}"></td>
<td>用户名</td>
<td><input type="text" name="userName" value="${userInfo.userName}"></td>
<td>真实姓名</td>
<td><input type="text" name="realName" value="${userInfo.realName}"></td>
<td>电话号码</td>
<td><input type="text" name="telNum" value="${userInfo.telNum}"></td>
<td>用户权限</td>
<td><select name="status" style="width:100px;height:22px">
<option value="">--用户权限--</option>
<option value="0" <c:if test="${userInfo.status==0}">selected="selected"</c:if>>管理员</option>
<option value="1" <c:if test="${userInfo.status==1}">selected="selected"</c:if>>用户</option>
</select></td>
<td><button type="submit"  class="button button-primary button-small"><i class="fa fa-search fa-1x"></i>&nbsp;搜索</button></td>
</tr>
</table>
</form>
<hr>
		<table width="100%">
		<tr>
		<td><button class="button button-primary button-small" onclick="add()"><i class="fa fa-plus  fa-1x"></i>添加</button></td>
		<td><button class="button button-primary button-small" onclick="update()"><i class="fa fa-cogs fa-1x"></i>更新</button></td>
		<td><button class="button button-primary button-small" onclick="del()"><i class="fa fa-trash fa-1x"></i>删除</button></td>
		<td width="50%"></td>
		</tr>
		</table>
<div><span><font color="blue" style="font-size:13px">${sucessMessage}</font><font color="red" style="font-size:13px">${errorMessage}</font></span></div>
<table width="100%" class="customers">
<tr height="28">
<th>序号</th>
<th>用户编号</th>
<th>用户名</th>
<th>密码</th>
<th>真实姓名</th>
<th>身份证号</th>
<th>收货地址</th>
<th>手机号</th>
<th>用户权限</th>
<th>选择</th>
</tr>
<c:forEach items="${userlist}" var="user" varStatus="vs">
<tr>
<td>${vs.count}</td>
<td>${user.userId}</td>
<td>${user.userName}</td>
<td>${user.password}</td>
<td>${user.realName}</td>
<td>${user.identityId}</td>
<td>${user.userAddress}</td>
<td>${user.telNum}</td>
<td><c:if test="${user.status ==0}">管理员</c:if><c:if test="${user.status ==1}">用户</c:if></td>
<td><input type="radio" name="checkNum" value="${user.userId}" onclick="setCheckNum(this.value)" <c:if test="${user.status ==0}">disabled="disabled"</c:if>></td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>