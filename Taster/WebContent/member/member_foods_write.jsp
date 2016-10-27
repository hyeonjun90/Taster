<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ĵ��� ������</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
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
		font-size: 11px;
		font-family : 'NanumGothic';
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

var checkNum=0;

function joinConf(){
	var form = document.joinForm;
	
	if(form.r_shop_name.value == ""){
		alert("�Ĵ� �̸��� �Է����ּ���.");
		return;
	}
	if(form.shop_phone1.value =="" || form.shop_phone2.value ==""||form.shop_phone3.value==""){
		alert("�Ĵ� ��ȭ��ȣ�� �Է��� �ּ���.");
		return;
	}
	if(form.r_shop_price.value ==""){
		alert=("���ݴ븦 �Է����ּ���.");
		return;
	}
	
	if(form.r_shop_addr.value =="" || form.r_shop_addr4.value ==""){
		alert=("�ּҸ� �Է��� �ּ���");
		return;
	}
	
	if(form.r_shop_kind.value ==""){
		alert("������ �������ּ���.");
		return;
	}
	
	form.r_shop_tel.value = ""+form.shop_phone1.value + form.shop_phone2.value + form.shop_phone3.value;
	
	form.submit();
}

function radioCheck(){

	var form = document.joinForm;
	
	for(var i=0; i<form.r_shop_kind.length; i++){
		if(r_shop_kind[i].checked == true){
			r_shop_kind[i].value;
		}
	}
}

function openZipcode(){
	var url="shopZipcode.action";
	open(url, "toolbar=no,location=no,"
			+"status=no,menubar=no,"
			+"scrollbars=yes,resizable=no,"
			+"width=610,height=400");
}
</script>
</head>

<body>
<div class="top_module"></div>
<center>
<div id="joinDiv">
<div><strong>�Ĵ� ���</strong></div>

<form method="post" action="memberFoodWriteOk.action" name="joinForm" enctype="multipart/form-data">

<input type="hidden" name="r_shop_addr1" id="r_shop_addr1"/>
<input type="hidden" name="r_shop_addr2" id="r_shop_addr2"/>
<input type="hidden" name="r_shop_addr3" id="r_shop_addr3"/>
<input type="hidden" name=" r_shop_tel" id="r_shop_tel"/>

<table id="joinTable">
	<tr>
		<th>�Ĵ� �̸�</th>
		<td>
			<input type="text" name="r_shop_name" id="r_shop_name"/>
		</td>
	</tr>
	<tr>
		<th>��ȭ��ȣ</th>
		<td>
			<input type="text" name="shop_phone1" id="shop_phone1" size="10"/>
			- <input type="text" name="shop_phone2" id="shop_phone2" size="10"/>
			- <input type="text" name="shop_phone3" id="shop_phone3" size="10"/>
			<font>(��:02-000-0000)</font>
		</td>
	</tr>
	<tr>
		<th>���ݴ�</th>
		<td>
			<input type="text" name="r_shop_price" id="r_shop_price" size="10"/>����
		</td>
	</tr>
	<tr>
		<th>����</th>
		<td>
			<input type="text" name="r_shop_holiday" id="r_shop_holiday" size="10"/>����(��:��)
		</td>
	</tr>
	<tr>
		<th>����</th>
		<td>
			<input type="radio" name="r_shop_kind" value="�ѽ�">�ѽ�
			<input type="radio" name="r_shop_kind" value="���">���
			<input type="radio" name="r_shop_kind" value="�߽�">�Ͻ�
			<input type="radio" name="r_shop_kind" value="�Ͻ�">�߽�
			<input type="radio" name="r_shop_kind" value="�±�">�н�
			<input type="radio" name="r_shop_kind" value="����">�ػ깰
			<input type="radio" name="r_shop_kind" value="ġŲ">ġŲ
			<input type="radio" name="r_shop_kind" value="ġŲ">�ַ�
			<input type="radio" name="r_shop_kind" value="ġŲ">����
			<input type="radio" name="r_shop_kind" value="ġŲ">����
			<input type="radio" name="r_shop_kind" value="ġŲ">ī��
			<input type="radio" name="r_shop_kind" value="ġŲ">�̻�
		</td>
	</tr>
	<tr>
		<th style="background-image: url('/Taster/images/bg_01.gif');">�Ĵ���ġ</th>
		<td>
			<input type="text" name="r_shop_addr" id="r_shop_addr" class="zipcode" size="50" onclick="openZipcode();"/>
			<img src="/Taster/images/bt_zipcode.gif" alt="" onclick="openZipcode();" /> <br />
			<input type="text" name="r_shop_addr4" id="r_shop_addr4" class="zipcode" size="50"/>
		</td>
	</tr>
	<tr>
		<th>����</th>
		<td>
			<textarea name="r_shop_content" id="r_shop_content" row="20" cols="50" style="font-size:11px;"></textarea>
		</td>
	</tr>
	<tr>
		<th>�������</th>
		<td style="heght:30px; font-size:10px;">
			<input type="file" name="upload" id="r_shop_image"  style="height:22px;font-size:10px;"/>
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center" style="height:50px;border:1px solid white;">
		<img src="/Taster/images/bt_ok.gif" alt="" style="margin-right:10px;" onclick="joinConf();"/>
		<img src="/Taster/images/bt_cancel.gif" alt="" onclick="javascript:if(confirm('�ۼ��� ������ �ʱ�ȭ �˴ϴ�. ����Ͻðڽ��ϱ�?')){location.href='memberMypage.action'}" /> 
		</td>
	</tr>

</table>
</form>
</div>
</body>