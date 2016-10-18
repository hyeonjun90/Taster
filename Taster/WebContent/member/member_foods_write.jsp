<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당등록 페이지</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
</head>
<body>
<div class="top_module"></div>
<table>
	<tr>
		<td>
			<font color="FF9933">＊식당이름</font>
		</td>
		<td>
			<input type="text" border="0" size="40" maxlength="50" name="shop_name">
		</td>
	</tr>
	<tr>
		<td>
			<font color="FF9933">＊식당 위치 선택</font>
		</td>
		<td>
			<input type="text" border="0" size="40" maxlength="50" name="shop_addr">
			<input type="button" value="위치검색" onclick="메소드 이름">
		</td>
	</tr>

</table>



</body>
</html>