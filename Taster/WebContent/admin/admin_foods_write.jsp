<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ĵ� ��� �Խ���</title>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>�Ĵ��� �Խ���</h2></td>
		</tr>
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0">
	
		<tr>
			<td align="right" colspan="2">
				<font color="#FF0000">*</font>�� �ʼ� �Է� ����.
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>

		</tr>
	</table>
	
<br>


<s:form action="admin_foods_write" theme="simple">
		<tr>
			<td width="100">
				<font color="#FF0000">*</font> �Ĵ��̸�:
			</td>
			<td width="500">
				<s:textfield name="shop_name" theme="simple"  cssStyle="width:370px"/>
			</td>
		</tr>
		<br>
       <tr>
		<td width="100">
				<font color="#FF0000">*</font> ��ȭ��ȣ:
			</td>
			<td width="500">
				<s:textfield name="shop_tel" theme="simple"  cssStyle="width:370px" />
			</td>
		</tr>
		<br>
		<tr>
		<td width="100">
				<font color="#FF0000">*</font> ���ݴ�:
			</td>
			<td width="500">
			&nbsp;&nbsp;&nbsp;<s:textfield name="shop_price" theme="simple"  cssStyle="width:370px"  />
			</td>
		</tr>
		<br>
		<td width="100">
				<font color="#FF0000">*</font> �ּ�:
			</td>
			<td width="500">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <s:textfield name="shop_addr" theme="simple"  cssStyle="width:370px"  />
			
			</td>
		</tr>
		<br>
		<input type="radio" name="korean" value="�ѽ�"> �ѽ� 
	    &nbsp;
		
		<input type="radio" name="korean" value="�߽�"> �߽�
	    &nbsp;
		
		<input type="radio" name="korean" value="���"> ��� 
	    &nbsp;
		<br>
		<s:submit value="����ϱ�" align="center" />
		</s:form>
		
		
		
		
		


	    
		
</body>
</html>