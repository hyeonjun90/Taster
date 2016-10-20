<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="/Taster/css/style.css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<style>
	#joinTable {
		width: 800px;
		height: 380px;
		margin-top: 10px;
		padding: 0px;
	}
	#joinTable tr th {
		width: 20%;
		background-color: #f7f7f7;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
		background-image: url('/Taster/images/bg_01.gif');
		background-size:700%;
		background-repeat: no-repeat;
		border-bottom: 1px solid #a6a6a6;
	}
	#joinTable tr td {
		width: 80%;
		font-size: 11px;
		font-family : 'NanumGothic';
		vertical-align: middle;
		padding-left:3px;
		border-bottom: 1px solid #a6a6a6;
		padding-bottom: 5px;
	}
	#joinTable tr td input {
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	.zipcode {
		margin-bottom: 1px;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
	}
	#joinTable button {
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable input {
		height: 10px;
	}
	#joinTable img {
		height: 20px;
		cursor: pointer;
	}
	#joinTable font {
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
	}
	#joinDiv {
		width: 820px;
		border: 1px solid #a6a6a6;
		margin-top: 30px;
		margin-bottom: 15px;
	}
	#joinDiv div {
		width:750px; border-bottom:3px solid #f0f0f0;
		text-align: left; padding: 10px;
		font-size: 14px; font-family : 'Noto Sans', sans-serif;
	}
</style>
<script language="javascript">

var checkIdNum = 0; // 아이디 중복체크 변수
var checkNicNum = 0; // 닉네임 중복체크 변수
var emailNum = 0; // 인증번호 일치 여부 확인
var result = 0; // 인증번호 저장 변수

function joinConf() {
	var form = document.joinForm;
	
	if(form.member_id.value == "") {
		alert("아이디를 입력하세요.");
		return;
	} else if (form.member_pwd.value == "" || form.member_pwd2.value == "") {
		alert("비밀번호를 입력하세요.");
		return;
	} else if (form.member_pwd.value != form.member_pwd2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		return;
	} else if (form.member_name.value == "") {
		alert("이름을 입력하세요.");
		return;
	} else if (form.member_nicname.value == "") {
		alert("닉네임을 입력하세요.");
		return;
	} else if (form.member_email1.value == "") {
		alert("이메일을 입력하세요.");
		return;
	} else if (form.phone1.value == "" || form.phone3.value == "" || form.phone3.value == "") {
		alert("휴대폰 번호를 정확히 입력해주세요.");
		return;
	} else if (checkIdNum != 1) {
		alert("아이디 중복확인을 해주세요.");
		return;
	} else if (checkNicNum != 1) {
		alert("닉네임 중복확인을 해주세요.");
		return;
	} else if (emailNum != 1) {
		alert("이메일 인증번호를 입력해주세요.");
		return;
	}
	form.member_phone.value = "" + form.phone1.value + form.phone2.value + form.phone3.value;
	form.member_zipcode.value = "" + form.member_zipcode1.value + "-" + form.member_zipcode2.value;
	form.member_addr.value = "" + form.member_addr1.value + form.member_addr2.value;
	if(form.member_email2.value != "") {
		form.member_email.value = "" + form.member_email1.value + "@" + form.member_email2.value;
	} else {
		form.member_email.value = "" + form.member_email1.value;
	}
	
	form.submit();
}

