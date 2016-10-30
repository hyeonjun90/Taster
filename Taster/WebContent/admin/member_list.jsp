<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 관리</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
<style>
	.minfo {
		font-size:11px;
		font-family: NanumGothic;
	}
</style>
<script>
	function deleteMember(member_id) {
		if(confirm("해당 회원을 삭제하시겠습니까?")) {
			document.deleteForm.member_id.value = member_id;
			document.deleteForm.submit();
		}
	}
</script>
</head>
<body>
<form name="deleteForm" action="deleteMemberAction.action" method="post">
	<input type="hidden" name="member_id" value=""/>
</form>
<div style="width:1100px; margin:30px auto; ">
	
	<table width="1100" border="0" cellspacing="0" cellpadding="0">
		<tr  align="center" bgcolor="#FF895A" height="10">
				<td width="130" height="30px" bgcolor="#FF9D62"><font color="white" size="2"><strong>아이디</strong></font></td>
				<td width="130" height="35px"><font color="white" size="2"><strong>닉네임</strong></font></td>
				<td width="130" height="35px" ><font color="white" size="2"><strong>이름</strong></font></td>
				<td width="150" height="35px"><font color="white" size="2"><strong>휴대폰</strong></font></td>
				<td width="300" height="35px"><font color="white" size="2"><strong>주소</strong></font></td>
				<td width="300" height="35px"><font color="white" size="2"><strong>이메일</strong></font></td>
				<td width="150" height="35px"><font color="white" size="2"><strong>가입일</strong></font></td>
				<td width="80"><font color="white" size="2"><strong>삭제</strong></font></td>
		</tr>
		
		<tr>
				<td colspan="8"><hr /></td>
		</tr>
	
	<s:iterator value="memberList" status="stat">
	
		<!-- 글제목 클릭시 상세보기 페이지로 넘어가는 액션 -->
		<s:url id="viewURL" action="qboardViewForm">
			<s:param name="member_id">
				<s:property value="member_id" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
	
		<tr align="center">
			
			<td class="minfo" align="center" bgcolor= "#f3f3f3"><s:property value="member_id" /></td>
			<td class="minfo" align="center"><s:property value="member_nicname" /></td>
			<td class="minfo" align="center"><s:property value="member_name" /></td>
			<td class="minfo" align="center"><s:property value="member_phone" /></td>
			<td class="minfo" align="center"><s:property value="member_addr" /></td>
			<td class="minfo" align="center"><s:property value="member_email" /></td>
			<td class="minfo" align="center"><s:property value="member_joinDate" /></td>
			<td class="minfo" align="center">
				<input type="button" value="강퇴" onclick="deleteMember('<s:property value="member_id" />');" />
			</td>
		</tr>

		<tr>
			<td colspan="8"><hr/></td>
		</tr>

	</s:iterator>

	<!-- 게시물 없을때 -->
	<s:if test="list.size() <= 0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="8" align="center">등록된 회원이 없습니다</td>
		</tr>
		
		<tr bgcolor="#777777">
					<td height="1" colspan="1"></td>
		</tr>
	</s:if>

	<tr align="center">
		<td colspan="8"><s:property value="pagingHtml" escape="false" /></td>
	</tr>



</table>

</div>
</body>
</html>