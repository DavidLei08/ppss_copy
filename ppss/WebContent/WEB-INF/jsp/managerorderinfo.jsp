<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详细信息</title>
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
	<script type="text/javascript">
	function orderSend(orderId){
		if(confirm('确认物流就绪，确认发货？')){
			location.href='${pageContext.request.contextPath }/manager/ordersend/'+orderId;
		}
	}
	function orderCancel(orderId){
		if(confirm('操作不可逆,确认办理退款？')){
			location.href='${pageContext.request.contextPath }/manager/ordercancel/'+orderId;
		}
	}
	</script>
</head>
<body>
<div style="margin-left:1%;width；98%">
<a class="button button-tiny" href='${pageContext.request.contextPath}/manager/orderinit'><font size="3"><i class="fa fa-reorder fa-1x"></i>&nbsp;订单管理</font></a>-<a class="button button-tiny"><font size="3"><i class="fa fa-file-text-o fa-1x"></i>&nbsp;详细信息</font></a><br>
<hr>
<table width="60%" style="border: 1px solid #0066FF;border-collapse:collapse;" border="1px">
<tr>
<th colspan="6" style="height:30px;text-align: left; background-color: #1b9af7; color: #ffffff;"><i class="fa fa-file-text-o fa-1x"></i>&nbsp;订单详细信息</th>
</tr>
<tr>
<td>订单编号</td>
<td>${order.orderId}</td>
<td>下单用户</td>
<td>${order.userId}</td>
<td>订单创建时间</td>
<td>${order.createTime}</td>
</tr>
<tr>
<td>发货药店</td>
<td>${order.shopName}</td>
<td>订单状态</td>
<td>
<c:if test="${order.orderStatus ==1}">待发货</c:if>
<c:if test="${order.orderStatus ==2}">待取货</c:if>
<c:if test="${order.orderStatus ==3}">已取货</c:if>
<c:if test="${order.orderStatus==4}">交易失败</c:if>
</td>
<td>发货时间</td>
<td>${order.sendTime}</td>
</tr>
<tr>
<td>发货地址</td>
<td>${order.sendAddress}</td>
<td>取货时间</td>
<td>${order.getTime}</td>
<td>收货地址</td>
<td>${order.userAddress}</td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td>订单总金额</td>
<td>${order.orderAmount}&nbsp;元</td>
</tr>
<tr>
<td colspan="6">
订单项明细<br>
<table style="background-color:#FFFFF8;width:80%;border: 1px solid #0066FF;border-collapse:collapse;" border="1px">
<tr>
<td>序号</td>
<td>药品编号</td>
<td>药品名</td>
<td>价格</td>
<td>剂量</td>
</tr>
<c:forEach items="${itemlist}" var="item" varStatus="vs">
<tr>
<td>${vs.count}</td>
<td>${item.medicineId}</td>
<td>${item.medicineName}</td>
<td>${item.medicinePrice}</td>
<td>${item.medicineCount}</td>
</tr>
</c:forEach>
</table>
</td>
</tr>
<tr>
<td>订单评价星级</td>
<td colspan="5">${order.orderRemark}</td>
</tr>
<tr>
<td>订单评价内容</td>
<td colspan="5">${order.orderRemarkWords}</td>
</tr>
<tr>
<td colspan="2"><button onclick="orderSend('${order.orderId}')" class="button button-primary button-small" <c:if test="${order.orderStatus !=1}"> disabled="disabled"</c:if>><i class="fa fa-paper-plane fa-1x"></i>&nbsp;确认发货</button></td>
<td colspan="2"><button onclick="orderCancel('${order.orderId}')"class="button button-primary button-small" <c:if test="${order.orderStatus !=1}"> disabled="disabled"</c:if>><i class="fa fa-tags fa-1x"></i>&nbsp;订单退款</button></td>
<td colspan="2"><button onclick="location.href='${pageContext.request.contextPath }/manager/orderinit'"class="button button-primary button-small"><i class="fa fa-reply fa-1x"></i>&nbsp;返回</button></td>
</tr>
</table>
</div>
</body>
</html>