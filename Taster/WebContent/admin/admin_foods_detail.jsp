<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������</title>


</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>��õ����Ʈ �󼼺���</h2></td>
		</tr>
		
		<tr>
			<td height="20"></td>
		</tr>

	</table>
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> �Ĵ� �̸�</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.shop_name"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> ��ȭ��ȣ</Td>   
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.shop_tel"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> ����</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.shop_price"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> ����</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.shop_kind"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> �ּ� </td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.shop_addr1 + '  ' + resultClass.shop_addr2 + '  ' + resultClass.shop_addr3 + resultClass.shop_addr4"/></td>
			
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ���� </td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.shop_holiday"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ��ȸ��</td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp;<s:property value="resultClass.shop_readCount"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ÷������</td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp;<s:property value="resultClass.file_orgname"/></td>
		</tr>
        
       
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
 	</table>
<input name="list" align="right" type="button" value="��Ϻ���" class="inputb" onClick="javascript:location.href='AshoplistAction.action?currentPage=<s:property value="currentPage" />'">

<input name="list" type="button" value="�����ϱ�" class="inputb" onClick="javascript:location.href='AshopDeleteAction.action?shop_idx=<s:property value="resultClass.shop_idx" />&currentPage=<s:property value="currentPage" />'">
<input name="list" type="button" value="�����ϱ�" class="inputb" onClick="javascript:location.href='AshopModifyAction.action?shop_idx=<s:property value="resultClass.shop_idx" />&currentPage=<s:property value="currentPage" />'">








</body>
</html>