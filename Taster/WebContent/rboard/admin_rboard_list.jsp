<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자페이지입니다.</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css">
<style type="text/css">
a:link, a:visited, a:hover, a:active {
	font-size: 10pt;
	color: black;
	text-decoration: none;
}
.sInfo {
	font-size: 11px;
	font-family: NanumGothic;
}
</style>

</head>
<body>
	<table align="center" width="800" cellspacing="0" cellpadding="10">
	<tr>
		<td align="center"><h2>추천리스트 관리</h2></td>
	</tr>
	<tr>
	
	</table>
	
	<table align="center" width="800" border="0" cellspacing="0" cellpadding="2">
	<tr align="right" >
			<td colspan="9">
			<input type="button" value="새글 작성하기" class="inputb" onClick="javascript:location.href='rboardWriteForm.action?currentpage=<s:property value="currentPage"/>';">
			</td>
		</tr>
		
		<tr align="center"  bgcolor="#FF895A" height="10">
		
			<td width="30" height="30px"><font color="white" size="2"><strong>No</strong></td>
			<td width="50" height="35px"><font color="white" size="2"><strong>작성일</strong></td>
			<td width="200" height="35px"><font color="white" size="2"><strong>제목</strong></td>
			<td width="50" height="35px"><font color="white" size="2"><strong>첨부파일</strong></td>
			
		</tr>
		
		<tr>
			<td colspan="7"><hr/></td>
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
			
				<td><s:property value="rec_idx"/></td>
				<td align="center"><s:property value="rec_date"/></td>
				<td align="left">&nbsp;<s:a href="%{RecDetailViewURL}"><s:property value="rec_subject"/></s:a></td>
				<td align="center"><s:property value="rec_image"/></td>
			
			</tr>	
		
			<tr>
				<td colspan="7"><hr/></td>
			</tr>
		</s:iterator>
		
		<tr align="center">
			<td colspan="9"><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		
		<tr align="center">
			<td colspan="5">
				<form>
					<select name="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select>
					<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20"/>
					<input name="submit" type="submit" value="검 색" class="inputb">
				</form>
			</td>
		</tr>
		
		<s:if test="list.size()<=0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="9"><br/></td>
		</tr>
		</s:if>
		
		

	</table>




</body>
</html>