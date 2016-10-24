<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>신규 식당 리스트</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
</head>
<body>

<c:forEach items="${newShopResult}" var="newShopResult" varStatus="status">
	<table>
		<tr>
			<td rowspan="4"><img src="${newShopResult.file_savename}"></td>
			<td><c:out value="${newShopResult.shop_idx}"/></td>
			<td><c:out value="${newShopResult.shop_name}"/></td>
			<td>평점</td>
		</tr>
		<tr>
			<td><c:out value="${newShopResult.shop_addr1}"/>
				<c:out value="${newShopResult.shop_addr2}"/>
				<c:out value="${newShopResult.shop_addr3}"/>
				<c:out value="${newShopResult.shop_addr4}"/>
			</td>
		</tr>
		<tr>
			<td><c:out value="${newShopResult.member_id}"/></td>
		</tr>
		<tr>
			<td><c:out value="${newShopResult.r_content}"/></td>
		</tr>
		<tr>
			<td>자세히보기</td>
		</tr>
	
		<hr width="500px" color="#FF9900" noshade>

	</table>
</c:forEach>

</body>
</html>