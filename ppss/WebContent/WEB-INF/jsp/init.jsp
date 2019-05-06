<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登入初始页面</title>
</head>
<body>
<div style="margin-left:2%;margin-top:50px;width:96%;font-size:16px">
<c:if test="${user.status==0}"><font>尊敬的管理员</font></c:if>
<c:if test="${user.status==1}"><font>尊敬的用户</font></c:if>
<font color="blue">${user.userName}</font><font>，${dayScope}好！</font><br><br>
<font>PPSS药品售卖系统欢迎您的使用</font><br><br>
<font>version 1.0-19-05-01</font><br><br>
<font>当前时间：${dateTime}</font>
</div>
<div align="center" style="margin-top:30%">
<hr color="gray">
<font color="gray" size="2"> @copy right 2019 ppss.com</font>
</div>
</body>
</html>