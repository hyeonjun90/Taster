<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="top_module">
  <div class="menu_container">
    <div class="btn_home" style="float:left;">�ΰ�</div>
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1����</div>
    <div class="btn_category" onclick="location.href='memberMypage.action'">����������</div>
    <div class="btn_category" onclick="location.href='memberJoin.action'" >ȸ������</div>
    <div class="btn_category" onclick="location.href='memberLogin.action'">�α���</div>
    <div class="btn_category" onclick="location.href='approvalRequestList.action'" style="background:#ff792a;" >�űԽĴ� ����</div>
    <div class="btn_category" onclick="location.href='adminMemberList.action'" style="background:#ff792a;">ȸ�� ����</div>
  </div>
  <div style="width:100%; height:100px; text-align:center; color:#fff;">
  	<h3>������ ����, ���� �� �ִ� ����!</h3>
  	<h3>������ ���� ���� ȯ���մϴ�.</h3>
  	
  	<select name="" id="selectbox" class="selectbox">
  		<option value="">�Ĵ��</option>
  		<option value="">����</option>
  	</select>
  	
  	<input type="text" name="keyword" id="keyword" placeholder="�˻� ����� ������ �ּ���."/>
  	<input type="button" value="��  ��" class="btn_search" style="margin-right:30px;font-size:13px;font-weight:bold;"/>
  	<input type="button" value="�󼼰˻�" class="btn_search" style="font-size:13px;font-weight:bold;"/>
  </div>
</div>
<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='foodsMenuList.action'">������ ����</td>
		<td onclick="location.href='foodsAreaList.action'">������ ����</td>
		<td onclick="location.href='foodsHotList.action'">�ߴ� ����</td>
		<td onclick="location.href=">�ű� ����</td>
		<td onclick="location.href='foodsRecommendList.action'">��õ ����</td>
		<td onclick="">��ü ����</td>
	</tr>
</table>




























