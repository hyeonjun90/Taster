<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
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
	}
	.zipcode {
		margin-bottom: 5px;
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

var checkNum = 0;

function joinConf() {
	var form = document.joinForm;
	
	if(form.member_id.value == "") {
		alert("���̵� �Է��ϼ���.");
		return;
	} else if (form.member_pwd.value == "" || form.member_pwd2.value == "") {
		alert("��й�ȣ�� �Է��ϼ���.");
		return;
	} else if (form.member_pwd.value != form.member_pwd2.value) {
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		return;
	} else if (form.member_name.value == "") {
		alert("�̸��� �Է��ϼ���.");
		return;
	} else if (form.member_nicname.value == "") {
		alert("�г����� �Է��ϼ���.");
		return;
	} else if (form.member_email.value == "") {
		alert("�̸����� �Է��ϼ���.");
		return;
	} else if (form.phone1.value == "" || form.phone3.value == "" || form.phone3.value == "") {
		alert("�޴��� ��ȣ�� ��Ȯ�� �Է����ּ���.");
		return;
	} else if (checkNum != 1) {
		alert("���̵� �ߺ�Ȯ���� ���ּ���.");
		return;
	} 
	form.member_phone.value = "" + form.phone1.value + form.phone2.value + form.phone3.value;
	form.member_zipcode.value = "" + form.member_zipcode1.value + "-" + form.member_zipcode2.value;
	form.member_addr.value = "" + form.member_addr1.value + form.member_addr2.value;
	
	form.submit();
}


function memberIdCheck() {
	var form = document.joinForm;
	
	if(form.member_id.value == "") {
		alert("���̵� �Է����ּ���.");
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
				$("#checkId").html("<font color='blue'>��� ������ ���̵��Դϴ�.</font>");
				checkNum = 1;
			} else {
				$("#checkId").empty();
				$("#checkId").html("<font color='red'>�̹� ������� ���̵� �Դϴ�.</font>");
				checkNum = 0;
			}
		}
		
	});
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
<div id="joinDiv">
<div><strong>ȸ������</strong></div>
<form method="post" action="memberJoinOk.action" name="joinForm">
<input type="hidden" name="member_zipcode" />
<input type="hidden" name="member_phone" />
<input type="hidden" name="member_addr" />
<table id="joinTable">
	<tr>
		<th>���̵�</th>
		<td>
			
			<input type="text" name="member_id" id="member_id" style="margin-bottom:5px;"/>
			<img src="/Taster/images/bt_check.gif" alt="" onclick="memberIdCheck();" />
			<font>(�����ҹ���, ���� �������� 4~12��)</font><br/>
			<p id="checkId"></p>
			
		</td>
	</tr>
	<tr>
		<th>��й�ȣ</th>
		<td>
			<input type="password" name="member_pwd" id="password" />
			<font>(����, ���� �������� 4~12��)</font>
		</td>
	</tr>
	<tr>
		<th>��й�ȣ Ȯ��</th>
		<td><input type="password" name="member_pwd2" id="password2" /></td>
	</tr>
	<tr>
		<th>�̸�</th>
		<td>
			<input type="text" name="member_name" id="member_name" />
		</td>
	</tr>
	<tr>
		<th>�г���</th>
		<td>
			<input type="text" name="member_nicname" id="member_nicname" />
			<img src="/Taster/images/bt_check.gif" alt="" />
		</td>
	</tr>
	<tr>
		<th>�̸���</th>
		<td>
			<input type="text" name="member_email" id="member_email" />
		</td>
	</tr>
	<tr>
		<th style="background-image: url('/Taster/images/bg_01.gif');">�ּ�</th>
		<td>
			<input type="text" name="member_zipcode1" id="member_zipcode1" size="5" class="zipcode" onclick="openZipcode();"/>
			- <input type="text" name="member_zipcode2" id="member_zipcode2" size="5" class="zipcode" onclick="openZipcode();"/> 
			<img src="/Taster/images/bt_zipcode.gif" alt="" onclick="openZipcode();" /> <br />
			<input type="text" name="member_addr1" id="member_addr1" class="zipcode" size="50" onclick="openZipcode();"/>  <br />
			<input type="text" name="member_addr2" id="member_addr2" class="zipcode" size="50"/>
		</td>
	</tr>
	<tr>
		<th>�ڵ���</th>
		<td>
			<input type="text" name="phone1" id="phone1" size="10"/>
			- <input type="text" name="phone2" id="phone2" size="10"/>
			- <input type="text" name="phone3" id="phone3" size="10"/>
		</td>
	</tr>
	<tr>
		<th>���� ���</th>
		<td style="height:30px;font-size:10px;">
			<input type="file" name="member_image" id="member_image" style="height:22px;font-size:10px;"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height:50px;border:1px solid white;">
		<img src="/Taster/images/bt_ok.gif" alt="" style="margin-right:10px;" onclick="joinConf();"/>
		<img src="/Taster/images/bt_cancel.gif" alt="" /> 
		</td>
	</tr>
</table>
</form>
</div>
</center>
<jsp:include page="../common/bottom.jsp"></jsp:include>
</body>
</html>























