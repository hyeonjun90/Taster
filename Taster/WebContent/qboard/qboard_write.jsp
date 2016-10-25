<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의 게시판</title>


<link rel="stylesheet" href="/Taster/qboard/css.css" type="text/css">

<script type="text/javascript">
	function validation()
	{
		var frm = document.forms(0);

		if(frm.b_title.value == "")
		{
			alert("입력해주세요");
			return false;
		}
		/* 
		else if(frm.member_id.value == "")
		{
			alert("입력해주세요");
			return false;
		}
		
		
		else if(frm.b_pwd.value == "")
		{
			alert("입력해주세요");
			return false;
		}
		 */
		else if(frm.b_content.value == "")
		{
			alert("입력해주세요");
			return false;
		}

		return true;
	}
	
	 $(document).ready(function(){
		 $("#b_content").cleditor();
	 });
</script>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>문의 게시판</h2></td>
		</tr>
	</table>
 
 	<!-- 답변관련
	<s:if test="reply">
		<form action="replyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_level" value="%{resultClass.re_level}" />
			<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:if>
	 -->
	
	<s:if test="resultClass == NULL">
		<form action="qWritePro.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	<s:else>
		<form action="qModifyPro.action" method="post" enctype="multipart/form-data">
			<s:hidden name="b_idx" value="%{resultClass.b_idx}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			
			<!--<s:hidden name="old_file" value="%{resultClass.file_savname}" />-->
	</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  제목</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_title" theme="simple" value="%{resultClass.b_title}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  닉네임 </td>
          <td bgcolor="#FFFFFF">
          <!-- 이름 -->
            <%-- <s:textfield name="member_id" theme="simple" value="${session.member_id}" cssStyle="width:100px" maxlength="20"/> --%>
            <input type="text" value="${session.member_nicname }" name="${session.member_nicname }" readonly cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
 		<!-- 비밀번호  -->
 		<!--  
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  비밀번호 </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="b_pwd" theme="simple" value="%{resultClass.b_pwd}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
       -->
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="b_content" theme="simple" value="%{resultClass.b_content}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <!-- 첨부파일 생략 -->
        <!--
        <tr>
          <td bgcolor="#F4F4F4">  첨부파일 </td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
		&nbsp; * <s:property value="resultClass.file_orgname" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
	</s:if>
						
          </td>
        </tr>
          -->
          
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="작성완료" class="inputb">
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='qboardList.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
</form>
</body>
</html>