<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/Taster/css/login/layout.css" />
<script>
function logout() {
	if(confirm("�α׾ƿ��� �Ͻðڽ��ϱ�?")) {
		location.href="memberLogout.action";
	}
	return;
}
</script>
<div class="top_module">
  <div class="menu_container">
    <div class="" style="width:140px;height:70px;float:left; margin:0px;">
    	<img src="/Taster/images/logo2.png"	onclick="location.href='main.action'" 
    		width="138px" height="68px" style="cursor:pointer"/>
    </div>
    
    <s:if test="#session.member_id != null">
    <div class="btn_category" onclick="logout();">�α׾ƿ�</div>
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1����</div>
    <div class="btn_category" onclick="location.href='memberMypage.action'">����������</div>
    </s:if>
    
    <s:if test="#session.member_id == null">
    <div class="btn_category" onclick="location.href='memberJoin.action'" >ȸ������</div>
    <div class="btn_category"  onclick="">
    	<a href="#layer" class="layer_trigger">�α���</a>
    </div>
    </s:if>
    
    <s:if test="#session.member_level == 3">
    <div class="btn_category" onclick="location.href='approvalRequestList.action'" style="background:#ff792a;" >�űԽĴ� ����</div>
    <div class="btn_category" onclick="location.href='adminMemberList.action'" style="background:#ff792a;">ȸ�� ����</div>
    </s:if>
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
		<td onclick="location.href='#'">�ű� ����</td>
		<td onclick="location.href='foodsRecommendList.action'">��õ ����</td>
		<td onclick="">��ü ����</td>
	</tr>
</table>

<script>
jQuery(function($){
	 var layerWindow = $('.mw_layer');
	 var layer = $('#layer');
	 
	 // Show Hide
	 $('.layer_trigger').click(function(){
	  layerWindow.addClass('open');
	 });
	 $('#layer .close').click(function(){
	  layerWindow.removeClass('open');
	 });


	 // ESC Event
	 $(document).keydown(function(event){
	  if(event.keyCode != 27) return true;
	  if (layerWindow.hasClass('open')) {
	   layerWindow.removeClass('open');
	  }
	  return false;
	 });
	 // Hide Window
	 layerWindow.find('>.bg').mousedown(function(event){
	  layerWindow.removeClass('open');
	  return false;
	 });
	});
	
function loginCheck() {
	if($("#member_id").val() == "") {
		alert("���̵� �Է����ּ���.");
		return;
	} else if($("#member_pwd").val() == "") {
		alert("��й�ȣ�� �Է����ּ���.");
		return;
	}
	
	document.loginForm.submit();
}
</script>

<form method="post" action="memberLogin.action" name="loginForm">
	<div class="mw_layer">
	 <div class="bg"></div>
	 <div id="layer">
	 	<h2 style="border-bottom:1px solid black;">LOGIN</h2>
		 <div class="login_line">
		 	<div class="box_in">
		 		<input type="text" name="member_id" id="member_id"  size="23" placeholder="���̵�">
				<input type="password" name="member_pwd" id="member_pwd" size="23" placeholder="��й�ȣ">
			</div>
			<span class="btn_login" onclick="loginCheck();">LOGIN</span>
		 </div>
	    
	    <div class="close" >
		    <table width="100%" id="loginTbl" >
		    	<tr>
		    		<td width="30%" align="left" onclick="memberJoin.action">ȸ������</td>
		    		<td width="50%;" align="left">���̵�/��й�ȣ ã��</td>
		    		<td width="20%" align="right">
		    		 	<a href="#layer_anchor" title="���̾� �ݱ�" class="close">�ݱ�</a>
		    		</td>
		    	</tr>
		    </table>
	    </div>
	 </div>
	</div>
</form>


















