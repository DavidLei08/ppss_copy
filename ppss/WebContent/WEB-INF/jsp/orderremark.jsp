<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药品商城订单评价</title>
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
	<script type="text/javascript">
	function star(num){
		for(i=1;i<=5;i++){
			$("#star"+i).css({'background-color':'#ffffff'});
		}
		for(i=1;i<=num;i++){
			$("#star"+i).css({'background-color':'#1b9af7'});
			$("#orderRemark").val(i);
		}
	}
	</script>
</head>
<body>
<div style="margin-left:1%;width；98%">
<a class="button button-tiny" href='${pageContext.request.contextPath}/medicineshop/init'><font size="3"><i class="fa fa-reorder fa-1x"></i>&nbsp;药品商城</font></a>-<a class="button button-tiny"><font size="3"><i class="fa fa-file-text-o fa-1x"></i>&nbsp;订单评论</font></a><br>
<hr>
<div><span><font color="blue" style="font-size:13px">${sucessMessage}</font><font color="red" style="font-size:13px">${errorMessage}</font></span></div>
<form action="${pageContext.request.contextPath}/medicineshop/remark" method="post">
<table width="60%" style="border: 1px solid #0066FF;border-collapse:collapse;" border="1px">
<tr>
<th colspan="2" style="height:30px;text-align: left; background-color: #1b9af7; color: #ffffff;"><i class="fa fa-file-text-o fa-1x"></i>&nbsp;订单评价</th>
</tr>
<tr>
<td>订单号：${order.orderId}<input type="hidden" name="orderId" value="${order.orderId}"></td>
<td>售药药店：${order.shopName}</td>
</tr>
<tr>
<th colspan="2" align="left">
<font color="blue">对本次购药服务进评价</font>
</th>
</tr>
<tr>
<td>评价星级</td>
<td>
<button type="button" id="star1" onclick="star(1)" style="background-color:  "><i class="fa fa-star-o fa-2x"></i></button>
<button type="button" id="star2" onclick="star(2)"><i class="fa fa-star-o fa-2x"></i></button>
<button type="button" id="star3" onclick="star(3)"><i class="fa fa-star-o fa-2x"></i></button>
<button type="button" id="star4" onclick="star(4)"><i class="fa fa-star-o fa-2x"></i></button>
<button type="button" id="star5" onclick="star(5)"><i class="fa fa-star-o fa-2x"></i></button>
<input id="orderRemark" name="orderRemark" type="hidden"></td>
</tr>
<tr>
<td colspan="2">评价内容</td>
</tr>
<tr>
<td colspan="2">
<textarea rows="4" cols="40" name="orderRemarkWords" style="width: 100%"></textarea>
</td>
</tr>
<tr>
<td><button type="submit" class="button button-primary button-small"><i class="fa fa-edit fa-1x"></i>&nbsp;评价</button></td>
<td></td>
</tr>
</table>
</form>
</div>
</body>
</html>