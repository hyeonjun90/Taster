<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ĵ�� - �󼼺���</title> <!-- �Ĵ�� �߰� ���� -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<link rel="stylesheet" href="/Taster/css/style.css" />
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
var switch_smile = 0;
function setPungga(p){
	document.r_form.r_pungga.value=p;
	if(p == "1") {
		if(switch_smile == 0) {
			$("#good").css("background-image", "url(/Taster/images/shop/good.jpg)");
			$("#soso").css("background-image", "url(/Taster/images/shop/soso_org.jpg)");
			$("#bad").css("background-image", "url(/Taster/images/shop/bad_org.jpg)");
			$("#good_t").css("color", "orange");
			$("#soso_t").css("color", "gray");
			$("#bad_t").css("color", "gray");
			switch_smile = 1;
		} else {
			$("#good").css("background-image", "url(/Taster/images/shop/good_org.jpg)");
			$("#good_t").css("color", "gray");
			switch_smile = 0;
		}
	} else if (p == "2") {
		if(switch_smile == 0) {
			$("#soso").css("background-image", "url(/Taster/images/shop/soso.jpg)");
			$("#good").css("background-image", "url(/Taster/images/shop/good_org.jpg)");
			$("#bad").css("background-image", "url(/Taster/images/shop/bad_org.jpg)");
			$("#soso_t").css("color", "orange");
			$("#good_t").css("color", "gray");
			$("#bad_t").css("color", "gray");
			switch_smile = 1;
		} else {
			$("#soso").css("background-image", "url(/Taster/images/shop/soso_org.jpg)");
			$("#soso_t").css("color", "gray");
			switch_smile = 0;
		}
	} else if (p == "3") {
		if(switch_smile == 0) {
			$("#bad").css("background-image", "url(/Taster/images/shop/bad.jpg)");
			$("#good").css("background-image", "url(/Taster/images/shop/good_org.jpg)");
			$("#soso").css("background-image", "url(/Taster/images/shop/soso_org.jpg)");
			$("#bad_t").css("color", "orange");
			$("#good_t").css("color", "gray");
			$("#soso_t").css("color", "gray");
			switch_smile = 1;
		} else {
			$("#bad").css("background-image", "url(/Taster/images/shop/bad_org.jpg)");
			$("#bad_t").css("color", "gray");
			switch_smile = 0;
		}
	}	
}

/* function showPungga() {
	document.countPungga.value=count;
	if(count == "1") {
		$("#r_pyungga").css("background-image", "url(/Taster/images/shop/good.jpg)");
	} else if (count == "2") {
		$("#r_pyungga").css("background-image", "url(/Taster/images/shop/soso.jpg)");
	} else if (count == "3") {
		$("#r_pyungga").css("background-image", "url(/Taster/images/shop/bad.jpg)");
	}
} */

</script>


<style>
	.clearDiv{	clear:both; }

    .category_bt{ width: 50px; height: 80px; float: left; text-align: center; background: white; 
    			margin:10px 10px 10px 30px; /* ž �� ���� �� */border: 7px solid white;padding-top: 0px; }
	.pungga_good {background:url('/Taster/images/shop/good_org.jpg');}
	.pungga_soso {background:url('/Taster/images/shop/soso_org.jpg');}
	.pungga_bad {background:url('/Taster/images/shop/bad_org.jpg');}
	
	.readhit {background:url('/Taster/images/readhit.jpg'); width: 30px; height: 30px;}
	.review-write {background:url('/Taster/images/review-write.jpg'); width: 30px; height: 30px;}
	.favorite_s {background:url('/Taster/images/favorite_s.jpg'); width: 43px; height: 43px;}
	.icon { width: 43px; height: 43px; display: inline-block; background-repeat: no-repeat; cursor: pointer; }
	.icon2 { width: 25px; height: 15px; float:center; display: inline-block; background-repeat: no-repeat; }
	.icon_title{ font-size: 13px; font-weight: 600; margin-top: -10px; font-family : 'Noto Sans', sans-serif;}

	
