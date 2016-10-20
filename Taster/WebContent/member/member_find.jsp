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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<script>
function findMemberId() {
	var form = document.idForm;
	
	if(form.member_email.value == "" || form.member_name.value == "") {
		alert("정보를 입력해주세요.");
		return;
	}
	
	document.getElementById("findId").innerHTML = "<img src='/Taster/images/loader.gif'/>";
	$.ajax({
		url: "findMemberId.action",
		type: "POST",
		async:true,
		dataType: "Text", 
		data: {"member_email": form.member_email.value},
		success: function(data) {
			//alert(data);
			
			if(data.trim() != "false") {
				$("#findId").empty();
				$("#findId").html("<font color='black'>회원님의 아이디는 <font color='green'>'"+data.trim()+"'</font> 입니다.</font>");
			} else {
				$("#findId").empty();
				$("#findId").html("<font color='red'>일치하는 정보가 없습니다.</font>");
			}
		}
		
	});
}

function findMemberPwd() {
	var form = document.pwdForm;
	
	if(form.member_email.value == "" || form.member_id.value == "") {
		alert("정보를 입력해주세요.");
		return;
	}
	
	document.getElementById("findPwd").innerHTML = "<img src='/Taster/images/loader.gif'/>";
	$.ajax({
		url: "findMemberPwd.action",
		type: "POST",
		async:true,
		dataType: "Text", 
		data: {"member_email": form.member_email.value},
		success: function(data) {
			//alert(data);
			if(data.trim() != "false") {
				$("#findPwd").empty();
				$("#findPwd").html("<font color='black'><font color='green'>'"+data.trim()+"'</font> 로 비밀번호가 전송됐습니다.</font>");
			} else {
				$("#findPwd").empty();
				$("#findPwd").html("<font color='red'>일치하는 정보가 없습니다.</font>");
			}
		}
		
	});
}
</script>
<style>
	#findDiv {
		width: 1000px;
		height: 320px;
		margin: 20px auto;
	}
	#findDiv div {
		width: 480px;
		height: 290px;
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
<form method="post" name="idForm">
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
					<input type="button" value="확 인" style="width:80px;" onclick="findMemberId();"/>
				</td>
			</tr>
		</table>
		<p height="10px"></p>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;" class="findTbl" id="findId">
					
				</td>
			</tr>
		</table>
	</div>
</form>
<div style="width:0px;height:260px;border:1px solid #a6a6a6;margin-top:10px;"></div>
<form name="pwdForm">
	<div id="pwDiv">
		<table class="findTbl">
			<tr>
				<td style="margin:10px;">
					<img src="/Taster/images/find_pw.gif" alt="" style="margin:10px;"/>
					<hr style="width:450px;" />
				</td>
			</tr>
		</table>
		<p height="50px"></p>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;" class="findTbl">
					<input type="text" name="member_id" id="member_id" placeholder="아이디" style="padding-left:5px;"/>
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
					<input type="button" value="확 인" style="width:80px;" onclick="findMemberPwd();"/>
				</td>
			</tr>
		</table>
		<p height="10px"></p>
		<table style="clear:both;">
			<tr>
				<td style="text-align:center;" class="findTbl" id="findPwd">
					
				</td>
			</tr>
		</table>
	</div>
</form>	
</div>
</center>
</body>
</html>




























