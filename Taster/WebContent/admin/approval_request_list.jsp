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
#joinTable {
		width: 800px;
		height: 380px;
		margin-top: 10px;
		padding: 0px;
	}
	#joinTable tr th {
		width: 20%;
		background-color: #f7f7f7;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
		background-image: url('/Taster/images/bg_01.gif');
		background-size:700%;
		background-repeat: no-repeat;
		border-bottom: 1px solid #a6a6a6;
	}
	#joinTable tr td {
		width: 80%;
		font-size: 11px;
		font-family : 'NanumGothic';
		vertical-align: middle;
		padding-left:3px;
		border-bottom: 1px solid #a6a6a6;
	}
	.zipcode {
		margin-bottom: 5px;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
	}
	#joinTable button {
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable input {
		height: 10px;
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable img {
		height: 20px;
		cursor: pointer;
	}
	#joinTable font {
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
	}
	#joinDiv {
		width: 820px;
		border: 1px solid #a6a6a6;
		margin-top: 30px;
		margin-bottom: 15px;
	}
	#joinDiv div {
		width:750px; border-bottom:3px solid #f0f0f0;
		text-align: left; padding: 10px;
		font-size: 14px; font-family : 'Noto Sans', sans-serif;
	}
</style>
</head>
<body>
	<table width="1000" border="1" cellspacing="1" cellpadding="10">
	<tr>
		<td align="center"><h2>신규등록 요청 목록</h2></td>
	</tr>
	<tr>
	
	</table>
	<form name="checkForm" action="rboardWriteAction.action" enctype="multipart/form-data">
	
	<table width="1000" border="1" cellspacing="1" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="30"><input id="allCheck" type="checkbox" onclick="allChk(this);"></td>
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
				
				<td><input name="RowCheck" type="checkbox" value="${result.rec_idx}"/></td>
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
	</form>
	
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