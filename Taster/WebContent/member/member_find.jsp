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
	}
	.findTbl tr td {
		width: 100%;
		text-align: center;
	}
	
</style>
</head>
<body>
<center>
<div id="findDiv">
	<div id="idDiv">
		<table class="findTbl">
			<tr>
				<td>
					<img src="/Taster/images/find_id.gif" alt="" />
					<hr />
				</td>
			</tr>
		</table>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;">
					<input type="text" name="member_name" id="member_name" placeholder="이름"/>
					<input type="text" name="member_email" id="member_email" placeholder="이메일"/>
				</td>
			</tr>
		</table>
	</div>
	<div id="pwDiv"></div>
</div>
</center>
</body>
</html>




























