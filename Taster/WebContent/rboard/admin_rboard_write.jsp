<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css"> 
<script src="/TEP/static/js/openmeetform.js"></script>
<link rel="stylesheet" href="/TEP/static/css/root.css">
<script src="/Taster/rboard/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="/TEP/static/css/alertify.default.css">





	
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
	
<!-- CK에디터 실행 -->	
<script type="text/javascript" charset="utf-8">

window.onload = function() {
	CKEDITOR.replace('rec_content',{
			'filebrowserUploadUrl':'ckeditorImageUpload.action'
	});
}


</script>

 
</head>
<body>

	<table align="center" width="80%" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>추천리스트 등록하기</h2></td>
		</tr>
	</table>
	
	<s:if test="resultClass == NULL">
		<form id="frm" name="f" action="rboardWriteAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	
	<s:else>
		<%-- <form action="modifyAction.action" method="post" enctype="multipart/form-data">
			<s:hidden name="rec_idx" value="{resultClass.rec_idx}"/>
			<s:hidden name="currentPage" value="%{currentPage}"/>
			<s:hidden name="old_file" value="%{resultClass.file_savname}"/> --%>
	</s:else>
	
	<table align="center"  width="80%" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<th bgcolor="#F4F4F4" scope="row">제목</th>
			<td width="800" bgcolor="#FFFFFF">
				<s:textfield name="rec_subject" theme="simple" value="%{resultClass.rec_subject}" cssStyle="width:99%;" maxlength="200"/>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td bgcolor="1" colspan="2"></td>
		</tr>

		<tr>
			<th bgcolor="#F4F4F4" scope="row">내용</th>
			<td bgcolor="#FFFFFF">
			
			<!-- 스마트 에디터 적용 -->
			<textarea name="rec_content" id="rec_content" style="width:700px; height:300px; display:none;" value="${resultClass.rec_content}"></textarea>
			
			</td> 
		</tr>
		
		<tr>
       		<th bgcolor="#F4F4F4" scope="row">첨부파일</th>
       			<td>
       				<s:file cssClass="txt" theme="simple" name="rec_image" />
       				<s:if test="resultClass.rec_image!=null">
       					<span class="bk"><s:property value="resultClass.rec_image" />파일이 등록되어있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.</span>
					<!-- <s:property value="%{resultClass.image1}"/> -->
					</s:if>
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
			<input id="savebutton" name="submit" type="submit" value="작성완료" class="inputb">
			<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=1'">
			
			</td>
		</tr>
		
 	</table>
	</form>


</body>
</html>