<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存告急</title>
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
</head>
<body>
<div style="margin-left: 1%; width: 98%">
		<a class="button button-tiny"><font size="3"><i
				class="fa fa-warning fa-1x"></i>&nbsp;库存告急</font></a>

		<div><span><font color="blue" style="font-size:13px">${sucessMessage}</font><font color="red" style="font-size:13px">${errorMessage}</font></span></div>
		<table class="customers" style="width:100%">
		<tr>
		<th>序号</th>
		<th width="120px">图片</th>
		<th>药品编号</th>
		<th>药品通用名</th>
		<th>药品产地</th>
		<th>药品价格</th>
		<th>药品规格</th>
		<th>库存量</th>
		<th></th>
		</tr>
		<c:forEach items="${medicineList}" var="medicine" varStatus="vs">
		<tr>
		<td>${vs.count}</td>
		<td ><img alt="药品图片" src="${pageContext.request.contextPath}/inventory/medicineimg?medicineId=${medicine.medicineId}" style="width:100px;"></td>
		<td>${medicine.medicineId}</td>
		<td>${medicine.medicineName}</td>
		<td>${medicine.medicineOriginPlace}</td>
		<td>${medicine.medicinePrice}&nbsp;元</td>
		<td>${medicine.medicineSp}</td>
		<td>${medicine.medicineInventory}</td>
		<td><font color="red"><i
				class="fa fa-warning fa-1x"></i>${medicine.medicineName}库存量不足50，请及时补充库存量</font></td>
		</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>