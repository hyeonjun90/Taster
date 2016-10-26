<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>문의 게시판</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>문의 게시판</h2></td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#f3f3f3">
			<td width="30" align="center"><strong>번호</strong></td>
			<td width="300" align="center"><strong>제목</strong></td>
			<td width="70" align="center"><strong>닉네임</strong></td>
			<td width="50" align="center"><strong>날짜</strong></td>
			<td width="30" align="center"><strong>조회</strong></td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
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
	
		<tr>
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

		<tr bgcolor="#777777">
			<td height="1" colspan="5"></td>
		</tr>

	</s:iterator>

	<!-- 게시물 없을때 -->
	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
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
</body>
</html>