/* 	.icon_title{
		font-size: 13px;
		font-weight: 600;
		margin-top: -10px;
		font-family : 'Noto Sans', sans-serif;	
	}
	.category_bt:hover{
		border: 7px solid #DDE5B8;
		padding-top: 0px;
	}
	
	.cat_select{
		border: 7px solid #ABC1DF;
		padding-top: 0px;
	} */


	.foodDetail div {font-family : 'Noto Sans', sans-serif;}
	.reviewList div {font-family : 'Noto Sans', sans-serif;}
	.reviewContent div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif; }
	.title { font-size: 30px; color:#555; font-weight:bold;}
	.r_score { font-size: 30px; color:orange; font-weight:bold; }
	.subject {float:left; width: 500px; float:left;text-align:left; font-size:15px; height:300px;}
	.r_memberInfo{padding: 10px; font-size: 12px; float:left; text-align:left; margin-top:10px;}
	.r_content {padding: 10px; font-size: 12px; float:left; text-align:left; margin:10px;}
	.r_pyungga {font-size: 25px; color:orange; float:right; margin:10px; font-weight:bold; margin-top:10px;border:1px solid red;}
	.favorite {width: 60px;height: 70px; background-size:60px 50px;padding-top:5px;float:right;}
    
    .reviewblock {font-size: 25px; color:orange; text-align:left; margin:10px; font-weight:bold; border:1px solid orange;}
    .inputb {width:100px; height:80px; BORDER-LEFT: #cecece 1px solid; BORDER-RIGHT:#999999 1px solid; BORDER-TOP: #cecece 1px solid; COLOR:#000000; FONT-SIZE:10pt; background-color:#EDEDED;}
	
    
    
    .m_image { width:32px; height: 32px; border-radius: 20px; display:block; float: left;
    	 background:url('/Taster/images/basic_profile.png') no-repeat; background-size:32px 32px; margin:5px;}
    	 
    .gray{float:left;text-align:left; color:#a6a6a6; font-size:13px;}
    .r_title{ margin-left:10px; text-align:left; color:#555; font-size:13px;}
</style>
</head>

<body>

<center>
<div style="width:100%;min-height:500px;margin-top:40px;">

	<!-- ���� �̸����� �߱� -->
	<div style="text-align:left; width:100%;">���� �ݺ��ǰ� �ڵ� ����</div>
	<div style="background-image:url('/Taster/images/shop/${FDBean.file_savname}');
				background-repeat:repeat; display:block; 
				width:300px;height:300px;background-size:300px 300px;padding-top:5px;float:left;"></div>
		
<%-- 	<div style="width:1000px; height:240px; float:left;">
		<img src="/Taster/images/shop/${FDBean.file_savname}">
	</div> --%>
	
	<div class="clearDiv"></div>
	
	<!-- �������� -->
	<div class="foodDetail" style="width:80%;  float:center; margin:100px auto;">
		<div style="float:left; width:90%; text-align:left;">
			<span class="title">${FDBean.shop_name}</span> <!-- �����̸� -->
			<span class="r_score">${FDBean.avg_r_score}</span> <!-- ���� ��� -->
			<br>
			<span class="gray">
			<em class="readhit icon2"></em>${FDBean.shop_readCount}
			<em class="review-write icon2"></em>${FDBean.shop_readCount}
			<em class="favorite_s icon2"></em>${FDBean.shop_readCount}
			  <span style="background-image:url('/Taster/images/review-write.jpg');background-size:30px 30px;"></span> <!-- ����� -->
			 <span style="background-image:url('/Taster/images/favorite_s.jpg');"></span> <!-- ���ã��� -->
			 </span>
		</div>
		
		<!-- ���ã�� �߰� -->
		<div style="background-image:url('/Taster/images/star.jpg');background-repeat: no-repeat; display:block; " class="favorite">
		<span style="float:bottom;">���ã��</span></div>
		
		<!-- ���м� -->
		<div style="clear:both; width:100%;float:left; border:1px solid #d5d5d5;"></div>
		
		<!-- �������� ǥ�� -->
		<div class="subject">
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >�ּ� : </span><span style="float:right;width:300px;margin:5px;"> ${FDBean.shop_addr1 } ${FDBean.shop_addr2 } ${FDBean.shop_addr3 } ${FDBean.shop_addr4 }</span>
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >��ȭ��ȣ : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_tel }</span>
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >���� ���� : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_kind }</span> 
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >���ݴ� : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_price }</span>
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >���� : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_holiday }</span> 
		</div>
		
		<!-- ���� -->
		<div style="background-image:url('/Taster/images/map.jpg');
					background-repeat: no-repeat; display:block; 
					width:300px;height:300px;background-size:300px 300px;padding-top:5px;float:right;"></div>
		<!-- ���м� -->
		<div style="clear:both; width:100%; border:1px solid #d5d5d5;"></div>
	
	</div>
	

  <!-- ��۸��� �ۼ� â -->
   <%-- <s:if test="#session.member_id != null | #session.member_level == 3"> --%> <!-- �α����� �̿��ڳ� �����ڸ� �ۼ� ���� -->
  
  <div class="reviewblock" style="width:800px;">���� ������</div>
  
  <!-- ���� �ۼ� �� -->
  	<form name="r_form" action="foodsReviewWrite.action" method="post" style="width:800px; height:350px; border:3px solid orange;">
  	 <input type="hidden" name="r_pungga"/>
  		
  		<!-- �����ϱ�--> 
  		<div style="width:340px; height:100px; float:left; text-align:center; border:1px solid yellow;">
  			<span class="category_bt" onclick="setPungga('1')">
  				<em class="pungga_good icon" id="good"></em>
  				<span style="color:gray;" id="good_t">���ִ�</span>
  			</span>
  			<span class="category_bt" onclick="setPungga('2')" >
  				<em class="pungga_soso icon" id="soso"></em>
  				<span style="color:gray;" id="soso_t">������</span>
  			</span>
  			<span class="category_bt" onclick="setPungga('3')">
  				<em class="pungga_bad icon" id="bad"></em>
  				<span style="color:gray;" id="bad_t">����</span>
  			</span>
  		</div>  
  		<!-- ���� ���ε� -->
  		<div>
  		<table style="float:right; width:450px; height:120px; border:1px solid red;">
		<th>���� ���ε�</th>
		<s:file label="File (1)" name="r_upload1"/>
		<s:file label="File (2)" name="r_upload2"/>
		<s:file label="FIle (3)" name="r_upload3"/>
		</table>
		</div>
		
		<div class="clearDiv"></div>
		
		<div style="width:340px; height:20px; float:left; border:1px solid blue;">
  		���� ���ϱ� : 
  			 <input type="radio" name="r_score" value="1">1
  			 <input type="radio" name="r_score" value="2">2
  			 <input type="radio" name="r_score" value="3">3
  			 <input type="radio" name="r_score" value="4">4
  			 <input type="radio" name="r_score" value="5">5
  		</div>
		<!-- ���� ���� -->
		<div style="width:630px; height:150px; float:left; border:1px solid green;">
		<s:hidden name="org_review_idx" value="%{RBean.review_idx}"/>	<!-- �����ε��� -->
		<s:hidden name="review_idx" value="%{RBean.review_idx}"/>
		<s:hidden name="shop_idx" value="%{RBean.shop_idx}"/>
		<s:hidden name="r_regdate" value="%{RBean.r_regdate}"/>
		<s:textarea name="r_title" theme="simple" value="%{RBean.r_title}" cols="80" rows="1"/>
		<s:textarea name="r_content" theme="simple" value="%{RBean.r_content}" cols="80" rows="10"/>
		</div>
			<input name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb" style="margin-top:30px;padding:0px">
		<h3>${RBean.review_idx }//////</h3>
  </form>
  
  

	 
	<!-- ���丮��Ʈ ��� -->

	<div style="clear:both; width:80%; border:1px solid #d5d5d5; margin:30px;"></div>	
	
	<div class="reviewList" id="reviewList" style="width:80%;">

	<div class="reviewblock">${FDBean.shop_name}�� ����(?)</div>
	<div class="reviewblock" style="float:right; font-size:20px;">��ü(?)|���ִ�(?)|������(?)|����(?)</div>
	
	<!-- ��ϵ� ���� ����Ʈ ��� -->
	<c:forEach items="${RevList}" var="RevList" varStatus="status">
		<!-- ������ -->	
		<div class="reviewContent" style="width:100%; margin-top:20px;">
			<!-- �ۼ������� -->
			<div class="r_memberInfo" style="width:10%;">
				<span class="m_image"></span>
				<span class="r_content">${RevList.member_nicname}</span>
			</div>
			<!-- ���䳻�� -->
			<div class="r_content" style="width:70%;" >
				<span class="gray">${RevList.r_regdate}</span>
				<span class="r_title" ><strong>${RevList.r_title}</strong>&nbsp;</span>
				<br>
				<span>${RevList.r_content }</span>
			</div>
			<!-- �� / �������-->
			
			<div class="r_pyungga" style="width:10%;">
				<c:if test="${RevList.r_pungga} == '1'">
					<span class="category_bt" onclick="setPungga('1')">
  				<em class="pungga_good icon" id="good"></em>
  				<span style="color:gray;" id="good_t">���ִ�</span>
  			</span>
				</c:if>
			</div>	
<%-- 				<div class="r_pyungga" style="width:10%;" id="r_pyungga">
					<input type="hidden" name="countPungga" value="${RevList.r_pungga}">${RevList.r_pungga}
				
				
				
				</div>	


<s:if test="resultClass == NULL">
			<div class="category_bt <c:if test="${keyword eq 'ġŲ'}">selected</c:if>" onclick="menuSearch('ġŲ');">
				<em class="c7 icon"></em>
				<div class="icon_title">ġŲ</div>
			</div> --%>
				
		</div>
		
		<div style="clear:both; width:100%; border:1px solid #d5d5d5;"></div>
		
	</c:forEach>
	</div>
	

</div>

</center>

</body>
</html>