<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당명 - 상세보기</title> <!-- 식당명 뜨게 변경 -->
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

function bookMark(shop_idx) {
	$.ajax({
		url: "insertBookMark.action",
		type: "POST",
		async:true,
		dataType: "Text", 
		data: {"shop_idx": shop_idx },
		success: function(data) {
			//alert(data);
			var bk = data.split("|");
			if(bk[0].trim() == "0") {
				favId = "#favorite_"+bk[1];
				$(favId).css("background-image", "url('/Taster/images/fav_check.png')");
			} else {
				favId = "#favorite_"+bk[1];
				$(favId).css("background-image", "url('/Taster/images/fav.png')");
			}
			
			
		}
		
	});
}

</script>


<style>
	.clearDiv{	clear:both; }

    .category_bt{ width: 50px; height: 80px; float: left; text-align: center; background: white; 
    			margin:10px 10px 10px 30px; /* 탑 왼 바텀 오 */border: 7px solid white;padding-top: 0px; }
	.pungga_good {background:url('/Taster/images/shop/good_org.jpg');}
	.pungga_soso {background:url('/Taster/images/shop/soso_org.jpg');}
	.pungga_bad {background:url('/Taster/images/shop/bad_org.jpg');}
	
	.pungga_good2 {background:url('/Taster/images/shop/good.jpg');}
	.pungga_soso2 {background:url('/Taster/images/shop/soso.jpg');}
	.pungga_bad2 {background:url('/Taster/images/shop/bad.jpg');}
	
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
	.r_pyungga {font-size: 25px; color:orange; float:right; margin:10px; font-weight:bold; margin-top:10px;}
	
    .favorite {background-image: url('/Taster/images/fav.png'); 
    			 width: 60px; height: 70px; background-size: 60px 50px; background-repeat: no-repeat; 
    			 background-position:50% 0%; float:right;padding-top:30px;}
    .favorite:hover { background-image: url('/Taster/images/fav_check.png'); }
    .reviewblock {font-size: 25px; color:orange; text-align:left; margin:10px; font-weight:bold; }
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

	<!-- 사진 미리보기 뜨기 -->
	<div style="text-align:left; width:100%;"></div>
	<div style="margin:0px auto;">
	<c:forEach items="${imgList}" var="imgList" varStatus="status">
	<div id="img_${status.index }" style="background-image:url('/Taster/images/review/${imgList}');
				background-repeat:no-repeat; display:block; 
				width:250px;height:150px;background-size:250px 150px;padding-top:5px;float:left;margin:10px;">
				<font color="black"></font></div>
		<c:if test="${status.index > 4 }">
			<script>
				$("#img_${status.index }").css("display", "none");
			</script>
		</c:if>
	</c:forEach>
	</div>
	<div class="clearDiv"></div>
	<!-- 가계정보 -->
	<div class="foodDetail" style="width:80%;  float:center; margin:100px auto; ">
		<div style="float:left; width:90%; text-align:left;">
			<span class="title">${FDBean.shop_name}</span> <!-- 가게이름 -->
			<span class="r_score">${FDBean.avg_r_score}</span> <!-- 평점 평균 -->
			<br>
			<span class="gray">
			<em class="readhit icon2"></em>${FDBean.shop_readCount}
			<em class="review-write icon2"></em>${FDBean.shop_readCount}
			<em class="favorite_s icon2"></em>${FDBean.shop_readCount}
			  <span style="background-image:url('/Taster/images/review-write.jpg');background-size:30px 30px;"></span> <!-- 리뷰수 -->
			 <span style="background-image:url('/Taster/images/favorite_s.jpg');"></span> <!-- 즐겨찾기수 -->
			 </span>
		</div>
		
		<!-- 즐겨찾기 추가 -->
		<div id="favorite_${bookList}" class="favorite"
						 style="<c:forEach items="${bookList}" var="bookList">
									<c:if test="${bookList eq shop_idx }">
						 			background-image:url('/Taster/images/fav_check.png');
						 			</c:if>
						 			<c:if test="${bookList ne shop_idx || empty session.member_id}">
						 				
									</c:if>
								</c:forEach>
								padding-top:45px;"<c:if test="${!empty session.member_id}">
									onclick="bookMark('${shop_idx}');"
								</c:if>
								<c:if test="${empty session.member_id}">
									onclick="javascript:alert('로그인 후에 이용 가능합니다.');"
								</c:if>
			>
			<font style="font-size:13px;">즐겨찾기</font>
		</div>
		
		<!-- 구분선 -->
		<div style="clear:both; width:100%;float:left; border:1px solid #d5d5d5;"></div>
		
		<!-- 가게정보 표시 -->
		<div class="subject">
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >주소 : </span><span style="float:right;width:300px;margin:5px;"> ${FDBean.shop_addr1 } ${FDBean.shop_addr2 } ${FDBean.shop_addr3 } ${FDBean.shop_addr4 }</span>
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >전화번호 : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_tel }</span>
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >음식 종류 : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_kind }</span> 
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >가격대 : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_price }</span>
			 <span style="float:left; width:150px; color:#a6a6a6; margin:5px;" >휴일 : </span><span style="float:right;width:300px;margin:5px;">${FDBean.shop_holiday }</span> 
		</div>
		
		<!-- 지도 -->
		<div style="background-image:url('/Taster/images/map.jpg');
					background-repeat: no-repeat; display:block; 
					width:300px;height:200px;background-size:300px 300px;padding-top:5px;float:right;"></div>
		<!-- 구분선 -->
		<div style="clear:both; width:100%; border:1px solid #d5d5d5;"></div>
	
	</div>
	

  <!-- 댓글리뷰 작성 창 -->
   <%-- <s:if test="#session.member_id != null | #session.member_level == 3"> --%> <!-- 로그인한 이용자나 관리자만 작성 가능 -->
