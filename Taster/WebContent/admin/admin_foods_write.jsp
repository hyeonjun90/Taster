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
			<td align="right"><h2>�Ĵ��� �Խ���</h2></td>
		</tr>
</table>


<s:form action="AshopWriteAction" theme="simple" enctype="multipart/form-data">
		<tr>
			<td align="center" width="100">
				<font color="#FF0000">*</font> �Ĵ��̸�:
				<s:textfield name="shop_name" theme="simple" value="%{resultClass.shop_name}" cssStyle="width:370px"/>
			</td>
			
		</tr> 
		
		<br>
       <tr>
		<td align="center" width="100">
				<font color="#FF0000">*</font> ��ȭ��ȣ:
				<s:textfield name="shop_tel" theme="simple"  value="%{resultClass.shop_tel}" cssStyle="width:370px" />
			</td>
			
		</tr>
		<br>
		<tr>
		<td align="center"  width="100">
				<font color="#FF0000">*</font> �� �� ��:
				&nbsp;<s:textfield name="shop_price" theme="simple" value="%{resultClass.shop_price}"   cssStyle="width:370px"  />
			</td>
			
		</tr>
		<!--  
		  <br>
		<tr>
		<td width="100">
				<font color="#FF0000">*</font> �ּ�:
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
				<font color="#FF0000">*</font> ��   ��:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="shop_holiday" theme="simple" value="%{resultClass.shop_holiday}"  cssStyle="width:370px"  />
			</td>
			
		</tr>
		
		<br>
		<tr>
		<td  align="center" width="100">
				<font color="#FF0000">*</font> ��   ��:
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="shop_new" theme="simple" value="%{resultClass.shop_new}"  cssStyle="width:370px"  />
			</td>
		
		</tr>
		
		<br>
		<tr>
		<td  align="center" width="100">
				<font color="#FF0000">*</font> �� ȸ ��:
				&nbsp;<s:textfield name="shop_readCount" theme="simple" value="%{resultClass.shop_readCount}"  cssStyle="width:370px"  />
			</td>
			
		</tr>
		<br>
		<br>
		
		<tr>
          <td bgcolor="#F4F4F4">  ÷������1 </td>
          <td bgcolor="#FFFFFF">
              <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
		&nbsp; * <s:property value="resultClass.file_orgname" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
	</s:if>
		</td>
		</tr>
		
		<br>
		<br>
		
		<tr>
          <td bgcolor="#F4F4F4">  ÷������2 </td>
          <td bgcolor="#FFFFFF">
              <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
		&nbsp; * <s:property value="resultClass.file_orgname" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
	</s:if>
		</td>
		</tr>
		
		<br>
		<br>
		
		<tr>
			<td align="center" colspan="2">
			 <input type="radio" name="shop_kind" value="�ѽ�"> �ѽ� 
		    &nbsp;
			
			<input type="radio" name="shop_kind" value="�߽�"> �߽�
		    &nbsp;
			
			<input type="radio" name="shop_kind" value="���"> ��� 
		    &nbsp;
			<br>
			<s:submit value="����ϱ�" align="center" />
			</td>
		</tr>
		</s:form>
	  
</body>
</html>