<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
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
<style>
	#category_top { border: 1px solid #a6a6a6; }
	#category_top div {
		height: 25px;
		vertical-align:middle;
		font-family: NanumGothic;
		font-size:12px;
		font-weight:bold;
		padding:5px 15px;
		text-decoration:none;
		text-shadow:0px 1px 0px #ffffff;
		float: right;
		margin: 3px;
		margin-top: 10px;
		cursor: pointer;
		color: #a6a6a6;
		text-align:center;
	}
	.lineDiv {height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;}
</style>
<div class="top_module">
  <div class="menu_container">
    <div id="category_top" style="width:100%; background-color:#fff; height:50px;float:right;">
    <div class="" style="background-image:url('/Taster/images/logo2.png');
    		width:140px;height:50px;background-size:140px 50px; background-repeat:no-repeat; float:left; margin:0px; cursor:pointer;">
    </div>
	    <s:if test="#session.member_id != null">
	    <div class="" onclick="logout();">�α׾ƿ�</div>
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    <div class="" onclick="location.href='qboardList.action'">1:1����</div>
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    <div class="" onclick="location.href='memberMypage.action'">����������</div>
	    </s:if>
	    
	    <s:if test="#session.member_id == null">
	    <div class="" onclick="location.href='memberJoin.action'" >ȸ������</div>
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    <div class=""  onclick="" style="">
	    	<a href="#layer" class="layer_trigger"
	    	style="font-family: NanumGothic;font-size:12px;text-decoration:none;color:#a6a6a6;">�α���</a>
	    </div>
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    </s:if>
	    
	    <s:if test="#session.member_level == 3">
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    <div class="" onclick="location.href='approvalRequestList.action'" style="color:#ff792a;" >�űԽĴ� ����</div>
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    <div class="" onclick="location.href='adminMemberList.action'" style="color:#ff792a;">ȸ�� ����</div>
	    <div style="height:50px;width:0px;border:0.5px solid #a6a6a6;padding:0px;margin:0px;"></div>
	    </s:if>
    
    <s:if test="#session.member_id != null">
    <div class="btn_category" onclick="logout();">�α׾ƿ�</div>
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1����</div>
    <div class="btn_category" onclick="location.href='memberMypage.action'">����������</div>
    </s:if>
    
    <s:if test="#session.member_id == null">
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1����</div>
    <div class="btn_category" onclick="location.href='memberJoin.action'" >ȸ������</div>
    <div class="btn_category"  onclick="">
    	<a href="#layer" class="layer_trigger">�α���</a>
    </div>
    </s:if>
    
    <s:if test="#session.member_level == 3">
    <div class="btn_category" onclick="location.href='approvalRequestList.action'" style="background:#ff792a;" >�űԽĴ� ����</div>
    <div class="btn_category" onclick="location.href='adminMemberList.action'" style="background:#ff792a;">ȸ�� ����</div>
    <div class="btn_category" onclick="location.href='AshoplistAction.action'" style="background:#ff792a;">���� ����</div>
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
		<td onclick="location.href='foodsMenuList.action'" <c:if test="${category=='menu'}">style="background-color:orange;"</c:if>>������ ����</td>
		<td onclick="location.href='foodsAreaList.action'" <c:if test="${category=='area'}">style="background-color:orange;"</c:if>>������ ����</td>
		<td onclick="location.href='foodsHotList.action'">�ߴ� ����</td>
		<td onclick="location.href='foodsNewList.action'">�ű� ����</td>
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
				<input type="password" name="member_pwd" id="member_pwd" size="23" placeholder="��й�ȣ"
					 onkeydown="javascript:if(event.keyCode==13){ loginCheck(); return false; }">
			</div>
			<span class="btn_login" onclick="loginCheck();">LOGIN</span>
		 </div>
	    
	    <div class="close" >
		    <table width="100%" id="loginTbl" >
		    	<tr>
		    		<td width="30%" align="left" onclick="location.href='memberJoin.action'">ȸ������</td>
		    		<td width="50%;" align="left" onclick="location.href='findMemberInfo.action'">���̵�/��й�ȣ ã��</td>
		    		<td width="20%" align="right">
		    		 	<a href="#layer_anchor" title="���̾� �ݱ�" class="close">�ݱ�</a>
		    		</td>
		    	</tr>
		    </table>
	    </div>
	 </div>
	</div>
</form>


















