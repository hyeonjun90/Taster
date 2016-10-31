<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요즘뜨는 식당 리스트</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<link rel="stylesheet" href="/Taster/css/style.css" />
<style>
	.clearDiv{	clear:both;	}
	
	.icon { width: 70px; height: 70px; display: inline-block; background-repeat: no-repeat; cursor: pointer; }
	
	.category_bt{ width: 80px; height: 80px; float: left; text-align: center; background: white; border-radius: 60px;margin: 10px 23px 10px; /* 탑 왼 바텀 오 */border: 7px solid white;padding-top: 0px; }
	.icon_title{ font-size: 13px; font-weight: 600; margin-top: -10px; font-family : 'Noto Sans', sans-serif;}
	.category_bt:hover{ border: 7px solid #DDE5B8; padding-top: 0px; }


	.hotList div {font-family : 'Noto Sans', sans-serif; }
	.shopInfo div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif;}
	.title { font-size: 18px; color:#555; font-weight:bold;}
	.r_score { font-size: 18px; color:orange; font-weight:bold; }
	.shop_addr {width:600px;float:left;text-align:left; color:#a6a6a6; font-size:13px;}
	.r_content {padding: 10px; font-size: 12px; float:left; width: 600px; text-align:left; margin-top:10px;}
	.favorite {background-image: url('/Taster/images/fav.png'); 
    			 width: 52px; height: 31px; background-size: 32px 31px; background-repeat: no-repeat; 
    			 background-position:50% 0%; float:right;padding-top:30px;}
    .favorite:hover { background-image: url('/Taster/images/fav_check.png'); }
    .m_image { width:25px; height: 24px; border-radius: 20px; display:block; float: left;
    	 background:url('/Taster/images/basic_profile.png') no-repeat; background-size:32px 32px; margin-right:5px;}
</style>

<script>

var currentPage = 1;
var fTotalCount = ${fTotalCount};
	
	function init() {
		if(fTotalCount <= 3) {
			$("#readMore").css("display", "none");
		}
	}

	function readMore() {
		currentPage += 1;
		fTotalCount -= 3; // 페이지 개수
		$.ajax({
			url: "foodsMenuListMore.action",
			type: "POST",
			async:true,
			dataType: "Text", 
			data: {"currentPage": currentPage },
			success: function(data) {
				//alert(data);
				
				$("#hotList").append(data);
				if(fTotalCount <= 3) {
					$("#readMore").css("display", "none");
				}
			}
			
		});
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
</head>
<body onload="init();">
<center>
<div style="width:100%;min-height:500px;margin-top:40px;">

	<div class="hotList" id="hotList" style="width:830px;">
	<c:forEach items="${fList}" var="fList" varStatus="status">
		<div class="shopInfo" style="width:810px;margin-top:20px;"
		onclick="location.href='foodsDetailView.action?shop_idx=${fList.shop_idx }'" style="cursor:pointer;">
			<div style="background-image:url('/Taster/images/shop/${fList.file_savname}');
					background-repeat: no-repeat; display:block; 
					width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
			</div>
			<div style="float:left; width:550px; text-align:left;">
				<span class="title">${status.index + 1}. ${fList.shop_name}</span>
				<span class="r_score">${fList.avg_r_score }</span>
			</div>
			
			<div id="favorite_${fList.shop_idx}" class="favorite"
						 style="<c:forEach items="${bookList}" var="bookList">
									<c:if test="${bookList eq fList.shop_idx }">
						 			background-image:url('/Taster/images/fav_check.png');padding-top:30px;
						 			</c:if>
						 			<c:if test="${bookList ne fList.shop_idx }">
						 				padding-top:30px;
									</c:if>
								</c:forEach>
								"<c:if test="${!empty session.member_id}">
									onclick="bookMark('${fList.shop_idx}');"
								</c:if>
								<c:if test="${empty session.member_id}">
									onclick="javascript:alert('로그인 후에 이용 가능합니다.');"
								</c:if>
			>
			<font style="font-size:11px;">즐겨찾기</font>
			</div>
			
			<div class="shop_addr">${fList.shop_addr1 } ${fList.shop_addr2 } ${fList.shop_addr3 } ${fList.shop_addr4 }</div>
			<div class="r_content" >
				<div class="m_image">
				</div>
				<strong>${fList.member_nicname }</strong>&nbsp;
				${fn:substring(fList.r_content, 0, 150) }...
			</div>
		</div>
		<div style="width:300px; text-align:right; float:right;font-size:11px;color:#a6a6a6;"> >>${fList.shop_name} 정보 더보기</div>
		<div style="clear:both; height:10px;"></div>		
		<div style="clear:both; width:800px; border:1px solid #d5d5d5;"></div>
		
	</c:forEach>
	</div>
		<c:if test="${fTotalCount > 0 }">
			<div id="readMore" style="width:500px;height:50px;cursor:pointer" onclick="readMore();"><h2>▽더보기</h2></div>
		</c:if>
</div>
</center>
</body>
</html>