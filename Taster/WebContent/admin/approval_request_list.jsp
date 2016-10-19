<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자페이지입니다.</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css">
</head>
<body>
	<table width="1000" border="1" cellspacing="1" cellpadding="10">
	<tr>
		<td align="center"><h2>신규등록 요청 목록</h2></td>
	</tr>
	<tr>
	
	</table>
	
	<table width="1000" border="1" cellspacing="1" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="30"><strong></strong></td>
			<td width="30"><strong>No</strong></td>
			<td width="50"><strong>작성일</strong></td>
			<td width="50"><strong>아이디</strong></td>
			<td width="50"><strong>닉네임</strong></td>
			<td width="80"><strong>식당명</strong></td>
			<td width="80"><strong>업종</strong></td>
			<td width="200"><strong>식당위치</strong></td>
			<td width="80"><strong>가격대</strong></td>

		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="9"></td>
		</tr>
		
		<s:iterator value="list" status="stat">
		
		<s:url id="ReqDetailViewURL" action="approvalRequestDetailView">
			<s:param name="r_idx">
				<s:property value="r_idx"/>
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage"/>
			</s:param>
		</s:url> 
		
			<tr bgcolor="#FFFFFF" align="center">
				<td> 체크박스</td>
				<td><s:property value="r_idx"/></td>
				<td align="center"><s:property value="r_regdate"/></td>
				<td align="center"><s:property value="r_id"/></td>
				<td align="center"><s:property value="r_nicname"/></td>
				<td align="left"> &nbsp;<s:a href="%{ReqDetailViewURL}"><s:property value="r_shop_name"/></s:a></td>
				<td align="center"><s:property value="r_shop_kind"/></td>
				<td align="center"><s:property value='"r_shop_addr1"+"r_shop_addr2"'/></td>
				<td align="center"><s:property value="r_shop_price"/></td>

			</tr>
		
		
			<tr bgcolor="#777777">
				<td height="1" colspan="9"></td>
			</tr>
		</s:iterator>
		
		<s:if test="list.size()<=0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="9"></td>
		</tr>
		</s:if>
		
		<tr align="right">
			<td colspan="9">
			<input type="button" value="승인하기" class="inputb" onClick="javascript:location.href='ApprovalRequestOk.action?currentpage=<s:property value="currentPage"/>';">
			<input type="button" value="거부하기" class="inputb" onClick="javascript:location.href='ApprovalRequestNok.action?currentpage=<s:property value="currentPage"/>';">
			</td>
		</tr>
		
		<tr align="center">
			<td colspan="9"><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		

		
				
	</table>

</body>
</html>