<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Խ���</title>
<link rel="stylesheet" href="/struts2_board/board/common/css/css.css" type="text/css">

<script type="text/javascript">
	function open_win_noresizable(url, name)
	{
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");
		
	}
</script>
</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	<tr>
		<td align="center"><h2>���� �Խ���</h2></td>
	</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td width="100">��ȣ</td>
			<td width="500">
				<s:property value="resultClass.b_idx" />
			</td>
		</tr>
		<tr>
			<td width="100">����</td>
			<td width="500">
				<s:property value="resultClass.b_title" />
			</td>
		</tr>
		<tr>
			<td width="100">�г���</td>
			<td width="500">
				<s:property value="resultClass.member_nicname" />
			</td>
		</tr>
		
		<tr>
			<td width="100">����</td>
			<td width="500">
				${resultClass.b_content }
			</td>
		</tr>
		<tr>
			<td width="100">��ȸ��</td>
			<td width="500">
				<s:property value="resultClass.b_readCount" />
			</td>
		</tr>
		<tr>
			<td width="100">��ϳ�¥</td>
			<td width="500">
				<s:property value="resultClass.b_regdate" />
			</td>
		</tr>
		
		
	<!--  
		<tr>
			<td width="100">÷������</td>
			<td width="500">
				&nbsp;&nbsp;
				<s:url id="download" action="fileDownloadAction">
					<s:param name="no">
						<s:property value="no" />
					</s:param>
				</s:url>
				
				<s:a href="%{download}">
					<s:property value="resultClass.file_orgname" />
				</s:a>
			</td>
		</tr>
-->

	<!-- �����ڿ��Ը�   �󼼺��⿡�� �ڸ�Ʈ�޴��� ����. -->
	<c:if test="${session.member_level == 3}">
    
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
		<tr>
			<td colspan="2" height="10">
				<form action="AdminComment.action" method="post">
					<table>
						<tr>
							<td width="170">
							
								<!-- �г��� ���� �Ұ����ϰ� �б����� ó�� -->
								<input type="text" value="������" readonly style="text-align:center; border:0px;"/>
								
								<!--  <input type="text" value="${session.nicname}" name="member_nicname" cssStyle="width:100px" maxlength="20"/>-->
								<!-- ��й�ȣ <s:textfield name="c_pwd" theme="simple" value="" cssStyle="width:100px" maxlength="20" /> -->
							</td>

					<!-- �󼼺��� ���������� ������ �ִ� ����: �۹�ȣ ��۹�ȣ ���ID, ������������ȣ -->
							<s:hidden name="b_idx" value="%{resultClass.b_idx}" />
							<s:hidden name="member_id" value="%{resultClass.member_id}" />							
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!����!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<s:hidden name="c_idx" value="%{resultClass.c_idx}" />
							<s:hidden name="currentPage" value="%{currentPage}" />
					<!-- !!!!!!!!!!!!!!!!!!!!!!!!����!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
							<td align="left">
								<s:textarea name="c_content" theme="simple" value="" cols="60" rows="3" />
							</td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<input name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb">
							</td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</c:if>	
		
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
	
	 <!-- ��� ���� -->
		<s:iterator value="commentlist" status="stat">
		<tr>
			<td height="10" width="130" align="center">
			
				<input type="text" value="������" readonly style="text-align:center; border:0px;"/>
			
				<!-- ������ ID�� -->
				<s:hidden name="member_id" value="%{resultClass.member_id}" />
			<br>			
				<s:property value="c_regdate" /><br><br>
			</td>
			<td>
			<!-- @@@@@@@@@@@@�ڸ�Ʈ ����@@@@@@@@@@@@ -->
				<s:property value="c_content" /> 
				<a href="javascript:open_win_noresizable('idCheck2.action?c_idx=<s:property value="c_idx" />&b_idx=<s:property value="b_idx" />&currentPage=<s:property value="currentPage" />','cdelete')">x</a>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		</s:iterator>
		<tr>
			<td colspan="2" height="10">
				<s:if test="commentlist.size() <= 0">
				��۾���
			</td>
		</tr>
				</s:if>	
	
		<tr bgcolor="#777777">
			<td colspan="2" height="1"></td>
		</tr>
		<tr>
			<td colspan="2" height="10"></td>
		</tr>
	
	
		<tr>
			<td colspan="2" align="right">
				<s:url id="modifyURL" action="qModifyForm">
					<s:param name="b_idx">
						<s:property value="b_idx" />
					</s:param>
				</s:url>
				<s:url id="deleteURL" action="qDeletePro">
					<s:param name="b_idx">
						<s:property value="b_idx" />
					</s:param>
				</s:url>
				
				<!-- �ۼ���,�ۻ���,��� ��ư, ����/���� ��ư�� ������  qboard.xml�� �����س��� idCheck�׼��� ���� QBoardViewAction.java��  idCheck�޼ҵ尡 �����Ѵ�. idCheck�޼ҵ忡�� ID�� �ٸ���qboard_check_error������(����/���� �Ұ� â)�� ����ٰ� �����ϸ� ID�� ��ġ�ϸ� qboard_check_success.jsp(����/���� ����)â�� ����ٰ� �����Ѵ�..-->
				<!--<input name="list" type="button" value="�亯�ޱ�" class="inputb" onClick="javascript:location.href='replyForm.action?no=<s:property value="no" />'"> -->
				<input name="list" type="button" value="����" class="inputb" onClick="javascript:open_win_noresizable('idCheck.action?member_id=<s:property value="resultClass.member_id" />&b_idx=<s:property value="resultClass.b_idx" />&currentPage=<s:property value="currentPage" />','modify')">
				<input name="list" type="button" value="����" class="inputb" onClick="javascript:open_win_noresizable('idCheck.action?member_id=<s:property value="resultClass.member_id" />&b_idx=<s:property value="resultClass.b_idx" />&currentPage=<s:property value="currentPage" />','delete')">
				<input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='qboardList.action?currentPage=<s:property value="currentPage" />'">
			</td>
		</tr>
	</table>
</body>
</html>