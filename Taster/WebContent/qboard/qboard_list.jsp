<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Խ���</title>
<link rel="stylesheet" href="/Taster/qboard/css.css" type="text/css">
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>���� �Խ���</h2></td>
		</tr>
	</table>
	
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#f3f3f3">
			<td width="30"><strong>��ȣ</strong></td>
			<td width="300"><strong>����</strong></td>
			<td width="70"><strong>�۾���</strong></td>
			<td width="50"><strong>��¥</strong></td>
			<td width="30"><strong>��ȸ</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

	<s:iterator value="list" status="stat">
		<s:url id="viewURL" action="qboardViewForm">
			<s:param name="b_idx">
				<s:property value="b_idx" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
	
		<tr>
			<!-- �� ��ȣ -->
			<td><s:property value="b_idx" /></td>
				<td align="center">
				<!--				  
				<s:if test="re_level != 0">
					<c:forEach var = "i" begin = "${re_level}" end = "0">&nbsp;</c:forEach>��
				</s:if>
				-->
				
				
			<!-- �� ���� -->
 				<s:a href="%{viewURL}"><s:property value="b_title" /></s:a>
 			</td>
			<td><s:property value="member_id" /></td>
			<td><s:property value="b_regdate" /></td>
			<td><s:property value="b_readCount" /></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

	</s:iterator>

	<!-- �Խù� ������ -->
	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="5" align="center">��ϵ� �Խù��� �����ϴ�</td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>

	<!-- �۾��� ��ư -->
	<tr align="right">
		<td colspan="5">
			<input type="button" value="�۾���" class="inputb" onClick="javascript:location.href='qWriteForm.action?currentPage=<s:property value="currentPage" />';" />
		</td>
	</tr>


	<!-- �˻��޴� -->
	<tr align="center">
		<td colspan="5">
			<form>
				<select name="searchNum" >
					<option value="0">�ۼ���</option>
					<option value="1">����</option>
					<!--<option value="2">����</option>-->
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="�˻�" class="inputb">
			</form>
		</td>
	</tr>
</table>
</body>
</html>