function memberNicCheck() {
	var form = document.joinForm;
	
	if(form.member_nicname.value == "") {
		alert("닉네임을 입력해주세요.");
		return;
	}
	
	$.ajax({
		url: "nicCheck.action",
		type: "POST",
		async:true,
		dataType: "Text", 
		data: {"member_nicname": form.member_nicname.value},
		success: function(data) {
			//alert(data);
			
			if(data == 0) {
				$("#checkNic").empty();
				$("#checkNic").html("<font color='blue'>사용 가능한 닉네임 입니다.</font>");
				checkNicNum = 1;
			} else {
				$("#checkNic").empty();
				$("#checkNic").html("<font color='red'>이미 사용중인 닉네임 입니다.</font>");
				checkNicNum = 0;
			}
		}
		
	});
	
}
function memberIdCheck() {
	var form = document.joinForm;
	
	if(form.member_id.value == "") {
		alert("아이디를 입력해주세요.");
		return;
	}
	$.ajax({
		url: "idCheck.action",
		type: "POST",
		async:true,
		dataType: "Text", 
		data: {"member_id": form.member_id.value},
		success: function(data) {
			//alert(data);
			
			if(data == 0) {
				$("#checkId").empty();
				$("#checkId").html("<font color='blue'>사용 가능한 아이디입니다.</font>");
				checkIdNum = 1;
			} else {
				$("#checkId").empty();
				$("#checkId").html("<font color='red'>이미 사용중인 아이디 입니다.</font>");
				checkIdNum = 0;
			}
		}
		
	});
}
function SendEmail() {
	var form = document.joinForm;
	
	if(form.member_email1.value == "") {
		alert("이메일을 입력해주세요.");
		return;
	}
	
	if(form.member_email2.value != "") {
		var member_email = "" + form.member_email1.value + "@" + form.member_email2.value;
	} else {
		var member_email = "" + form.member_email1.value;
	}
	var emailConfirm = document.getElementById("emailConfirm");	
	
	alert("이메일이 발송되었습니다.");
	emailConfirm.innerHTML = "<input type='text' name='emailNum' id='emailNum' style='width:80px;font-size:10px;' placeholder='인증번호 4자리'/> <input type='button' value='확인' onclick='emailNumCheck();' style='font-size:10px;height:17px;' /> <span name='timer' id='timer'></span>";
	timer();
	$.ajax({
		url: "emailAction.action",
		type: "POST",
		async:true,
		dataType: "Text", 
		data: {"member_email": member_email},
		success: function(data) {
			result = data; //인증번호를 result에 저장	
		}
	});
}
function emailNumCheck() {
	var form = document.joinForm;
	var emailNumVal = form.emailNum.value; //인증번호
	
	if(emailNumVal == "") {
		alert("인증번호를 입력해주세요.");
		return;
	}
	
	var emailConfirm = document.getElementById("emailConfirm");	
	if(emailNumVal == result.trim()) {
		emailConfirm.innerHTML = "<font color='green' size='3'>인증번호가 확인되었습니다.</font>";
		emailNum = 1;
	} else {
		alert("인증번호가 일치하지 않습니다.");
		emailNum = 0;
	}
}
function timer() {
		var set_number = 180;
		var minute = 0;
		var second = 0;
		var t = setInterval(function() {
			set_number--;
			if(set_number == 0) {
				document.getElementById("timer").innerHTML = "<font color='green' size='3'>시간이 만료되었습니다.</font>";
				clearInterval(t);
				result = 0; // 인증번호 초기화
				return;
			}
			minute = parseInt(set_number / 60);
			second = set_number % 60;
			document.getElementById("timer").innerHTML = "<font color='red' size='3'>"+minute+"분 "+second+"초</font>";
			
		}, 1000);
}
function openZipcode(){			
	var url="zipCode.action";
	open(url, "confirm", "toolbar=no,location=no,"
						+"status=no,menubar=no,"
						+"scrollbars=yes,resizable=no,"
						+"width=610,height=400");
}
</script>
</head>
<body>

