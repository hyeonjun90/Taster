<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당명 - 상세보기</title> <!-- 식당명 뜨게 변경 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<link rel="stylesheet" href="/Taster/css/style.css" />


<style>
	.clearDiv{	clear:both; }


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
	.reviewList div {font-family : 'Noto Sans', sans-serif; border:1px solid black;}
	.reviewContent div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif; }
	.title { font-size: 30px; color:#555; font-weight:bold;}
	.r_score { font-size: 30px; color:orange; font-weight:bold; }
	.subject {float:left; width: 400px; float:left;text-align:left; font-size:15px; height:300px;}
	.r_memberInfo{padding: 10px; font-size: 12px; float:left; text-align:left; margin-top:10px;}
	.r_content {padding: 10px; font-size: 12px; float:left; text-align:left; margin-top:10px;}
	.r_pyungga {font-size: 25px; color:orange; float:right; margin:5px; font-weight:bold; margin-top:10px;}
	.favorite {width: 80px;height: 80px; background-size:80px 80px;padding-top:5px;float:right;}
    .reviewblock {font-size: 25px; color:orange; float:left; margin:5px; font-weight:bold;}
    
    .m_image { width:32px; height: 32px; border-radius: 20px; display:block; float: left;
    	 background:url('/Taster/images/basic_profile.png') no-repeat; background-size:32px 32px; margin:5px;}
    	 
    .gray{float:left;text-align:left; color:#a6a6a6; font-size:13px;}
    .r_title{ margin-left:10px; text-align:left; color:#555; font-size:13px;}
</style>
</head>

<body>
<center>
<div style="width:100%;min-height:500px;margin-top:40px;">

	<!-- 사진 미리보기 뜨기 -->
	<div style="text-align:left; width:100%;">이거 사진 반복되어서 나오게 코드 고쳐줘 ㅜㅜ</div>
	<div style="background-image:url('/Taster/images/shop/${FDBean.file_savname}');
				width:300px;height:300px;background-size:300px 300px;padding-top:5px;float:left;"></div>
					
<%-- 	<div style="width:1000px; height:240px; float:left;">
		<img src="/Taster/images/shop/${FDBean.file_savname}">
	</div> --%>
	
	<div class="clearDiv"></div>
	
	<!-- 가계정보 -->
	<div class="foodDetail" style="width:80%;  float:center; margin:100px auto;">
		<div style="float:left; width:90%; text-align:left;">
			<span class="title">${FDBean.shop_name}</span> <!-- 가게이름 -->
			<span class="r_score">${FDBean.avg_r_score}</span> <!-- 평점 평균 -->
			<br>
			<span class="gray">눈${FDBean.shop_readCount} 펜${rTotalCount} 별{즐겨찾기수}</span>
		</div>
		
		<!-- 즐겨찾기 추가 -->
		<div style="background-image:url('/Taster/images/star.jpg');background-repeat: no-repeat; display:block;" class="favorite">즐겨찾기</div>
		
		<!-- 구분선 -->
		<div style="clear:both; width:100%;float:left; border:1px solid #d5d5d5;"></div>
		
		<!-- 가게정보 표시 -->
		<div class="subject">
			 <span style="float:left; width:100px; color:#a6a6a6;" >주소 : </span><span style="float:right;width:300px;"> ${FDBean.shop_addr1 } ${FDBean.shop_addr2 } ${FDBean.shop_addr3 } ${FDBean.shop_addr4 }</span>
			 <span style="float:left; width:100px; color:#a6a6a6;" >전화번호 : </span><span style="float:right;width:300px;">${FDBean.shop_tel }</span>
			 <span style="float:left; width:100px; color:#a6a6a6;" >음식 종류 : </span><span style="float:right;width:300px;">${FDBean.shop_kind }</span> 
			 <span style="float:left; width:100px; color:#a6a6a6;" >가격대 : </span><span style="float:right;width:300px;">${FDBean.shop_price }</span>
			 <span style="float:left; width:100px; color:#a6a6a6;" >휴일 : </span><span style="float:right;width:300px;">${FDBean.shop_holiday }</span> 
		</div>
		
		<!-- 지도 -->
		<div style="background-image:url('/Taster/images/map.jpg');
					background-repeat: no-repeat; display:block; 
					width:300px;height:300px;background-size:300px 300px;padding-top:5px;float:right;"></div>
		<!-- 구분선 -->
		<div style="clear:both; width:100%; border:1px solid #d5d5d5;"></div>
	
	</div>
	
	<div style=" width:100%; height:100px;">리뷰작성블록 만드는중...</div>
	
	<!-- 리뷰리스트 블록 -->
	<div class="reviewList" id="reviewList" style="width:80%;">
	<div class="reviewblock">${FDBean.shop_name}의 리뷰(?)</div>
	<div class="r_pyungga">전체(?)|맛있다(?)|괜찮다(?)|별로(?)</div>
	
	<!-- 등록된 리뷰 리스트 출력 -->
	<c:forEach items="${RevList}" var="RevList" varStatus="status">
		<!-- 리뷰블록 -->
		<div class="reviewContent" style="float:left;width:100%	;margin-top:20px;">
			<!-- 작성자정보 -->
			<div class="r_memberInfo" style="width:10%;">
				<span class="m_image"></span>
				<span class="r_content">${RevList.member_nicname}</span>
			</div>
			<!-- 리뷰내용 -->
			<div class="r_content" style="width:70%;" >
				<span class="gray">${RevList.r_regdate}</span>
				<span class="r_title" ><strong>${RevList.r_title}</strong>&nbsp;</span>
				<br>
				<span>${RevList.r_content }</span>
			</div>
			<!-- 평가 / 만드는중-->
			<div class="r_pyungga" style="width:10%;">${RevList.r_pungga}</div>	
			
				
		</div>
		
		<div style="clear:both; width:100%; border:1px solid #d5d5d5;"></div>
		
	</c:forEach>
	</div>
	

</div>

</center>

</body>
</html>