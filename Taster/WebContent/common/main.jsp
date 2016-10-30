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
<style>
	.clearDiv{	clear:both;	}
	.shopInfo {	border:1px solid #d5d5d5; width:300px; height:150px; margin:20px; float:left; text-align:center;
	 box-sizing:border-box; vertical-align: middle}
	 .shopInfo span {vertical-align: middle; position:relative; color:#fff; font-size:18px; font-weight:bold;
	  			margin-top:50px; background:orange; border-radius:15px; padding:7px; }
	.shopKind {width:99%;margin-top:25px;margin-left:10px;text-align:left;font-size:14px;color:#ff792a;font-weight:bold;}
</style>
</head>
  
<body>
<center>
<div style="width:100%;">
<div class="shopKind">신규 맛집.</div>
<div style="width:1040px; height:300px;text-align:center; margin:0px auto;">
<c:forEach items="${newShopList}" var="shopBean" varStatus="status">
	<div class="shopInfo">
		<div style="background-image:url('/Taster/images/shop/${shopBean.file_savname}');
				background-repeat: no-repeat; display:block; 
				width:298px;height:149px;background-size:298px 149px;padding-top:50px;">
			<span>${shopBean.shop_name}</span>
			
		</div>
	</div>
	<c:if test="${status.index + 1 mod 3 == 0 && status.index != 0}">
		<div class="clearDiv"></div>
	</c:if>
</c:forEach>
	<!-- <div class="shopInfo"></div>
	<div class="shopInfo"></div>
	<div class="clearDiv"></div>
	
	<div class="shopInfo"></div>
	<div class="shopInfo"></div>
	<div class="shopInfo"></div>
	<div class="clearDiv"></div> -->
</div>
</div>
</center> 
</body>
</html>









