<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%-- <%@ taglib prefix="ckeditor" uri="http://ckeditor.com" %> --%>
<%-- <%@ taglib prefix="ckfinder" uri="http://cksource.com/ckfinder" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��Ʈ����2 �Խ���</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css"> 
<%-- <script src="/Taster/ckeditor/ckeditor.js" charset="euc-kr"></script>
<script type="text/javascript" src="/Taster/ckfinder/ckfinder.js"></script>  --%>
<!-- ����Ʈ������ CSS, �ڹٽ�ũ��Ʈ ���� �ڷ� ���� -->

<!-- <link href="/Taster/rboard/smartEditor2/css/default.css" rel="stylesheet" type="text/css" /> -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/Taster/rboard/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>


	
<script type="text/javascript">
	function validation() {
		var frm = document.forms(0);

	if (frm.rec_subject.value=="") {
	alert("������ �Է����ּ���.");
	return false;
	}
	
	else if(frm.name.value=="") {s
		alert("�̸��� �Է����ּ���.");
		return false;
		}
	
	else if(frm.password.value==""){
		alert("��й�ȣ�� �Է����ּ���.");
		return false;
	}
	else if(frm.content.value==""){
		alert("������ �Է����ּ���.");
		return false;
	}
	return true;
	}
	

</script>


 
</head>
<body>

	<table width="900" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>��õ����Ʈ ����ϱ�</h2></td>
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
			<td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font> ����</td>
			<td width="700" bgcolor="#FFFFFF">
				<s:textfield name="rec_subject" theme="simple" value="%{resultClass.rec_subject}" cssStyle="width:700px;" maxlength="90"/>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td bgcolor="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> ����</td>
			<td bgcolor="#FFFFFF">
			
			<!-- ����Ʈ ������ ���� -->
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
			<input id="savebutton" name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb">
			<input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=<s:property value="currentPage"/>'">
			
			</td>
		</tr>
		
 	</table>
	</form>
	
	
<script type="text/javascript" charset="utf-8">

$(function(){
    //������������
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "rec_content",
        sSkinURI: "/Taster/rboard/smartEditor2/SmartEditor2Skin.html", 
        htParams : {
            // ���� ��� ���� (true:���/ false:������� ����)
            bUseToolbar : true,             
            // �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
            bUseVerticalResizer : true,     
            // ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
            bUseModeChanger : true, 
        }
    });
     
    //���۹�ư Ŭ���̺�Ʈ
    $("#savebutton").click(function(){
        //id�� smarteditor�� textarea�� �����Ϳ��� ����
        editor_object.getById["rec_content"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // �̺κп� ������ validation ����
         
        //�� submit
        $("#frm").submit();
    })
})


/* // �̹������ε� ���(�ٿ��ֱ��Ҷ� ��θ��� �ٲ���� ������ �����ؾ� �Ѵ�. /�ν����ϴ°��� �����θ� �ǹ�)

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