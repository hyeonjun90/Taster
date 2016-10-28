<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style type="text/css">
a:link, a:visited, a:hover, a:active {
	font-size: 10pt;
	color: black;
	text-decoration: none;
}
</style>
<style>
	.joinDiv{
		width:750px; border-bottom:3px solid #f0f0f0;
		text-align: left; padding: 10px;
		font-size: 14px; font-family : 'Noto Sans', sans-serif;
	}
</style>
<title>���� �Խ���</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
</head>
<body>

<div style="width:800px; margin:30px auto; ">
	
	<table width="800" border="0" cellspacing="0" cellpadding="0">
		<tr  align="center" bgcolor="#FF895A" height="10">
				<td width="90" height="30px" bgcolor="#FF9D62"><font color="white" size="2"><strong>��ȣ</strong></font></td>
				<td width="390" height="35px"><font color="white" size="2"><strong>����</strong></font></td>
				<td width="110" height="35px" ><font color="white" size="2"><strong>�г���</strong></font></td>
				<td width="120" height="35px"><font color="white" size="2"><strong>��¥</strong></font></td>
				<td width="90" height="35px"><font color="white" size="2"><strong>��ȸ</strong></font></td>
		</tr>
		
		<tr>
				<td colspan="5"><hr /></td>
		</tr>
	
	<s:iterator value="list" status="stat">
	
		<!-- ������ Ŭ���� �󼼺��� �������� �Ѿ�� �׼� -->
		<s:url id="viewURL" action="qboardViewForm">
			<s:param name="b_idx">
				<s:property value="b_idx" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
	
		<tr align="center">
			<!-- �� ��ȣ -->
			<td align="center" bgcolor= "#f3f3f3"><s:property value="b_idx" /></td>
			<td align="center">
				<!--				  
				<s:if test="re_level != 0">
					<c:forEach var = "i" begin = "${re_level}" end = "0">&nbsp;</c:forEach>��
				</s:if>
				-->
				
				
			<!-- �� ���� -->
				<!-- ���� viewURL ���� -->
 				<s:a href="%{viewURL}"><s:property value="b_title" /></s:a>
 			</td>
			<td align="center"><s:property value="member_nicname" /></td>
			<td align="center"><s:property value="b_regdate" /></td>
			<td align="center"><s:property value="b_readCount" /></td>
		</tr>

		<tr>
			<td colspan="5"><hr/></td>
		</tr>

	</s:iterator>

	<!-- �Խù� ������ -->
	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="5" align="center">��ϵ� �Խù��� �����ϴ�</td>
		</tr>
		
		<tr bgcolor="#777777">
					<td height="1" colspan="1"></td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>

<!-- ��ȸ���� ��� ���ǰԽ��� �۾��� ��ư�� �Ⱥ��� -->
<c:if test="${session.member_level != null}">
	<!-- �۾��� ��ư -->
	<tr align="right">
		<td colspan="5">
			<input type="button" value="�۾���" class="inputb" onClick="javascript:location.href='qWriteForm.action?currentPage=<s:property value="currentPage" />';" />
		</td>
	</tr>
</c:if>	


	<!-- �˻��޴� -->
	<tr align="center">
		<td colspan="5">
			<form>
			
				<!-- �� searchNum���� QBoardListAction.java���� ���ǿ� �°� �����. -->
				<select name="searchNum" >
					<option value="1">�г���</option>
					<option value="2">����</option>
					<option value="3">����</option>
				</select>
				
				<!-- �� ���� QPagingAction���� ó����. -->
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="�˻�" class="inputb">
			</form>
		</td>
	</tr>
</table>

</div>
</body>
</html>