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

<style>
	.clearDiv{	clear:both;	}
	.shopInfo {	border:1px solid #d5d5d5; width:300px; height:150px; margin:20px; float:left; text-align:center;
	 box-sizing:border-box; vertical-align: middle}
	 .shopInfo span {vertical-align: middle; position:relative; color:#000; font-size:18px; font-weight:bold;
	  			margin-top:50px;  }
	.shopKind {width:99%;margin-top:25px;margin-left:10px;text-align:left;font-size:14px;color:#ff792a;font-weight:bold; text-align:left;}
	.line { border-left:2px solid #FF9900;}
</style>
</head>

<body>
<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='shopAdd.action'">식당등록</td>
		<td onclick="location.href='qWrite.action'">문의하기</td>
	</tr>
</table>

<center>
<div style="width:100%;">
<table style="width:1050px;" id="tblForm">
<tr>
<td>
	<div class="shopKind">MY REVIEW RESTAURANT</div>
</td>
<td>
	<div class="shopKind">MY BOOKMARK RESTAURANT</div>
</td>
</tr>
<tr>
<td>
<div style="width:450px; height:300px;text-align:center; margin:0px auto;">
<c:forEach items="${rList}" var="rList" varStatus="status">
	<div class="shopInfo">
		<div style="background-image:url('/Taster/images/shop/${rList.file_savname}');
				background-repeat: no-repeat; display:block; 
				width:298px;height:149px;background-size:298px 149px;padding-top:50px;">
			<span>${rList.shop_name}</span>
		</div>
	</div>
	
</c:forEach>
</div>
</td>
<td class="line">
<div style="width:450px; height:300px;text-align:center; margin:0px auto;">
<c:forEach items="${bList}" var="bList" varStatus="status">
	<div class="shopInfo">
		<div style="background-image:url('/Taster/images/shop/${bList.file_savname}');
				background-repeat: no-repeat; display:block; 
				width:298px;height:149px;background-size:298px 149px;padding-top:50px;">
			<span>${bList.shop_name}</span>
		</div>
	</div>
	
</c:forEach>
</div>
</td>
</tr>
</table>

</div>
</center> 



</body>
</html>