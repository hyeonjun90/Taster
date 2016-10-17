<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyPage main</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
</head>
<body>
<div class="top_module">
<jsp:include page="/common/top2.jsp"></jsp:include>
</div>

<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='shopAdd.action'">식당등록</td>
		<td onclick="location.href='qWrite.action'">문의하기</td>
	</tr>
</table>
	
<table style="width:100%; margin-top:-50px">
	<tr>
		<td>MY REVIEW RESTAURANT</td>
		<td>My BOOKMARK RESTAURANT</td>
	</tr>
</table>

<jsp:include page="/common/bottom.jsp"></jsp:include>

</body>
</html>