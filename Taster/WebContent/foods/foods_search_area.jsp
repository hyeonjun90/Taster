<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	<c:if test="${startPage eq '������' }">
	document.getElementById("������").style.backgroundColor = "red";
	document.getElementById("������").style.color = "white";
	</c:if>
</script>
<c:forEach items="${gugunList}" var="gugunList" varStatus="status">
	<div class="gugun" onclick="foodsAreaListSearch('${gugunList }');" id="${gugunList }" >${gugunList }</div>
</c:forEach>