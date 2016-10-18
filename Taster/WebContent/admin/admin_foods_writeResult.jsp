<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>등록한 식당 보기</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>식당등록 게시판</h2></td>
		</tr>
</table>


	
<br>
<table width="300" height="20" border="1"> 

<tr>
<td width="100">식당 이름: </td>
<td>${shop_name}</td>
</tr>


<tr>
<td width="100">전화번호:</td>
<td>${shop_tel}</td>
</tr>

<tr>
<td width="100" >가격:</td>
<td>${shop_price}</td>
</tr>

<tr>
<td width="100">주소:</td>
<td>${shop_addr1}</td>
</tr>


<tr>
<td width="100">업종:</td>
<td>${shop_kind}</td>
</tr>

<tr>
<td width="100">신규:</td>
<td>${shop_new}</td>
</tr>

<tr>
<td width="100">휴일:</td>
<td>${shop_holiday}</td>
</tr>

<tr>
<td width="100">조회수:</td>
<td>${shop_readCount}</td>
</tr>

</table>

<s:submit align="center" value="목록보기"/>

</body>

</html>












