<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������������Դϴ�.</title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css" type="text/css">
<script type="text/javascript">
	function open_win_noresizable (url, name) {
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");		
	}
</script>

</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>�űԵ�� ��û ���</h2></td>
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
			<Td bgcolor="#F4F4F4"> ��ȣ</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.r_idx"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> �ۼ���</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.r_regdate"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> ID</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.r_id"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> �г���</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.r_nicname"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> �����̸�</td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.r_shop_name"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		
		
		
		
		<tr>
			<td bgcolor="#F4F4F4"> ��ȭ��ȣ </td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.r_shop_tel"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ����</td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp;<s:property value="resultClass.r_shop_kind"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="100" bgcolor="#F4F4F4"> �ּ�</td>
			<td width="500" bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value='"resultClass.r_shop_addr1 "+"resultClass.r_shop_addr2 "+"resultClass.r_shop_addr3 "+"resultClass.r_shop_addr4 "'/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ���ݴ�</td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.r_shop_price"/></td>
		</tr>
	
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ����</td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.r_shop_holiday"/></td>
		</tr>
	
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"> ����</td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; <s:property value="resultClass.r_shop_content"/></td>
		</tr>
	
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<%-- <tr>
			<td bgcolor="#F4F4F4"> ÷������</td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; 
			
			<s:url id="download" action="fileDownloadAction">
			<s:param name="no">
				<s:property value="no"/>
			</s:param>
			</s:url>
			
			<s:a href="%{download}"><s:property value="resultClass.file_orgname"/></s:a>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr> --%>
		
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
				<s:url id="modifyURL" action="modifyForm">
					<s:param name="no">
						<s:property value="no"/>
					</s:param>
				</s:url>
				
			<input type="button" value="�����ϱ�" class="inputb" onClick="javascript:location.href='ApprovalRequestOk.action?currentpage=<s:property value="currentPage"/>';">
			<input type="button" value="�ź��ϱ�" class="inputb" onClick="javascript:location.href='ApprovalRequestNok.action?currentpage=<s:property value="currentPage"/>';">
			<input name="list" type="button" value=" �� �� " class="inputb" onClick="javascript:location.href='approvalRequestList.action?currentPage=<s:property value="currentPage"/>'">
 			</td>
 		</tr>
 	</table>

</body>
</html>