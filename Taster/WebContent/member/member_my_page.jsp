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
<div class="top_module"></div>

<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='shopAdd.action'">식당등록</td>
		<td onclick="location.href='qWrite.action'">문의하기</td>
	</tr>
</table>
	
<table style="width:100%; margin-top:10px">
	<tr>
		<td align="center">MY REVIEW RESTAURANT</td>
		<td align="center">My BOOKMARK RESTAURANT</td>
	</tr>
	
	
			<c:forEach var="reviewList" items="${reviewList}">
				<tr>
					<td>${reviewList.r_image}</td>
					<c:if test="${empty reviewList.r_image}">
						<img src="/Taster/images/1.jpg"/>
					</c:if>
				</tr>
				<tr>
					<td>${reviewList.shop_name}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty reviewList }">
				등록된 식당이 없습니다
			</c:if>
			<c:forEach var="bookmarkList" items="${bookmarkList}">
				<tr>
					<td>${bookmarkList.r_image2}</td>
				</tr>
				<tr>
					<td>${bookmarkList.shop_name2}</td>
				</tr>
			</c:forEach>
	
</table>



</body>
</html>