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
		<td align="center"><h2>추천리스트 관리</h2></td>
	</tr>
	<tr>
	
	</table>
	
	<table width="1000" border="1" cellspacing="1" cellpadding="2">
	<tr align="right">
			<td colspan="9">
			<input type="button" value="새글 작성하기" class="inputb" onClick="javascript:location.href='rboardWriteForm.action?currentpage=<s:property value="currentPage"/>';">
			</td>
		</tr>
		
		<tr align="center" bgcolor="#F3F3F3">
			<td width="30"><strong></strong></td>
			<td width="30"><strong>No</strong></td>
			<td width="50"><strong>작성일</strong></td>
			<td width="200"><strong>제목</strong></td>
			<td width="50"><strong>첨부파일</strong></td>
			<td width="20"><strong>수정</strong></td>
			<td width="20"><strong>삭제</strong></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="7"></td>
		</tr>
		
		<s:iterator value="list" status="stat">
		
		<s:url id="RecDetailViewURL" action="rboardDetailView">
			<s:param name="rec_idx">
				<s:property value="rec_idx"/>
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage"/>
			</s:param>
		</s:url> 
		
			<tr bgcolor="#FFFFFF" align="center">
				<td> 체크박스</td>
				<td><s:property value="rec_idx"/></td>
				<td align="center"><s:property value="rec_date"/></td>
				<td align="left">&nbsp;<s:a href="%{RecDetailViewURL}"><s:property value="rec_subject"/></s:a></td>
				<td align="center"><s:property value="rec_image"/></td>
				<td align="center"><s:property value="수정 버튼"/></td>
				<td align="center"><s:property value="삭제 버튼"/></td>
			</tr>
			
		
			<tr bgcolor="#777777">
				<td height="1" colspan="7"></td>
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
		
		<tr align="center">
			<td colspan="9"><s:property value="pagingHtml" escape="false"/></td>
		</tr>

	</table>

</body>
</html>