<div class="rblock2" style='margin-top:-80px;'>
  <div class="reviewblock" style="width:800px;margin-top:-30px;">리뷰 남기기★</div>
  
  <!-- 리뷰 작성 폼 -->
  	<form name="r_form" action="foodsReviewWrite.action" method="post" 
  				style="width:800px;" enctype="multipart/form-data">
  	 <input type="hidden" name="r_pungga"/>
  	 <input type="hidden" name="shop_idx" value="${shop_idx }" />
  	 <input type="hidden" name="member_id" value="${session.member_id }" />
  		<!-- 맛평가하기--> 
  		<div style="width:340px; height:100px; float:left; text-align:center;">
  			<span class="category_bt" onclick="setPungga('1')">
  				<em class="pungga_good icon" id="good"></em>
  				<span style="color:gray;" id="good_t">맛있다</span>
  			</span>
  			<span class="category_bt" onclick="setPungga('2')" >
  				<em class="pungga_soso icon" id="soso"></em>
  				<span style="color:gray;" id="soso_t">괜찮다</span>
  			</span>
  			<span class="category_bt" onclick="setPungga('3')">
  				<em class="pungga_bad icon" id="bad"></em>
  				<span style="color:gray;" id="bad_t">별로</span>
  			</span>
  		</div>  
  		<!-- 사진 업로드 -->
  		<div>
  		<table style="float:right; width:450px; height:120px;">
  			<tr>
				<th>사진 업로드</th>
				<td>
					<s:file label="File (1)" name="uploads"/>
					<s:file label="File (2)" name="uploads"/>
					<s:file label="FIle (3)" name="uploads"/>
				</td>
			</tr>
		</table>
		</div>
		
		<div class="clearDiv"></div>
		
		<div style="width:340px; height:20px; float:left; margin-top:-20px;">
  		별점 평가하기 : 
  			 <input type="radio" name="r_score" value="1">1
  			 <input type="radio" name="r_score" value="2">2
  			 <input type="radio" name="r_score" value="3">3
  			 <input type="radio" name="r_score" value="4">4
  			 <input type="radio" name="r_score" value="5">5
  		</div>
		<!-- 리뷰 내용 -->
		<div style="width:630px; height:150px; float:left; margin-top:20px;">
		<s:hidden name="org_review_idx" value="%{RBean.review_idx}"/>	<!-- 리뷰인덱스 -->
		<s:hidden name="review_idx" value="%{RBean.review_idx}"/>
		<s:hidden name="shop_idx" value="%{RBean.shop_idx}"/>
		<s:hidden name="r_regdate" value="%{RBean.r_regdate}"/>

		<s:textarea name="r_content" theme="simple" value="%{RBean.r_content}" cols="80" rows="10"/>
		</div>
			<input name="submit" type="submit" value="작성완료" class="inputb" style="margin-top:20px;padding:0px">
  </form>
	 
	<!-- 리뷰리스트 블록 -->

	<div style="clear:both; width:80%; margin-top:70px; border:1px solid #d5d5d5;"></div>	
	
	<div class="reviewList" id="reviewList" style="width:80%;margin-top:20px;">

	<div class="reviewblock">${FDBean.shop_name}의 리뷰(${rCntBean.rTotalCnt })</div>
	<div class="reviewblock" style="float:right; font-size:17px;">
		<font style="color:#a6a6a6;">전체</font>(${rCntBean.rTotalCnt })
		<font style="color:#a6a6a6;">&nbsp;|&nbsp;맛있다</font>(${rCntBean.rGoodCnt })
		<font style="color:#a6a6a6;">&nbsp;|&nbsp;괜찮다</font>(${rCntBean.rSosoCnt })
		<font style="color:#a6a6a6;">&nbsp;|&nbsp;별로</font>(${rCntBean.rBadCnt })
	</div>
	
	<!-- 등록된 리뷰 리스트 출력 -->
	<c:forEach items="${RevList}" var="RevList" varStatus="status">
		<!-- 리뷰블록 -->	
		<div class="reviewContent" style="width:100%; margin-top:20px;">
			<!-- 작성자정보 -->
			<div class="r_memberInfo" style="width:10%;">
				<span class="m_image" 
				<c:if test="${RevList.member_image != null }">
					style="background:url('/Taster/images/member/${RevList.member_image }') no-repeat;
							background-size: 36px 36px;" </c:if>>
				</span>
				<span class="r_content">${RevList.member_nicname}</span>
			</div>
			<!-- 리뷰내용 -->
			<div class="r_content" style="width:70%;" >
				<span class="gray">
					<fmt:formatDate value="${RevList.r_regdate}" pattern="yyyy-MM-dd"/>
				</span>
				&nbsp;&nbsp;&nbsp;
				<span>${RevList.r_content }</span>
			</div>
			<!-- 평가 / 만드는중-->
			
			<div class="r_pyungga" style="width:10%;">
				<c:if test="${RevList.r_pungga eq '1'}">
					<span class="category_bt">
  						<em class="pungga_good2 icon" id="good"></em>
  						<span id="good_t" style="font-size:15px;">맛있다</span>
  					</span>
				</c:if>
				
				<c:if test="${RevList.r_pungga eq '2'}">
					<span class="category_bt" onclick="setPungga('2')" >
		  				<em class="pungga_soso2 icon" id="soso"></em>
		  				<span id="soso_t" style="font-size:15px;">괜찮다</span>
		  			</span>
				</c:if>
				<c:if test="${RevList.r_pungga eq '3'}">
					<span class="category_bt" onclick="setPungga('3')">
		  				<em class="pungga_bad2 icon" id="bad"></em>
		  				<span id="bad_t" style="font-size:15px;">별로</span>
		  			</span>
		  		</c:if>
			</div>	

				
		</div>
		
		<div style="clear:both; width:100%; border:1px solid #d5d5d5;"></div>
		
	</c:forEach>
	</div>
	</div>

</div>

</center>

</body>
</html>