<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자페이지입니다.</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css">

<style>

	.minfo {
		font-size:11px;
		font-family: NanumGothic;
	}
</style>

</head>
<body>
<center>
	<form name="checkForm" action="rboardWriteAction.action" enctype="multipart/form-data">
	
	<table id="jointable" width="80%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td colspan="8" align="center"><h3>신규등록 요청 목록</h3></td>
		</tr>
		<tr align="center" bgcolor="#FF895A" height="10">
			<td width="30" bgcolor="#FF895A"><input id="allCheck" type="checkbox" onclick="allChk(this);"></td>

			<td width="50" height="30px" bgcolor="#FF9D62"><strong>작성일</strong></td>
			<td width="50" height="30px" bgcolor="#FF9D62"><strong>아이디</strong></td>
			<td width="50" height="30px" bgcolor="#FF9D62"><strong>닉네임</strong></td>
			<td width="80" height="30px" bgcolor="#FF9D62"><strong>식당명</strong></td>
			<td width="80" height="30px" bgcolor="#FF9D62"><strong>업종</strong></td>
			<td width="200" height="30px" bgcolor="#FF9D62"><strong>식당위치</strong></td>
			<td width="80" height="30px" bgcolor="#FF9D62"><strong>가격대</strong></td>

		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
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
				
				<%-- <td><input name="RowCheck" type="checkbox" value="${result.rec_idx}"/></td> --%>
				<td class="minfo"><s:property value="r_idx"/></td>
				<td class="minfo" align="center"><s:property value="r_regdate"/></td>
				<td class="minfo" align="center"><s:property value="r_id"/></td>
				<td class="minfo" align="center"><s:property value="r_nicname"/></td>
				<td class="minfo" align="left"> &nbsp;<s:a href="%{ReqDetailViewURL}"><s:property value="r_shop_name"/></s:a></td>
				<td class="minfo" align="center"><s:property value="r_shop_kind"/></td>
				<td class="minfo" align="center"><s:property value="r_shop_addr1 + '  ' +r_shop_addr2"/></td>
				<td class="minfo" align="center"><s:property value="r_shop_price"/></td>

			</tr>
		
		
			<tr bgcolor="#777777">
				<td height="1" colspan="8"></td>
			</tr>
		</s:iterator>
		
		<s:if test="list.size()<=0">
		<tr bgcolor="#FFFFFF" align="center">
			<td colspan="8">등록된 게시물이 없습니다.</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="8"></td>
		</tr>
		</s:if>
		

		
		<tr align="center">
			<td colspan="8"><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		

		
				
	</table>
	</form>
	</center>
<script type="text/javascript">
//모두체크
function allChk(obj) {
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length - 1;
	var check = obj.checked;
	
	if (check) {
		for (var i = 0; i <= rowCnt; i++) {
			checkObj[i]. checked = true;			
		}
	} else {
		for (var i = 0; i <= rowCnt; i++) {
			if (chkObj[i].type == "checkbox") {
				chkObj.checked = false;
			}
		}
	}
}
//체크박스 선택된 것 처리(N개)
function fn_RequestApproval() {
	var r_idx = "";
	var idxChk = document.getElementsByName("RowCheck");
	var chked = false;
	var indexid = false;
	for ( i = 0 ; i < idxChk.length; i++){
		if (idxChk[i].checked) {
			if(indexid) {
				r_idx = r_idx + '-';
			}
			r_idx = r_idx + idxChk[i].value;
			indexid = true;
		}
	}
		if (!indexid) {
			alert("승인할 글번호를 체크해주세요");
			return;
		}
	document.checkForm.checkedApproval.value = r_idx; // 체크된 사용자 아이디를 '-'로 묶은 r_idx 를   document.userForm.delUserid 의 value로 저장 
	
	var agree = confirm("승인 하시겠습니까?");
	if(agree) {
		document.checkForm.execute.value="listToApr";
		document.checkForm.submit();
	}
}

</script>

	
</body>
</html>