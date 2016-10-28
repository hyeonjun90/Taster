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
<title>문의 게시판</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
</head>
<body>

<div style="width:800px; margin:30px auto; ">
	
	<table width="800" border="0" cellspacing="0" cellpadding="0">
		<tr  align="center" bgcolor="#FF895A" height="10">
				<td width="90" height="30px" bgcolor="#FF9D62"><font color="white" size="2"><strong>번호</strong></font></td>
				<td width="390" height="35px"><font color="white" size="2"><strong>제목</strong></font></td>
				<td width="110" height="35px" ><font color="white" size="2"><strong>닉네임</strong></font></td>
				<td width="120" height="35px"><font color="white" size="2"><strong>날짜</strong></font></td>
				<td width="90" height="35px"><font color="white" size="2"><strong>조회</strong></font></td>
		</tr>
		
		<tr>
				<td colspan="5"><hr /></td>
		</tr>
	
	<s:iterator value="list" status="stat">
	
		<!-- 글제목 클릭시 상세보기 페이지로 넘어가는 액션 -->
		<s:url id="viewURL" action="qboardViewForm">
			<s:param name="b_idx">
				<s:property value="b_idx" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
	
		<tr align="center">
			<!-- 글 번호 -->
			<td align="center" bgcolor= "#f3f3f3"><s:property value="b_idx" /></td>
			<td align="center">
				<!--				  
				<s:if test="re_level != 0">
					<c:forEach var = "i" begin = "${re_level}" end = "0">&nbsp;</c:forEach>→
				</s:if>
				-->
				
				
			<!-- 글 제목 -->
				<!-- 위의 viewURL 참조 -->
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

	<!-- 게시물 없을때 -->
	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
		</tr>
		
		<tr bgcolor="#777777">
					<td height="1" colspan="1"></td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>

<!-- 비회원의 경우 문의게시판 글쓰기 버튼이 안보임 -->
<c:if test="${session.member_level != null}">
	<!-- 글쓰기 버튼 -->
	<tr align="right">
		<td colspan="5">
			<input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='qWriteForm.action?currentPage=<s:property value="currentPage" />';" />
		</td>
	</tr>
</c:if>	


	<!-- 검색메뉴 -->
	<tr align="center">
		<td colspan="5">
			<form>
			
				<!-- 이 searchNum값이 QBoardListAction.java에서 조건에 맞게 수행됨. -->
				<select name="searchNum" >
					<option value="1">닉네임</option>
					<option value="2">제목</option>
					<option value="3">내용</option>
				</select>
				
				<!-- 이 값이 QPagingAction에서 처리됨. -->
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb">
			</form>
		</td>
	</tr>
</table>

</div>
</body>
</html>