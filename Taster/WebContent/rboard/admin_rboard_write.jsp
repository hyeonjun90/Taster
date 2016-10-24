<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- <%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %> --%>
<%-- <%@ taglib prefix="ckfinder" uri="http://cksource.com/ckfinder" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css">
<%-- <script src="/Taster/ckeditor/ckeditor.js" charset="euc-kr"></script>
<script type="text/javascript" src="/Taster/ckfinder/ckfinder.js"></script>  --%>



<script type="text/javascript">
	function validation() {
		var frm = document.forms(0);

	if (frm.rec_subject.value=="") {
	alert("제목을 입력해주세요.");
	return false;
	}
	
	else if(frm.name.value=="") {s
		alert("이름을 입력해주세요.");
		return false;
		}
	
	else if(frm.password.value==""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	else if(frm.content.value==""){
		alert("내용을 입력해주세요.");
		return false;
	}
	return true;
	}
	

</script>

</script>
 
</head>
<body>

	<table width="900" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>추천리스트 등록하기</h2></td>
		</tr>
	</table>
	
	<s:if test="resultClass == NULL">
		<form name="f" action="rboardWriteAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	
	<s:else>
		<%-- <form action="modifyAction.action" method="post" enctype="multipart/form-data">
			<s:hidden name="rec_idx" value="{resultClass.rec_idx}"/>
			<s:hidden name="currentPage" value="%{currentPage}"/>
			<s:hidden name="old_file" value="%{resultClass.file_savname}"/> --%>
	</s:else>
	
	<table width="800" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font> 제목</td>
			<td width="700" bgcolor="#FFFFFF">
				<s:textfield name="rec_subject" theme="simple" value="%{resultClass.rec_subject}" cssStyle="width:700px;" maxlength="90"/>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td bgcolor="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 내용</td>
			<td bgcolor="#FFFFFF">
			
			<!-- 스마트 에디터 적용 -->
			<textarea name="rec_content" id="rec_content" style="width:700px; height:300px; display:none;" value="${resultClass.rec_content}"></textarea>
			
			</td> 
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
			<input name="submit" type="submit" value="작성완료" class="inputb" onclick="submitContents(this)">
			<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=<s:property value="currentPage"/>'">
			
			</td>
		</tr>
		
 	</table>
	</form>

<%-- <ckfinder:setupCKEditor basePath="ckfinder/" editor="rec_content"/>
<ckeditor:replace replace="rec_content" basePath="/ckeditor"></ckeditor:replace>
 --%>
<script>
window.onload=function(){

CKEDITOR.replace('rec_content',
		{
	toolbar :'Basic',
	filebrowserImageUloadUrl:'fileupload.jsp?type=images', //파일 업로드시 사용
	width : '100%', //넓이값
	height : '200' //높이값
		})
}
</script> 

</body>
</html>