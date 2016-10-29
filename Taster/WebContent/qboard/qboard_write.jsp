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

<script type="text/javascript">
	function validation()
	{
		var frm = document.forms(0);

		//�������� �Է¾��ϰ� �ۼ���ư ������
		if(frm.b_title.value == "")
		{
			alert("�Է����ּ���");
			return false;
		}
		/* 
		else if(frm.member_id.value == "")
		{
			alert("�Է����ּ���");
			return false;
		}
		
		
		else if(frm.b_pwd.value == "")
		{
			alert("�Է����ּ���");
			return false;
		}
		 */
		 
		 //�۳����� �Է¾��ϰ� �ۼ���ư ������
		else if(frm.b_content.value == "")
		{
			alert("�Է����ּ���");
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
<center>
	<table width="600" border="0" cellspacing="0" cellpadding="2" style="margin:0px auto;">
		<tr>
			<td align="center"><h2>���� �Խ���</h2></td>
		</tr>
	</table>
 
 	<!-- �亯����
	<s:if test="reply">
		<form action="replyAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="ref" value="%{resultClass.ref}" />
			<s:hidden name="re_level" value="%{resultClass.re_level}" />
			<s:hidden name="re_step" value="%{resultClass.re_step}" />
	</s:if>
	 -->
	
	<!-- ����� ��� ȣ�� -->
	<s:if test="resultClass == NULL">
		<form action="qWritePro.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	<!-- �۹�ȣ, ���������� ���� ������ ���·� ���۵�  -->
	<s:else>
		<form action="qModifyPro.action" method="post" enctype="multipart/form-data">
			<s:hidden name="b_idx" value="%{resultClass.b_idx}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
			
			<!--<s:hidden name="old_file" value="%{resultClass.file_savname}" />-->
	</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0" style="margin:0px auto;">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ����</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="b_title" theme="simple" value="%{resultClass.b_title}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  �г��� </td>
          <td bgcolor="#FFFFFF">
          <!-- �̸� -->
            <%-- <s:textfield name="member_id" theme="simple" value="${session.member_id}" cssStyle="width:100px" maxlength="20"/> --%>
            <input type="text" value="${session.member_id }" name="member_id" readonly cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
 
 		<!-- ��й�ȣ  -->
 		<!--  
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ��й�ȣ </td>
          <td bgcolor="#FFFFFF">
            <s:textfield name="b_pwd" theme="simple" value="%{resultClass.b_pwd}" cssStyle="width:100px" maxlength="20"/>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
       -->
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ���� </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="b_content" theme="simple" value="%{resultClass.b_content}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <!-- ÷������ ���� -->
        <!--
        <tr>
          <td bgcolor="#F4F4F4">  ÷������ </td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
		&nbsp; * <s:property value="resultClass.file_orgname" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
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
        
        <!-- �ۼ��Ϸ� ��ư(���ǰԽ��� ����Ʈ�� �Ѿ) -->
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb">
            <input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='qboardList.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
</form>
</center>
</body>
</html>