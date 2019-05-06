<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户订单中心</title>
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
	<script type="text/JavaScript"
	src="${pageContext.request.contextPath }/res/My97DatePicker/WdatePicker.js"></script>
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
function orderInfo(orderId){
	location.href='${pageContext.request.contextPath}/simpleorder/orderinfo/'+orderId;
}
</script>
</head>
<body>
<div style="margin-left:1%;width:98%">
<a class="button button-tiny"><font size="3"><i class="fa fa-reorder fa-1x"></i>&nbsp;订单中心</font></a><br>
<hr>
<form action="${pageContext.request.contextPath}/simpleorder/search" method="post">
<table width="80%">
<tr>
<td>订单号</td>
<td><input type="text" name="orderId" value="${order.orderId}"></td>
<td>订单状态</td>
<td><select name="orderStatus" style="height:22px;width:120px">
<option value="0" >-订单状态-</option>
<option value="1" <c:if test="${order.orderStatus ==1 }">selected="selected"</c:if>>待发货</option>
<option value="2" <c:if test="${order.orderStatus ==2 }">selected="selected"</c:if>>待取货</option>
<option value="3" <c:if test="${order.orderStatus ==3 }">selected="selected"</c:if>>已取货</option>
<option value="4" <c:if test="${order.orderStatus ==4 }">selected="selected"</c:if>>交易失败</option>
</select></td>
<td>订单创建时间</td>
<td><input type="text" name="createTime" class="Wdate" value="${order.createTime}"
						onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"></td>
<td><button type="submit" class="button button-primary button-small"><i class="fa fa-search fa-1x"></i>&nbsp;搜索</button></td>
</tr>
</table>
</form>
<hr>
<div><span><font color="blue" style="font-size:13px">${sucessMessage}</font><font color="red" style="font-size:13px">${errorMessage}</font></span></div>
<table width="100%" class="customers" style="font-size:15px">
<tr>
<th>序号</th>
<th>订单号</th>
<th>用户名</th>
<th>订单创建时间</th>
<th>药店名</th>
<th width="160px">发货地址</th>
<th width="160px">收货地址</th>
<th>订单状态</th>
<th>订单发货时间</th>
<th>订单取货时间</th>
<th>订单总金额</th>
<th></th>
</tr>
<c:forEach items="${orderlist}" var="order" varStatus="vs">
 <tr>
<td>${vs.count}</td>
<td>${order.orderId}</td>
<td>${order.userId}</td>
<td>${order.createTime}</td>
<td>${order.shopName}</td>
<td>${order.sendAddress}</td>
<td>${order.userAddress}</td>
<td><c:if test="${order.orderStatus==1}">待发货</c:if>
<c:if test="${order.orderStatus==2}">待取货</c:if>
<c:if test="${order.orderStatus==3}">已取货</c:if>
<c:if test="${order.orderStatus==4}">交易失败</c:if>
</td>
<td>${order.sendTime}</td>
<td>${order.getTime}</td>
<td>${order.orderAmount}&nbsp;元</td>
<td><button style="background-color:#19af7;" onclick="orderInfo('${order.orderId}')"><i class="fa fa-file-text-o fa-1x"></i></button></td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>