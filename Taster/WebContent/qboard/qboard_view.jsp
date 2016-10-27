<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의 게시판</title>
<link rel="stylesheet" href="/struts2_board/board/common/css/css.css" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");
		
	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>문의 게시판</h2></td>
	</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td width="100">번호</td>
			<td width="500">
				<s:property value="resultClass.b_idx" />
			</td>
		</tr>
		<tr>
			<td width="100">제목</td>
			<td width="500">
				<s:property value="resultClass.b_title" />
			</td>
		</tr>
		<tr>
			<td width="100">닉네임</td>
			<td width="500">
				<s:property value="resultClass.member_nicname" />
			</td>
		</tr>
		
		<tr>
			<td width="100">내용</td>
			<td width="500">
				${resultClass.b_content }
			</td>
		</tr>
		<tr>
			<td width="100">조회수</td>
			<td width="500">
				<s:property value="resultClass.b_readCount" />
			</td>
		</tr>
		<tr>
			<td width="100">등록날짜</td>
			<td width="500">
				<s:property value="resultClass.b_regdate" />
			</td>
		</tr>
		
		
	<!--  
		<tr>
			<td width="100">첨부파일</td>
			<td width="500">
				&nbsp;&nbsp;
				<s:url id="download" action="fileDownloadAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				
				<s:a href="%{download}">
					<s:property value="resultClass.file_orgname" />
				</s:a>
			</td>
		</tr>
-->

	<!-- 관리자에게만   상세보기에서 코멘트메뉴가 생김. -->
	<c:if test="${session.member_level == 3}">
    
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				<form action="AdminComment.action" method="post">
					<table>
						<tr>
							<td width="170">
							
								<!-- 닉네임 수정 불가능하게 읽기전용 처리 -->
								<input type="text" value="관리자" readonly style="text-align:center; border:0px;"/>
								
								<!--  <input type="text" value="${session.nicname}" name="member_nicname" cssStyle="width:100px" maxlength="20"/>-->
								<!-- 비밀번호 <s:textfield name="c_pwd" theme="simple" value="" cssStyle="width:100px" maxlength="20" /> -->
							</td>

					<!-- 상세보기 페이지에서 숨겨져 있는 값들: 글번호 댓글번호 멤버ID, 현재페이지번호 -->
							<s:hidden name="b_idx" value="%{resultClass.b_idx}" />
							<s:hidden name="member_id" value="%{resultClass.member_id}" />							
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<s:hidden name="c_idx" value="%{resultClass.c_idx}" />
							<s:hidden name="currentPage" value="%{currentPage}" />
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!수정!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<td align="left">
								<s:textarea name="c_content" theme="simple" value="" cols="60" rows="3" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input name="submit" type="submit" value="작성완료" class="inputb">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</c:if>	
		
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
	
	 <!-- 댓글 관련 -->
		<s:iterator value="commentlist" status="stat">
		<tr>
			<td height="10" width="130" align="center">
			
				<input type="text" value="관리자" readonly style="text-align:center; border:0px;"/>
			
				<!-- 관리자 ID값 -->
				<s:hidden name="member_id" value="%{resultClass.member_id}" />
			<br>			
				<s:property value="c_regdate" /><br><br>
			</td>
			<td>
			<!-- @@@@@@@@@@@@코멘트 삭제@@@@@@@@@@@@ -->
				<s:property value="c_content" /> 
				<a href="javascript:open_win_noresizable('idCheck2.action?c_idx=<s:property value="c_idx" />&b_idx=<s:property value="b_idx" />&currentPage=<s:property value="currentPage" />','cdelete')">x</a>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		</s:iterator>
		<tr>
			<td colspan="2" height="10">
				<s:if test="commentlist.size() <= 0">
				댓글없음
			</td>
		</tr>
				</s:if>	
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
	
	
		<tr>
			<td colspan="2" align="right">
				<s:url id="modifyURL" action="qModifyForm">
					<s:param name="b_idx">
						<s:property value="b_idx" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="qDeletePro">
					<s:param name="b_idx">
						<s:property value="b_idx" />
					</s:param>
				</s:url>
				
				<!-- 글수정,글삭제,목록 버튼, 수정/삭제 버튼을 누르면  qboard.xml에 정의해놓은 idCheck액션을 통해 QBoardViewAction.java내  idCheck메소드가 동작한다. idCheck메소드에서 ID가 다르면qboard_check_error페이지(수정/삭제 불가 창)를 띄웠다가 종료하며 ID가 일치하면 qboard_check_success.jsp(수정/삭제 가능)창을 띄웠다가 종료한다..-->
				<!--<input name="list" type="button" value="답변달기" class="inputb" onClick="javascript:location.href='replyForm.action?no=<s:property value="no" />'"> -->
				<input name="list" type="button" value="수정" class="inputb" onClick="javascript:open_win_noresizable('idCheck.action?member_id=<s:property value="resultClass.member_id" />&b_idx=<s:property value="resultClass.b_idx" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="list" type="button" value="삭제" class="inputb" onClick="javascript:open_win_noresizable('idCheck.action?member_id=<s:property value="resultClass.member_id" />&b_idx=<s:property value="resultClass.b_idx" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='qboardList.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
	</table>
</body>
</html>