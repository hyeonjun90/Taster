<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������������Դϴ�.</title>
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
			<td colspan="8" align="center"><h3>�űԵ�� ��û ���</h3></td>
		</tr>
		<tr align="center" bgcolor="#FF895A" height="10">
			<td width="30" bgcolor="#FF895A"><input id="allCheck" type="checkbox" onclick="allChk(this);"></td>

			<td width="50" height="30px" bgcolor="#FF9D62"><strong>�ۼ���</strong></td>
			<td width="50" height="30px" bgcolor="#FF9D62"><strong>���̵�</strong></td>
			<td width="50" height="30px" bgcolor="#FF9D62"><strong>�г���</strong></td>
			<td width="80" height="30px" bgcolor="#FF9D62"><strong>�Ĵ��</strong></td>
			<td width="80" height="30px" bgcolor="#FF9D62"><strong>����</strong></td>
			<td width="200" height="30px" bgcolor="#FF9D62"><strong>�Ĵ���ġ</strong></td>
			<td width="80" height="30px" bgcolor="#FF9D62"><strong>���ݴ�</strong></td>

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
			<td colspan="8">��ϵ� �Խù��� �����ϴ�.</td>
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
//���üũ
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
//üũ�ڽ� ���õ� �� ó��(N��)
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
			alert("������ �۹�ȣ�� üũ���ּ���");
			return;
		}
	document.checkForm.checkedApproval.value = r_idx; // üũ�� ����� ���̵� '-'�� ���� r_idx ��   document.userForm.delUserid �� value�� ���� 
	
	var agree = confirm("���� �Ͻðڽ��ϱ�?");
	if(agree) {
		document.checkForm.execute.value="listToApr";
		document.checkForm.submit();
	}
}

</script>

	
</body>
</html>