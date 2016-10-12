<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ĵ� ��� �Խ���</title>

<script type="text/javascript">
	function validation() {
		
			var frm = document.forms(0);
			
			if(frm.shop_name.value == "") {
				alert("�Ĵ��̸��� �Է����ּ���.");
				return false;
			} 
			
			else if(frm.shop_price.value == "") {
				alert("���ݴ� �Է����ּ���.");
				return false;
				
			}
			
			else if(frm.shop_tel.value == "") {
				alert("��ȭ��ȣ�� �Է����ּ���.");
				return false;
			}
			
			else if(frm.shop_addr1 + shop_addr2 + shop_addr3 + shop_addr4 .value == "") {
				alert("�ּ��� �Է����ּ���.");
				return false;			
			} 
			
			return true;
		}
</script>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>�Ĵ��� �Խ���</h2></td>
		</tr>
	</table>
	
	<s:if test="reply">
		<form action="replyAction.action" method="post" name="frm" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_level" value="%{resultClass.re_level}" />
			<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:if>
	
	<s:elseif test="resultClass == NULL">
		<form action="writeAction.action" method="post" name="frm" enctype="multipart/form-data" onsubmit="return validation();">
	</s:elseif>
	
	<s:else>
		<form action="modifyAction.action" method="post" name="frm" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="no" value="%{resultClass.no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.file_savname}" />
	</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
	
		<tr>
			<td align="right" colspan="2">
				<font color="#FF0000">*</font>�� �ʼ� �Է� ����.
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>

		</tr>
		
		
		
		<tr>
			<td width="100">
				<font color="#FF0000">*</font> �Ĵ��̸�
			</td>
			<td width="500">
				<s:textfield name="shop_name" theme="simple" value="%{resultClass.shop_name}" cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>
		<td width="100">
				<font color="#FF0000">*</font> ��ȭ��ȣ
			</td>
			<td width="500">
				<s:textfield name="shop_tel" theme="simple" value="%{resultClass.shop_tel}" cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>
		<td width="100">
				<font color="#FF0000">*</font> ���ݴ�
			</td>
			<td width="500">
				<s:textfield name="shop_price" theme="simple" value="%{resultClass.shop_price}" cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>
		<td width="100">
				<font color="#FF0000">*</font> �ּ�
			</td>
			<td width="500">
				<s:textfield name="shop_addr1 + shop_addr2 + shop_addr3 + shop_addr4" theme="simple" value="%{resultClass.shop_addr1 + shop_addr2 + shop_addr3 + shop_addr4}" cssStyle="width:370px" maxlength="50" />
				<input name="submit" type="submit" value="�ּҺ���" class="inputb">
			</td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
				<font color="#FF0000">
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
			</tr>
		
		<tr>
			<td align="right" colspan="2">
				<br/><input name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>