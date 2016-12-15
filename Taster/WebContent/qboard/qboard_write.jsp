<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Խ���</title>

<link rel="stylesheet" href="/Taster/css/style.css"/>
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
		background-size:1300%;
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
		background-size:200% 
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

<script>
function validation(){
	var form = document.joinForm;
	
	if(form.b_title.value == ""){
		alert("������ �Է��� �ּ���.");
		return;
	}
	if(form.member_id.value ==""){
		alert("�г����� �Է��� �ּ���.");
		return;
	}
	
	if(form.b_content.value ==""){
		alert=("������ �Է��� �ּ���");
		return;
	}
	
	form.submit();
}
</script>


</head>
<body>
<center>
<div id="joinDiv">
<div><strong>���� �Խ���</strong></div>
<form action="qWritePro.action" method="post" enctype="multipart/form-data" name="joinForm">

<s:hidden name="b_idx" value="%{resultClass.b_idx}" />
<s:hidden name="currentPage" value="%{currentPage}" />
 	<!-- �亯����
	<s:if test="reply">
		<form action="replyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_level" value="%{resultClass.re_level}" />
			<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:if>
	 -->
	
<%-- 	<!-- ����� ��� ȣ�� -->
	<s:if test="resultClass == NULL">
		<form action="qWritePro.action" method="post" enctype="multipart/form-data" onsubmit="return validation();"></form>
	</s:if>
	<!-- �۹�ȣ, ���������� ���� ������ ���·� ���۵�  -->
 --%>
<%-- 	<s:else>
		<form action="qModifyPro.action" method="post" enctype="multipart/form-data">
			<s:hidden name="b_idx" value="%{resultClass.b_idx}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
		</form>	
			<!--<s:hidden name="old_file" value="%{resultClass.file_savname}" />-->
		</s:else> 
--%>
	<table id="joinTable">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>

        <tr>
          <th><font color="#FF0000">*</font>����</th>
          <td>
            <s:textfield name="b_title" theme="simple" value="%{resultClass.b_title}"  maxlength="50"/>
          </td>
        </tr>
        							

        <tr>
          <th><font color="#FF0000">*</font>�г��� </th>
          <td>
          <!-- �̸� -->
            <%-- <s:textfield name="member_id" theme="simple" value="${session.member_id}" cssStyle="width:100px" maxlength="20"/> 
          --%>
            <input type="text" value="${session.member_id }" name="member_id" readonly  maxlength="20"/>
          </td>
        </tr>
 
        
		<tr>
          <th><font color="#FF0000">*</font>���� </th>
          <td>
            <s:textarea name="b_content" theme="simple" value="%{resultClass.b_content}" cols="80" rows="10" />
          </td>
        </tr>
        
        <tr>
			<td colspan="2" align="center" style="height:60px;border:1px solid white;">
			<img src="/Taster/images/bt_ok.gif" alt="" onclick="validation()" >

			<img src="/Taster/images/bt_cancel.gif" alt="" onclick="javascript:if(confirm('�� �ۼ��� �׸��ΰ� ������� ���ư��ڽ��ϱ�?')){location.href='qboardList.action?currentPage=<s:property value="currentPage"/>'} " /> 
			<%-- <input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='qboardList.action?currentPage=<s:property value="currentPage" />'"> --%>
		</tr>

    </table>
</form>
</div>
</center>
</body>
</html>