<center>
<div id="joinDiv" style="border:0px;">
<div><strong>회원가입</strong></div>
<form method="post" action="memberJoinOk.action" name="joinForm">
<input type="hidden" name="member_zipcode" />
<input type="hidden" name="member_phone" />
<input type="hidden" name="member_addr" />
<input type="hidden" name="member_email" />
<table id="joinTable">
	<tr>
		<th >아이디</th>
		<td>
			<table width="100%">
				<tr>
					<td style="width:150px;border-bottom:0px;padding-left:0px;">
						<input type="text" name="member_id" id="member_id" style=""/>
					</td>
					<td style="border-bottom:0px;padding-left:0px;">
						<img src="/Taster/images/bt_check.gif" alt="" onclick="memberIdCheck();" />
					</td>
				</tr>
			</table>
			<p id="checkId" style="height:0;margin-top:-3px;margin-left:5px;">
				<font size="3">중복확인을 해주세요.</font>
			</p>
			
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="member_pwd" id="password" />
		</td>
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td><input type="password" name="member_pwd2" id="password2" /></td>
	</tr>
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="member_name" id="member_name" />
		</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>
		
			<table width="100%">
				<tr>
					<td style="width:150px;border-bottom:0px;padding-left:0px;">
						<input type="text" name="member_nicname" id="member_nicname" />
					</td>
					<td style="border-bottom:0px;padding-left:0px;">
						<img src="/Taster/images/bt_check.gif" alt="" onclick="memberNicCheck();" />
					</td>
				</tr>
			</table>
			<p id="checkNic" style="height:0;margin-top:-3px;margin-left:5px;">
				<font size="3">중복확인을 해주세요.</font>
			</p>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td style="width:800px;">
			<table style="width:100%;">
				<tr>
					<td style="width:250px;border-bottom:0px;padding-left:0px;height:25px;">
						<input type="text" name="member_email1" id="member_email1" size="28" style="font-size:11px;"/>
						@ <select name="member_email2" id="member_email2" style="font-size:11px;margin-top:5px;height:20px;">
							<option value="">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="daum.net">다음</option>
							<option value="gmail.com">구글</option>
							<option value="nate.com">네이트</option>
							<option value="yahoo.com">야후</option>
						</select>
					</td>
					<td style="border-bottom:0px;padding-left:0px;width:400px;">
						<input type="button" value="인증번호 발송" onclick="SendEmail();" 
							style="font-size:10px;height:17px;margin-top:5px;"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0px;padding-left:0px;" id="emailConfirm">
										
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	<tr>
		<th style="background-image: url('/Taster/images/bg_01.gif');">주소</th>
		<td>
			<table width="100%">
				<tr> 
					<td style="width:30px;border-bottom:0px;padding-bottom:2px;padding-left:0px;">
						<input type="text" name="member_zipcode1" id="member_zipcode1" size="5" class="zipcode" onclick="openZipcode();" readonly/>
					- <input type="text" name="member_zipcode2" id="member_zipcode2" size="5" class="zipcode" onclick="openZipcode();" readonly/>
					</td>
					<td style="border-bottom:0px;height:12px;padding-bottom:2px;padding-left:0px;">
						<img src="/Taster/images/bt_zipcode.gif" alt="" onclick="openZipcode();" /> 
					</td>
				</tr>
				<tr style="height:12px;">
					<td colspan="2" style="border-bottom:0px;height:12px;padding-bottom:2px;padding-left:0px;">
					<input type="text" name="member_addr1" id="member_addr1" class="zipcode" size="50" onclick="openZipcode();" readonly/> 
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom:0px;padding-bottom:2px;padding-left:0px;">
					<input type="text" name="member_addr2" id="member_addr2" class="zipcode" size="50"/>
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td>
			<input type="text" name="phone1" id="phone1" size="10" maxlength="3"/>
			- <input type="text" name="phone2" id="phone2" size="10" maxlength="4"/>
			- <input type="text" name="phone3" id="phone3" size="10" maxlength="4"/>
		</td>
	</tr>
	<tr>
		<th>사진 등록</th>
		<td style="height:30px;font-size:10px;">
			<input type="file" name="member_image" id="member_image" style="height:22px;font-size:10px;"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height:50px;border:1px solid white;">
		<img src="/Taster/images/bt_ok.gif" alt="" style="margin-right:10px;" onclick="joinConf();"/>
		<img src="/Taster/images/bt_cancel.gif" alt="" onclick="javascript:if(confirm('작성한 정보가 초기화 됩니다. 취소하시겠습니까?')){location.href='main.action'}" /> 
		</td>
	</tr>
</table>
</form>
</div>
</center>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>























