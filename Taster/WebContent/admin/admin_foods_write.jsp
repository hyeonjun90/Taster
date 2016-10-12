<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당 등록 게시판</title>

<script type="text/javascript">
	function validation() {
		
			var frm = document.forms(0);
			
			if(frm.shop_name.value == "") {
				alert("식당이름을 입력해주세요.");
				return false;
			} 
			
			else if(frm.shop_price.value == "") {
				alert("가격대 입력해주세요.");
				return false;
				
			}
			
			else if(frm.shop_tel.value == "") {
				alert("전화번호를 입력해주세요.");
				return false;
			}
			
			else if(frm.shop_addr1 + shop_addr2 + shop_addr3 + shop_addr4 .value == "") {
				alert("주소을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
</script>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>식당등록 게시판</h2></td>
		</tr>
	</table>
	
	<s:if test="reply">
		<form action="replyAction.action" method="post" name="frm" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_level" value="%{resultClass.re_level}" />
			<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:if>
	
	<s:elseif test="resultClass == NULL">
		<form action="writeAction.action" method="post" name="frm" enctype="multipart/form-data" onsubmit="return validation();">
	</s:elseif>
	
	<s:else>
		<form action="modifyAction.action" method="post" name="frm" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="no" value="%{resultClass.no}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			<s:hidden name="old_file" value="%{resultClass.file_savname}" />
	</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
	
		<tr>
			<td align="right" colspan="2">
				<font color="#FF0000">*</font>는 필수 입력 사항.
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>

		</tr>
		
		
		
		<tr>
			<td width="100">
				<font color="#FF0000">*</font> 식당이름
			</td>
			<td width="500">
				<s:textfield name="shop_name" theme="simple" value="%{resultClass.shop_name}" cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>
		<td width="100">
				<font color="#FF0000">*</font> 전화번호
			</td>
			<td width="500">
				<s:textfield name="shop_tel" theme="simple" value="%{resultClass.shop_tel}" cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>
		<td width="100">
				<font color="#FF0000">*</font> 가격대
			</td>
			<td width="500">
				<s:textfield name="shop_price" theme="simple" value="%{resultClass.shop_price}" cssStyle="width:370px" maxlength="50" />
			</td>
		</tr>
		<td width="100">
				<font color="#FF0000">*</font> 주소
			</td>
			<td width="500">
				<s:textfield name="shop_addr1 + shop_addr2 + shop_addr3 + shop_addr4" theme="simple" value="%{resultClass.shop_addr1 + shop_addr2 + shop_addr3 + shop_addr4}" cssStyle="width:370px" maxlength="50" />
				<input name="submit" type="submit" value="주소보기" class="inputb">
			</td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
				<font color="#FF0000">
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
			</tr>
		
		<tr>
			<td align="right" colspan="2">
				<br/><input name="submit" type="submit" value="작성완료" class="inputb">
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>