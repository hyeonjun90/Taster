<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/Taster/css/style.css" type="text/css"> 

<script type="text/javascript">
	function open_win_noresizable (url, name) {
		var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");		
	}
	
	$(function(){
		var $magazineDelete = $('.magazineDelete');

		$magazineDelete.each(function(){
			var $btn = $(this).children('.deleteMagazine');

			$btn.on('click',function(){
				var check=confirm("�Ű����� �����Ͻðڽ��ϱ�?")
				if(check){
					true;
				}
				else{
					return false;
				}
			});
		});
	});
</script>

<style>
	.RecomViewBlock {font-family : 'Noto Sans', sans-serif; align:center; width:70%; margin:150px; text-align:center; border:3px solid orange;}
	.RecommendView { margin:150px; float:center; width:97%; margin-top:20px; border:2px solid #d5d5d5;  margin:10px;}
	.reviewContent {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif; }
	.rec_idx {padding: 10px; width:100%; font-size: 12px; float:left; text-align:left; margin:10px;}
	.rec_date {float:right; width:30%; text-align:right; color:#a6a6a6; font-size:13px; height:20px;margin:10px;}
	.rec_subject {float:left; width: 60%; float:left;text-align:left;  font-weight:bold; font-size:15px; height:20px; margin:10px; }
	.content { font-size: 30px; color:#555; font-weight:bold; margin:10px;}
	.rec_image { width:80%; float:center; text-align:center;  margin:10px;}
	. rec_content { width:80%; float:center; font-size: 15px; color:#555; font-weight:bold; margin:10px;}
	
	
</style>

</head>
<body>

<div class="RecomViewBlock" style="float:center;">

	<table width="800" align="center" style="color:#a6a6a6" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h1>Editor's Pick!</h1> <br>
			<h4>�����Ͱ� ��õ�ϴ�, ���� ���� �ٷ� �� ����!</h4></td>
		</tr>
		
	</table>
    <s:if test="#session.member_level == 3">
   <!-- �۾��� ��ư -->
   	<table width="800">
  	 <tr align="right" >
  	  <td>
         <input name="list" type="button" value="��ü�� ����" class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=<s:property value="currentPage" />';" />
         <input name="write" type="button" value="���� �ø���" class="inputb" onClick="javascript:location.href='rboardWriteForm.action?currentPage=<s:property value="currentPage" />';" />
      </td>
   </tr></table>
   </s:if>
  	

	<!-- ����� �ݺ���� -->
	<c:forEach items="${RecomList}" var="RecomList" varStatus="status">
	
		<!-- ���� �� ��� -->
		
		<div class="RecommendView">
		 	<div id="rec_idx" class="rec_idx">No: ${RecomList.rec_idx}</div><!-- �۹�ȣ -->
		 	<div id="rec_date" class="rec_date">�ۼ���:${RecomList.rec_date}</div><!-- �ۼ��� -->
	
		 	<div id="rec_subject" class="rec_subject">���� : ${RecomList.rec_subject}</div><!-- ���� -->
		 	
		 	<div style="clear:both; width:100%;float:left; border:1px solid #d5d5d5;"></div> <!-- ���м� -->
		 	
		 		<div id="content">
		 			<p class="rec_image"><img src="/Taster/images/${RecomList.rec_image}"/></p><!-- �̹��� -->
					<p class="rec_content" >${RecomList.rec_content}</p>		<!-- �������� -->
				</div>
		
		</div>
	</c:forEach>
	


</div>



</body>
</html>