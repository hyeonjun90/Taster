<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
<style>
	#findDiv {
		width: 1000px;
		height: 400px;
		margin: 20px auto;
	}
	#findDiv div {
		width: 480px;
		height: 380px;
		border: 1px solid black;
		float: left;
	}
	.findTbl {
		width:100%;
	}
	.findTbl input {
		height: 30px;
		font-size: 13px;
		width: 300px;
		border: 1.5px solid #a6a6a6;
		font-family : 'Noto Sans', sans-serif;
		font-weight: bold;
	}
	.findTbl tr td {
		width: 100%;
		margin: 5px;
	}
	
</style>
</head>
<body>
<center>
<div id="findDiv">
<form action="findMemberId.action" method="post" name="idForm">
	<div id="idDiv">
		<table class="findTbl">
			<tr>
				<td style="margin:10px;">
					<img src="/Taster/images/find_id.gif" alt="" style="margin:10px;"/>
					<hr style="width:450px;" />
				</td>
			</tr>
		</table>
		<p height="50px"></p>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;" class="findTbl">
					<input type="text" name="member_name" id="member_name" placeholder="이름" style="padding-left:5px;"/>
				</td>
			</tr>
		</table>
		<p height="10px"></p>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;" class="findTbl">
					<input type="text" name="member_email" id="member_email" placeholder="이메일" style="padding-left:5px;"/>
				</td>
			</tr>
		</table>
		<p height="10px"></p>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;" class="findTbl">
					<input type="submit" value="확 인" style="width:80px;"/>
				</td>
			</tr>
		</table>
	</div>
</form>
	<div id="pwDiv"></div>
</div>
</center>
</body>
</html>




























