<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>药品商城</title>
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
	left: 1110px;
	top: 94px;
}
-->
</style>
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
	//将药品添加到购物车
	function toShopCar(medicineId) {
		//初始化异步请求对象
		var xhr = new XMLHttpRequest();
		xhr.open("GET",
				"${pageContext.request.contextPath }/medicineshop/toshopcar/"
						+ medicineId, "true");
		xhr.send();
		//当请求状态变化时触发函数
		xhr.onreadystatechange = function() {
			//状态为4，请求的状态码为200时，取得返回的数据
			if (xhr.readyState == 4 && xhr.status == 200) {
				var itemList = xhr.responseText;
				//调用函数解析成购物车
				shopCarShow(itemList);
			}
		}
	}

	//购车药品剂量+1
	function add(medicineId) {
		//初始化异步请求对象
		var xhr = new XMLHttpRequest();
		xhr.open("GET",
				"${pageContext.request.contextPath }/medicineshop/shopcarincrease/"
						+ medicineId, "true");
		xhr.send();
		//当请求状态变化时触发函数
		xhr.onreadystatechange = function() {
			//状态为4，请求的状态码为200时，取得返回的数据
			if (xhr.readyState == 4 && xhr.status == 200) {
				var itemList = xhr.responseText;
				//调用函数解析成购物车
				shopCarShow(itemList);
			}
		}
	}

	//购物车药品剂量-1
	function reduce(medicineId) {
		//初始化异步请求对象
		var xhr = new XMLHttpRequest();
		xhr.open("GET",
				"${pageContext.request.contextPath }/medicineshop/shopcarreduce/"
						+ medicineId, "true");
		xhr.send();
		//状态变化时触发函数
		xhr.onreadystatechange = function() {
			//返回状态正常时取得返回数据
			if (xhr.readyState == 4 && xhr.status == 200) {
				var itemList = xhr.responseText;
				//调用函数解析json
				shopCarShow(itemList);
			}
		}
	}

	//将返回的json字符串解析成购物表
	function shopCarShow(itemList) {
		//将json字符串转成js数组
		var items = JSON.parse(itemList);
		//初始化总金额
		var amount = 0;
		//判断长度
		if (items.length > 0) {
			//下单按钮取消禁用
			$("#toorder").removeAttr("disabled");
		} else {
			//下单按钮禁用
			$("#toorder").attr('disabled', 'disabled');
		}
		//初始化解析的表头
		var str = "<tr style='background-color: #1b9af7; color: #ffffff;'><th>序号</th><th>药品</th><th>价格</th><th width='100px'>剂量</th></tr>";
		//迭代数组，拼接表格
		for (i = 0; i < items.length; i++) {
			amount += items[i].medicinePrice * items[i].medicineCount;
			var temp = "" + items[i].medicineId;
			str += "<tr><td>"
					+ (i + 1)
					+ "</td><td>"
					+ items[i].medicineName
					+ "</td><td>"
					+ items[i].medicinePrice
					+ "</td><td align='center'><i class='fa fa-plus-circle fa-1x' onclick=\"add(\'"
					+ temp + "\')\"></i>&nbsp; " + items[i].medicineCount
					+ "&nbsp;<i onclick=\"reduce(\'" + temp
					+ "\')\" class='fa fa-minus-circle fa-1x'></i></td></tr>"
		}
		str += "<tr><td>总金额："
				+ amount
				+ " 元</td><td><button class='button button-primary button-small' id='toorder' onclick='toOrder()'><i class='fa fa-edit fa-1x'></i>下单</button></td><td colspan='2'><button class='button button-primary button-small' onclick='shopcarCancel()'><i class='fa fa-remove fa-1x'></i>清空购物车</button></td></tr>";
		$("#shopCar").html(str);
	}

	//从购物车下单
	function toOrder() {
		location.href = '${pageContext.request.contextPath }/medicineshop/toorder';
	}
	//购物车清空
	function shopcarCancel() {
		location.href = '${pageContext.request.contextPath }/medicineshop/shopcarcancel';
	}
