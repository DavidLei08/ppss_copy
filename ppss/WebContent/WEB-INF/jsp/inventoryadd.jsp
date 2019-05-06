<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库存记录添加</title>
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
	width: 220px
}

hr {
	margin-top: 4px;
	border: 0;
	height: 1px;
	background: gray;
}
</style>
<script
	src="${pageContext.request.contextPath }/res/jquery/jquery-1.9.1.js"></script>
</head>
<body>
	<div style="margin-left: 1px; margin-top: 5px; width: 98%;">
		<a class="button button-tiny"
			href="${pageContext.request.contextPath}/inventory/init"><font
			size="3"><i class="fa fa-list-alt fa-1x"></i>&nbsp;库存管理</font></a>-<a
			class="button button-tiny"><font size="3"><i
				class="fa fa-plus  fa-1x"></i>&nbsp;添加库存记录</font></a>
				<br>
				<br>
<form action="${pageContext.request.contextPath}/inventory/add" method="post" enctype="multipart/form-data">
		<table style="width: 30%;border: 1px solid #0066FF;" id="addtable" height="420px" >
			<tr>
				<th height="30px" colspan="3"
					style="text-align: left; background-color: #1b9af7; color: #ffffff;">
					<i
				class="fa fa-plus  fa-1x"></i>&nbsp;添加库存记录
				</th>
			</tr>
			<tr>
				<th>药品通用名</th>
				<td><input type="text" name="medicineName"></td>
				<td width="15%">&nbsp;</td>
			</tr>
			<tr>
				<th>药品规格</th>
				<td><input type="text" name="medicineSp"></td>
				<td></td>
			</tr>
			<tr>
				<th>药品价格(/元)</th>
				<td><input type="text" name="medicinePrice" ></td>
				<td></td>
			</tr>
			<tr>
				<th>药品产地</th>
				<td><textarea rows="3" cols="32" name="medicineOriginPlace"></textarea></td>
				<td></td>
			</tr>
			<tr>
				<th>药用效果</th>
				<td><textarea rows="4" cols="32" name="medicineEffect"></textarea></td>
				<td></td>
			</tr>
			<tr>
				<th>药品图片</th>
				<td><input type="file" name="imageFile"></td>
				<td></td>
			</tr>
			<tr>
				<th>药品库存量</th>
				<td><input type="text" name="medicineInventory"> </td>
				<td></td>
			</tr>
			<tr>
			<td align="right"><button type="submit" class="button button-primary button-small"><i class="fa fa-save  fa-1x"></i>&nbsp;保存</button></td>
			<td align="right"><button type="reset" class="button button-primary button-small"><i class="fa fa-reply fa-1x"></i>&nbsp;取消</button></td>
			<td></td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>