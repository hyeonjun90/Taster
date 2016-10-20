<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당 등록 게시판</title>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="right"><h2>식당등록 게시판</h2></td>
		</tr>
</table>


<s:form action="AshopWriteAction" theme="simple">
		<tr>
			<td align="center" width="100">
				<font color="#FF0000">*</font> 식당이름:
				<s:textfield name="shop_name" theme="simple" value="%{resultClass.shop_name}" cssStyle="width:370px"/>
			</td>
			
		</tr> 
		
		<br>
       <tr>
		<td align="center" width="100">
				<font color="#FF0000">*</font> 전화번호:
				<s:textfield name="shop_tel" theme="simple"  value="%{resultClass.shop_tel}" cssStyle="width:370px" />
			</td>
			
		</tr>
		<br>
		<tr>
		<td align="center"  width="100">
				<font color="#FF0000">*</font> 가 격 대:
				&nbsp;<s:textfield name="shop_price" theme="simple" value="%{resultClass.shop_price}"   cssStyle="width:370px"  />
			</td>
			
		</tr>
		<!--  
		  <br>
		<tr>
		<td width="100">
				<font color="#FF0000">*</font> 주소:
			</td>
			<td width="500">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:textfield name="shop_addr1" theme="simple" value="%{resultClass.shop_addr1}" cssStyle="width:370px"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:textfield name="shop_addr2" theme="simple" value="%{resultClass.shop_addr2}" cssStyle="width:370px"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:textfield name="shop_addr3" theme="simple" value="%{resultClass.shop_addr3}" cssStyle="width:370px"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:textfield name="shop_addr4" theme="simple" value="%{resultClass.shop_addr4}" cssStyle="width:370px"/>
			
			</td>
			
		</tr>
		-->
		
		<br>
		<tr>
		<td align="center" width="100">
				<font color="#FF0000">*</font> 휴   일:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="shop_holiday" theme="simple" value="%{resultClass.shop_holiday}"  cssStyle="width:370px"  />
			</td>
			
		</tr>
		
		<br>
		<tr>
		<td  align="center" width="100">
				<font color="#FF0000">*</font> 신   규:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="shop_new" theme="simple" value="%{resultClass.shop_new}"  cssStyle="width:370px"  />
			</td>
		
		</tr>
		
		<br>
		<tr>
		<td  align="center" width="100">
				<font color="#FF0000">*</font> 조 회 수:
				&nbsp;<s:textfield name="shop_readCount" theme="simple" value="%{resultClass.shop_readCount}"  cssStyle="width:370px"  />
			</td>
			
		</tr>
		<tr>
			<td align="center" colspan="2">
			 <input type="radio" name="shop_kind" value="한식"> 한식 
		    &nbsp;
			
			<input type="radio" name="shop_kind" value="중식"> 중식
		    &nbsp;
			
			<input type="radio" name="shop_kind" value="양식"> 양식 
		    &nbsp;
			<br>
			<s:submit value="등록하기" align="center" />
			</td>
		</tr>
		</s:form>
	  
</body>
</html>