</script>
</head>
<body>
	<div style="margin-left: 1%; width: 98%">
		<a class="button button-tiny"><font size="3"><i
				class="fa fa-shopping-cart fa-1x"></i>&nbsp;药品商城</font></a>
		<form action="${pageContext.request.contextPath}/medicineshop/search"
			method="post">
			<hr>
			<table style="width: 70%">
				<tr>
					<th>药品通用名</th>
					<td><input type="text" name="medicineName"
						value="${medicine.medicineName}"></td>
					<th>药品产地</th>
					<td><input type="text" name="medicineOriginPlace"
						value="${medicine.medicineOriginPlace}"></td>
					<th>药用效果</th>
					<td><input type="text" name="medicineEffect"
						value="${medicine.medicineEffect}"></td>
					<td><button type="submit"
							class="button button-primary button-small">
							<i class="fa fa-search fa-1x"></i>&nbsp;搜索
						</button></td>
				</tr>
			</table>
		</form>
		<hr>
		<div>
			<span><font color="blue" style="font-size: 13px">${sucessMessage}</font><font
				color="red" style="font-size: 13px">${errorMessage}</font></span>
		</div>

		<table class="customers" style="width: 72%; font-size: 15px;">
			<tr height="30px">
				<th>序号</th>
				<th width="120px">图片</th>
				<th>药品通用名</th>
				<th width="200px">药用效果</th>
				<th width="200px">药品产地</th>
				<th>药品价格</th>
				<th>药品规格</th>
				<th></th>
			</tr>
			<c:forEach items="${medicineList}" var="medicine" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td><img alt="药品图片"
						src="${pageContext.request.contextPath}/medicineshop/medicineimg?medicineId=${medicine.medicineId}"
						style="width: 100px;"></td>
					<td>${medicine.medicineName}</td>
					<td>${medicine.medicineEffect}</td>
					<td>${medicine.medicineOriginPlace}</td>
					<td>${medicine.medicinePrice}&nbsp;元</td>
					<td>${medicine.medicineSp}</td>
					<td><button type="button" style="background-color:#0080c0;color: white;border: 0"
							onclick="toShopCar('${medicine.medicineId}')">
							<i class="fa fa-cart-plus  fa-1x"></i>&nbsp;添加到购物车
						</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="Layer1">
			<a class="button button-tiny"><font size="3"><i
					class="fa fa-shopping-cart fa-1x"></i>&nbsp;我的购物车</font></a>
			<table
				style="background-color: #FFFFF8; width: 100%; border: 1px solid #0066FF; border-collapse: collapse;"
				border="1px" id="shopCar">
				<tr style="background-color: #1b9af7; color: #ffffff;">
					<th>序号</th>
					<th>药品</th>
					<th>价格</th>
					<th width="100px">剂量</th>
				</tr>
				<c:forEach items="${itemlist}" var="item" varStatus="vs">
					<tr>
						<td>${vs.count}</td>
						<td>${item.medicineName}</td>
						<td>${item.medicinePrice}</td>
						<td align="center"><i onclick="add('${item.medicineId}')"
							class="fa fa-plus-circle fa-1x"></i>&nbsp;
							${item.medicineCount}&nbsp; <i
							onclick="reduce('${item.medicineId}')"
							class="fa fa-minus-circle fa-1x"></i></td>
					</tr>
				</c:forEach>

				<tr>
					<td>总金额：${amount} 元</td>
					<td><button class="button button-primary button-small"
							onclick="toOrder()" id="torder"
							<c:if test="${itemlist==null}">disabled="disabled"</c:if>>
							<i class="fa fa-edit fa-1x"></i>下单
						</button></td>
					<td colspan="2"><button
							class="button button-primary button-small"
							onclick="shopcarCancel()">
							<i class="fa fa-remove fa-1x"></i>清空购物车
						</button></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>