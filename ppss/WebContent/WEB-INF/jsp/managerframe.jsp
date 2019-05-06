<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="SHORTCUT ICON" href="${pageContext.request.contextPath }/res/image/logo1.ico">
<link rel="ICON" href="${pageContext.request.contextPath }/res/logo1.ico"> 
<title>管理员菜单</title>
<frameset rows="8%,92%"  frameborder="no" border="0" bordercolor="#0066FF" framespacing="0">
<frame name="topFrame" scrolling="NO" src="${pageContext.request.contextPath}/frame/managermenu" scrolling="No" noresize="noresize" id="topFrame" title="顶层菜单"></frame>
<frame name="mainFrame" scrolling="YES" noresize="noresize" id="mainFrame" title="内容" src="${pageContext.request.contextPath}/frame/init"></frame>
</frameset>
</html>