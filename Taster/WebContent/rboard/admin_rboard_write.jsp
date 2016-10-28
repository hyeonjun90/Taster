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
<!-- 스마트에디터 CSS, 자바스크립트 관련 자료 설정 -->

<!-- <link href="/Taster/rboard/smartEditor2/css/default.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/Taster/rboard/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>


	
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


 
</head>
<body>

	<table width="900" border="0" cellspacing="0" cellpadding="2">
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
			<input id="savebutton" name="submit" type="submit" value="작성완료" class="inputb">
			<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=<s:property value="currentPage"/>'">
			
			</td>
		</tr>
		
 	</table>
	</form>
	
	
<script type="text/javascript" charset="utf-8">

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "rec_content",
        sSkinURI: "/Taster/rboard/smartEditor2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, 
        }
    });
     
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["rec_content"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})


/* // 이미지업로드 경로(붙여넣기할때 경로명이 바뀔수도 있으니 조심해야 한다. /로시작하는것은 절대경로를 의미)

var imagepath = "/Taster/rboard/smartEditor2/smartImages";

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

 oAppRef: oEditors,

 elPlaceHolder: "rec_content",

 sSkinURI: "/Taster/rboard/smartEditor2/SmartEditor2Skin.html",

 fCreator: "createSEditor2"

}); */



/* 
function insertIMG(irid,fileame){

  var sHTML = "<img src='" + imagepath + "/" + fileame + "' border='0'>";

  oEditors.getById[irid].exec("PASTE_HTML", [sHTML]);

}

function _onSubmit(elClicked){ 

 oEditors.getById["rec_content"].exec("UPDATE_IR_FIELD", []); 

 f.submit();

}
 */



</script>

</body>
</html>