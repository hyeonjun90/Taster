<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
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
	}
	.zipcode {
		margin-bottom: 5px;
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
</head>
<body>

<center>
<div id="joinDiv">
<div><strong>회원가입</strong></div>

<table id="joinTable">
	<tr>
		<th>아이디</th>
		<td>
			
			<input type="text" name="member_id" id="member_id" />
			<img src="/Taster/images/bt_check.gif" alt="" />
			<font>(영문소문자, 숫자 조합으로 4~12자)</font>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="password" name="member_pwd" id="password" />
			<font>(영문, 숫자 조합으로 4~12자)</font>
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
			<input type="text" name="member_nicname" id="member_nicname" />
			<img src="/Taster/images/bt_check.gif" alt="" />
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="member_email" id="member_email" />
		</td>
	</tr>
	<tr>
		<th style="background-image: url('/Taster/images/bg_01.gif');">주소</th>
		<td>
			<input type="text" name="member_zipcode1" id="member_zipcode1" size="5" class="zipcode"/>
			- <input type="text" name="member_zipcode2" id="member_zipcode2" size="5" class="zipcode"/> 
			<img src="/Taster/images/bt_zipcode.gif" alt="" /> <br />
			<input type="text" name="member_addr1" id="member_addr1" class="zipcode" size="50"/>  <br />
			<input type="text" name="member_addr2" id="member_addr2" class="zipcode" size="50"/>
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td>
			<input type="text" name="phone1" id="phone1" size="10"/>
			- <input type="text" name="phone2" id="phone2" size="10"/>
			- <input type="text" name="phone3" id="phone3" size="10"/>
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
		<img src="/Taster/images/bt_ok.gif" alt="" style="margin-right:10px;"/>
		<img src="/Taster/images/bt_cancel.gif" alt="" /> 
		</td>
	</tr>
</table>
</div>
</center>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>























