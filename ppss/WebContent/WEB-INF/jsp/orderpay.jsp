<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员订单管理</title>
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
<style type="text/css">
input[type="text"] {
	height: 18px;
	width: 190px
}

hr {
	margin-top: 4px;
	border: 0;
	height: 1px;
	background: gray;
}

<!--
#Layer1 {
	position: absolute;
	width: 400px;
	height: 500px;
	z-index: 1;
	left: 300px;
	top: 170px;
}
-->
</style>

<script type="text/javascript">
	window.onload = function() {
		$("#zfb").hide();
		$("#wx").hide();
	}
	function showzfbImg() {
		$("#zfb").show();
		$("#wx").hide();
	}
	function showwxImg() {
		$("#wx").show();
		$("#zfb").hide();
	}
</script>
</head>
<body>
	<div style="margin-left: 1%; width: 98%">
		<a class="button button-tiny"
			href='${pageContext.request.contextPath}/medicineshop/init'><font
			size="3"><i class="fa fa-reorder fa-1x"></i>&nbsp;药品商城</font></a>-<a
			class="button button-tiny"><font size="3"><i
				class="fa fa-file-text-o fa-1x"></i>&nbsp;订单支付</font></a><br>
		<hr>

		<table width="60%">
			<tr>
				<th colspan="2"
					style="height: 40px; text-align: left; background-color: #cedbfe;">&nbsp;订单支付</th>
			</tr>
			<tr>
				<td>订单号：${order.orderId}</td>
				<td>总金额：${order.orderAmount}元</td>
			</tr>
			<tr>
				<th colspan="2"
					style="height: 40px; text-align: left; background-color: #cedbfe;">支付方式</th>
			</tr>
			<tr height="40px">
				<td colspan="2"><a onclick="showzfbImg()"><font><i
							class="fa fa-paypal  fa-1x"></i>&nbsp;支付宝支付</font></a></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><a onclick="showwxImg()"><font><i
							class="fa fa-wechat  fa-1x"></i>&nbsp;微信支付</font></a></td>
			</tr>
			<tr height="40px">
				<td colspan="2"><a><font><i
							class="fa fa-credit-card-alt  fa-1x"></i>&nbsp;银联卡支付</font></a></td>
			</tr>
						<tr height="40px">
				<td colspan="2"><a onclick="location.href='${pageContext.request.contextPath}/medicineshop/orderpaycancel/${order.orderId}'"><font color="blue"><i
							class="fa fa-window-close-o  fa-1x"></i>&nbsp;取消支付</font></a></td>
			</tr>
		</table>
		<div id="Layer1">
			<div id="zfb">
				<i class="fa fa-paypal  fa-1x"></i>支付宝支付<br> <img alt="支付二维码"
					src="${pageContext.request.contextPath}/res/image/zfb.jpg"
					style="width: 250px"><br>
				<br>
				<button class="button button-primary button-small"
					onclick="location.href='${pageContext.request.contextPath}/medicineshop/orderpay/${order.orderId}'">
					<i class="fa fa-check-square-o fa-1x"></i>&nbsp;确认已支付
				</button>
				
			</div>
			<div id="wx">
				<i class="fa fa-wechat  fa-1x"></i>微信支付<br> <img alt="支付二维码"
					src="${pageContext.request.contextPath}/res/image/wx.jpg"
					style="width: 250px"><br>
				<br>
				<button class="button button-primary button-small"
					onclick="location.href='${pageContext.request.contextPath}/medicineshop/orderpay/${order.orderId}'">
					<i class="fa fa-check-square-o fa-1x"></i>&nbsp;确认已支付
				</button>
			</div>
		</div>
	</div>
</body>
</html>