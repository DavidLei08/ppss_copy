<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员库存管理</title>
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

hr{
margin-top:4px;
border:0;
height:1px;
background:gray;

}
</style>
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
<script type="text/javascript">
var checkNum='';

function setCheckNum(medicineId){
	checkNum=medicineId;
}

function add(){
	location.href='${pageContext.request.contextPath }/inventory/add';
}

function update(){
	var medicineId=checkNum;
	if(medicineId!=''&&confirm('确认更新编号为'+medicineId+'的库存记录？')){
		location.href='${pageContext.request.contextPath }/inventory/update?medicineId='+medicineId;
	}
}

function del(){
	var medicineId=checkNum;
	if(medicineId!=''&&confirm('确认删除编号为'+medicineId+'的库存记录？')){
		location.href='${pageContext.request.contextPath }/inventory/del?medicineId='+medicineId;
	}
}
</script>
</head>
<body>
	<div style="margin-left: 1%; width: 98%">
		<a class="button button-tiny"><font size="3"><i
				class="fa fa-list-alt fa-1x"></i>&nbsp;库存管理</font></a>
		<form action="${pageContext.request.contextPath}/inventory/search"
			method="post">
			<hr>
			<table style="width:100%">
				<tr>
					<th>药品编号</th>
					<td><input type="text" name="medicineId" value="${medicine.medicineId}"></td>
					<th>药品通用名</th>
					<td><input type="text" name="medicineName" value="${medicine.medicineName}"></td>
					<th>药品产地</th>
					<td><input type="text" name="medicineOriginPlace" value="${medicine.medicineOriginPlace}"></td>
					<th>药用效果</th>
					<td><input type="text" name="medicineEffect" value="${medicine.medicineEffect}"></td>
					<td><button type="submit" class="button button-primary button-small"><i class="fa fa-search fa-1x"></i>&nbsp;搜索</button></td>
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
		<th>选择</th>
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
		<td><input type="radio" value="${medicine.medicineId}" name="checkNum" onclick="setCheckNum(this.value)"></td>
		</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>