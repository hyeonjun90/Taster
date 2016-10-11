<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
</head>
<body>
<jsp:include page="./top.jsp"></jsp:include>
<div style="width:100%; height:300px; background-color:#fff">
	회원 등급 : <s:property value="testBean.member_level"/> <!-- 테스트 코드 -->
</div>
<jsp:include page="./bottom.jsp"></jsp:include>
</body>
</html> 