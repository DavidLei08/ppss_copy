<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户菜单</title>
<link rel="SHORTCUT ICON"
	href="${pageContext.request.contextPath }/res/image/logo1.ico">
<link rel="ICON"
	href="${pageContext.request.contextPath }/res/logo1.ico">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/res/css/button.css">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body bgcolor="#cedbfe">
<table style="margin-left:1%;width:98%;margin-top:0px">
<tr>
<td><strong><font style="font-size:25px" color="#0080c0">PPSS药品销售系统</font></strong></td>
<td width="0%">&nbsp;</td>
<td><a href="${pageContext.request.contextPath }/medicineshop/init"  target="mainFrame" class="button button-primary button-small "><font size="3"><i class="fa fa-shopping-cart fa-1x"></i>&nbsp;药品商城</font></a></td>
<td><a href="${pageContext.request.contextPath }/simpleorder/init" target="mainFrame" class="button button-primary button-small "><font size="3"><i class="fa fa-file-text-o fa-1x"></i> &nbsp;订单中心</font></a></td>
<td><a href="${pageContext.request.contextPath }/simpleuser/init" target="mainFrame" class="button button-primary button-small "><font size="3"><i class="fa fa-user-circle fa-1x"></i>&nbsp;个人中心</font></a></td>
<td width="40%">&nbsp;</td>
<td align="right"><font style="font-size:13px">用户：</font><font  style="font-size:13px" color="blue">${user.userName}</font><br>
<button onclick="parent.location.href='${pageContext.request.contextPath}/auth/logout'" style="font-size:12px;background-color:#0080c0;color: white;border: 0"><i class="fa fa-external-link-square fa-1x"></i>退出登录</button>
</td>
</tr>
</table>
</body>
</html>