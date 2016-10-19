<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당등록 페이지</title>
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
	var form = document.joinFrom;
	
	if(form.shop_name.value == ""){
		alert("식당 이름을 입력해주세요.");
		return;
	}
	if(form.shop_phone1.value =="" || form.phone2.value ==""||form.phone3.value==""){
		alert("식당 정화번호를 입력해 주세요.");
		return;
	}
	if(form.shop_price.value ==""){
		alert=("가격대를 입력해주세요.");
	}
	if(form.chk_info.value==""){
		alert=("업종을 선택해주세요.");
	}
	if(form.shop_adrr.value=="" || form.shop_addr4.value==""){
		alert=("주소를 입력해 주세요");
	}
	
}

function setShopPhone(){
	var shop_phone=""+shop_phone1+" "+shop_phone2+" "+shop_phone3;
	
	document.joinForm.shop_phone = shop_phone;
	
	document.joinForm.shop_phone.submit();
	
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
<div><strong>식당 등록</strong></div>

<form method="post" action="shopAdd.action" name="joinForm">

<input type="hidden" name="shop_addr1"/>
<input type="hidden" name="shop_addr2"/>
<input type="hidden" name="shop_addr3"/>
<input type="hidden" name="shop_addr4"/>

<input type="hidden" name="shop_phon" />

<table id="joinTable">
	<tr>
		<th>식당 이름</th>
		<td>
			<input type="text" name="shop_name" id="shop_name"/>
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
			<input type="text" name="shop_phone1" id="shop_phone1" size="10"/>
			- <input type="text" name="shop_phone2" id="shop_phone2" size="10"/>
			- <input type="text" name="shop_phone3" id="shop_phone3" size="10"/>
			<font>(예:02-000-0000)</font>
		</td>
	</tr>
	<tr>
		<th>가격대</th>
		<td>
			<input type="text" name="shop_price" id="shop_price" size="10"/>만원
		</td>
	</tr>
	<tr>
		<th>업종</th>
		<td>
			<input type="checkbox" name="chk_info1" id="chk_info1" value="한식">한식
			<input type="checkbox" name="chk_info2" id="chk_info2" value="양식">양식
			<input type="checkbox" name="chk_info3" id="chk_info3" value="중식">중식
			<input type="checkbox" name="chk_info4" id"chk_info4" value="일식">일식
			<input type="checkbox" name="chk_info5" id="chk_info5" value="고기(소/돼지)">고기(소/돼지)
			<input type="checkbox" name="chk_info6" id="chk_info6" value="치킨">치킨
		</td>
	</tr>
	<tr>
		<th style="background-image: url('/Taster/images/bg_01.gif');">식당위치</th>
		<td>
			<input type="text" name="shop_addr" id="shop_addr" class="zipcode" size="50" onclick="openZipcode();"/>
			<img src="/Taster/images/bt_zipcode.gif" alt="" onclick="openZipcode();" /> <br />
			<input type="text" name="shop_addr4" id="shop_addr4" class="zipcode" size="50"/>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="shop_content" id="shop_content" row="20" cols="50"></textarea>
		</td>
	</tr>
	<tr>
		<th>사진등록</th>
		<td style="heght:30px; font-size:10px;">
			<input type="file" name="shop_image" id="shop_image"  style="height:22px;font-size:10px;"/>
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
</body>