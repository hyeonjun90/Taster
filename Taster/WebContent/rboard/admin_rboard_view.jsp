<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
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
				var check=confirm("매거진을 삭제하시겠습니까?")
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
	.RecomViewBlock {font-family : 'Noto Sans', sans-serif;  width:80%; border:10px solid gray;}
	.RecommendView { float:center; width:80%; margin-top:20px; border:2px solid #d5d5d5;  margin:10px;}
	.reviewContent {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif; }
	.rec_idx {padding: 10px; width:100%; font-size: 12px; float:left; text-align:left; border:1px solid orange;}
	.rec_date {float:right; width:49%; text-align:right; color:#a6a6a6; font-size:13px; height:20px; border:1px solid red;}
	.rec_subject {float:left; width: 49%; float:left;text-align:left;  font-weight:bold; font-size:15px; height:20px; border:1px solid gray;}
	.content { font-size: 30px; color:#555; font-weight:bold;}
	.rec_image { width:80%; float:center; text-align:center; border:1px solid yellow;}
	. rec_content { width:80%; float:center; font-size: 15px; color:#555; font-weight:bold;}
	
	
</style>

</head>
<body>



<div class="RecomViewBlock" style="float:center; ">

	<table width="800" align="center" border="1" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>Editor's Pick!</h2></td>
		</tr>
		
	</table>


	<!-- 리뷰글 반복출력 -->
	<c:forEach items="${RecomList}" var="RecomList" varStatus="status">
	
		<!-- 개별 뷰 블록 -->
		<div class="RecommendView" style="float:center;">
		 	
		 	
		 	<div id="rec_idx" class="rec_idx">글번호: ${RecomList.rec_idx}</div><!-- 글번호 -->
	
		 	<div id="rec_date" class="rec_date">작성일:${RecomList.rec_date}</div><!-- 작성일 -->
	
		 	<div id="rec_subject" class="rec_subject">제목 : ${RecomList.rec_subject}</div><!-- 제목 -->
		 	
		 	<div style="clear:both; width:100%;float:left; border:1px solid #d5d5d5;"></div> <!-- 구분선 -->
		 	
		 		<div id="content">
		 			<p class="rec_image"><img src="/Taster/images/${RecomList.rec_image}"/></p><!-- 이미지 -->
					<p class="rec_content" style="border:1px solid green;">${RecomList.rec_content}</p>		<!-- 본문내용 -->
				</div>
		</div>
		
		
	</c:forEach>
	


</div>
	
	
	<table>

		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">

				<s:url id="modifyURL" action="rboardModifyForm">
					<s:param name="rec_idx">
						<s:property value="rec_idx"/>
					</s:param>
				</s:url>
				
				<s:url id="deleteURL" action="rboardDeleteAction">
					<s:param name="rec_idx">
						<s:property value="rec_idx"/>
					</s:param>
				</s:url>
				
				
			<input type="button" value="수정하기" class="inputb" onClick="%{modifyURL}">
			<input type="button" value="삭제하기" class="inputb" onClick="%{deleteURL}">
			<input name="list" type="button" value=" 목 록 " class="inputb" onClick="javascript:location.href='adminRboardList.action?currentPage=<s:property value="currentPage"/>'">
 			</td>
 		</tr>
 	</table>



</body>
</html>