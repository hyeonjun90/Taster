<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<link rel="stylesheet" href="/StrutsBoard/board/common/css/css.css" type="text/css">
<script type="text/javascript">
	function open_win_noresizable (url, name) {
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");		
	}
</script>

</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>추천리스트 상세보기</h2></td>
		</tr>
		
		<tr>
			<td height="20"></td>
		</tr>

	</table>
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> 번호</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.rec_idx"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> 작성일</Td>   
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.rec_date"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> 제목</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.rec_subject"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<Td bgcolor="#F4F4F4"> 내용</Td>
			<td bgcolor="#FFFFFF">&nbsp; &nbsp; <s:property value="resultClass.rec_content"/></td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
	
		<%-- <tr>
			<td bgcolor="#F4F4F4"> 첨부파일</td>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; 
			
			<s:url id="download" action="fileDownloadAction">
			<s:param name="no">
				<s:property value="no"/>
			</s:param>
			</s:url>
			
			<s:a href="%{download}"><s:property value="resultClass.file_orgname"/></s:a>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr> --%>
		
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
				<s:url id="modifyURL" action="rboardModifyForm">
					<s:param name="no">
						<s:property value="no"/>
					</s:param>
				</s:url>
				
				<s:url id="deleteURL" action="rboardDeleteForm">
					<s:param name="no">
						<s:property value="no"/>
					</s:param>
				</s:url>
				
			<input type="button" value="수정하기" class="inputb" onClick="javascript:location.href='modifyURL';">
			<input type="button" value="삭제하기" class="inputb" onClick="javascript:location.href='deleteURL';">
			<input name="list" type="button" value=" 목 록 " class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=<s:property value="currentPage"/>'">
 			</td>
 		</tr>
 	</table>

</body>
</html>