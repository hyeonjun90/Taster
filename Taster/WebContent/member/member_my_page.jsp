<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이페이지</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<link rel="stylesheet" href="/Taster/css/style.css"/>
<style>
   .clearDiv{   clear:both;   }
   .shopInfo {   border:1px solid #d5d5d5; width:300px; height:150px; margin:20px; float:left; text-align:center;
    box-sizing:border-box; vertical-align: middle}
    .shopInfo span {vertical-align: middle; position:relative; color:#000; font-size:18px; font-weight:bold;
              margin-top:50px;  }
   .shopKind {width:99%;margin-top:25px;margin-left:10px;text-align:left;font-size:14px;color:#ff792a;font-weight:bold;}
   .line { border-left:2px solid #FF9900;}
   #tblForm tr td {border:1px solid blue; width: 525px;}
</style>
<style>
<style>
	.clearDiv{	clear:both;	}
	.c1 {background:url('http://itvplus5.cafe24.com/img/category/c01.png');}
	.c2 {background:url(http://itvplus5.cafe24.com/img/category/c02.png);}
	.c3 {background:url(http://itvplus5.cafe24.com/img/category/c03.png);}
	.c4 {background:url(http://itvplus5.cafe24.com/img/category/c12.png);}
	.c5 {background:url(http://itvplus5.cafe24.com/img/category/c04.png);}
	.c6 {background:url(http://itvplus5.cafe24.com/img/category/c05.png);}
	.c7 {background:url(http://itvplus5.cafe24.com/img/category/c06.png);}
	.c8 {background:url(http://itvplus5.cafe24.com/img/category/c07.png);}
	.c9 {background:url(http://itvplus5.cafe24.com/img/category/c08.png);}
	.c10 {background:url(http://itvplus5.cafe24.com/img/category/c09.png);}
	.c11 {background:url(http://itvplus5.cafe24.com/img/category/c11.png);}
	.c12 {background:url(http://itvplus5.cafe24.com/img/category/c10.png);}
	
	.icon { width: 70px; height: 70px; display: inline-block; background-repeat: no-repeat; cursor: pointer; }
	
	.category_bt{ width: 80px; height: 80px; float: left; text-align: center; background: white; border-radius: 60px;margin: 10px 23px 10px; /* 탑 왼 바텀 오 */border: 7px solid white;padding-top: 0px; }
	.icon_title{ font-size: 13px; font-weight: 600; margin-top: -10px; font-family : 'Noto Sans', sans-serif;}
	.category_bt:hover{ border: 7px solid #DDE5B8; padding-top: 0px; }


	.myPageList div {font-family : 'Noto Sans', sans-serif; }
	.shopInfo div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif;}
	.title { font-size: 18px; color:#555; font-weight:bold;}
	.r_score { font-size: 18px; color:orange; font-weight:bold; }
	.shop_addr {width:500px;float:left;text-align:left; color:#a6a6a6; font-size:13px;}
	.r_content {padding: 10px; font-size: 12px; float:left; width: 500px; text-align:left; margin-top:10px;}
	.favorite {   
    width: 32px;
    height: 31px;}
    .m_image { width:25px; height: 24px; border-radius: 20px; display:block; float: left;
    	 background:url('/Taster/images/basic_profile.png') no-repeat; background-size:32px 32px; margin-right:5px;}
</style>

<script>

var currentPage = 1;
var fTotalCount = ${fTotalCount};

	function reviewReadMore() {
		currentPage += 1;
		fTotalCount -= 3; // 페이지 개수
		$.ajax({
			url: "reviewListMore.action",
			type: "POST",
			async:true,
			dataType: "Text", 
			data: {"currentPage": currentPage },
			success: function(data) {
				//alert(data);
				
				$("#hotList").append(data);
				if(fTotalCount < 1) {
					$("#readMore").css("display", "none");
				}
			}
			
		});
	}
	
	function bookmarkReadMore() {
		currentPage += 1;
		fTotalCount -= 3; // 페이지 개수
		$.ajax({
			url: "bookmarkListMore.action",
			type: "POST",
			async:true,
			dataType: "Text", 
			data: {"currentPage": currentPage },
			success: function(data) {
				//alert(data);
				
				$("#hotList").append(data);
				if(fTotalCount < 1) {
					$("#readMore").css("display", "none");
				}
			}
			
		});
	}
</script>
</head>

<body>
<div class="top_module"></div>

<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='shopAdd.action'">식당등록</td>
		<td onclick="location.href='qWrite.action'">문의하기</td>
	</tr>
</table>


<div style="width:100%;">
<table style="width:1050px;" id="tblForm">
	<tr>
		<td>
			<div class="shopKind">MY REVIEW RESTAURANT</div>
		</td>
			<td>
		<div class="shopKind">MY BOOKMARK RESTAURANT</div>
		</td>
	</tr>

	<tr>
		<td>
		<div style="width:520px; height:300px;text-align:center; margin:0px auto;">
			<div style="width:100%;min-height:500px;margin-top:40px;" border="1">

				<div class="myPageList" id="myPageList" style="width:510px;">
				<c:forEach items="${rList}" var="rList" varStatus="status">
				<div class="shopInfo" style="width:510px;margin-top:20px;">
					<div style="background-image:url('/Taster/images/shop/${rList.file_savname}');
						background-repeat: no-repeat; display:block; 
						width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
					</div>
					<div style="float:left; width:360px; text-align:left;">
						<span class="title">${status.index + 1}. ${rList.shop_name}</span>
						<span class="r_score">${rList.avg_r_score }</span>
					</div>
					<div style="float:right;" class="favorite">별</div>
					<div class="shop_addr">${rList.shop_addr1 } ${rList.shop_addr2 } ${rList.shop_addr3 } ${rList.shop_addr4 }</div>
					<div class="r_content" >
						<div class="m_image">
						</div>
						<strong>${rList.member_nicname }</strong>&nbsp;
						${rList.r_content }
					</div>
				</div>
				<div style="clear:both; height:10px;"></div>		
				<div style="clear:both; width:510px; border:1px solid #d5d5d5;"></div>
				</c:forEach>
			</div>
			<c:if test="${shopTotalCount > 0 }">
				<div id="readMore" style="width:500px;height:50px;" onclick="reviewReadMore();"><h2>▽더보기</h2></div>
			</c:if>
			</div>
		</div>
		</td>
	
		<td class="line">
		<%-- <div style="width:510px; height:300px;text-align:center; margin:0px auto;">
		
			<div style="width:100%;min-height:500px;margin-top:40px;">

			<div class="myPageList" id="myPageList" style="width:50px;">
			<c:forEach items="${bList}" var="bList" varStatus="status">
				<div class="shopInfo" style="width:510px;margin-top:20px;">
				<div style="background-image:url('/Taster/images/shop/${bList.file_savname}');
						background-repeat: no-repeat; display:block; 
						width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
				</div>
				<div style="float:left; width:360px; text-align:left;">
					<span class="title">${status.index + 1}. ${bList.shop_name}</span>
					<span class="r_score">${bList.avg_r_score }</span>
				</div>
				<div style="float:right;" class="favorite">별</div>
				<div class="shop_addr">${bList.shop_addr1 } ${bList.shop_addr2 } ${bList.shop_addr3 } ${bList.shop_addr4 }</div>
				<div class="r_content" >
					<div class="m_image">
					</div>
					<strong>${bList.member_nicname }</strong>&nbsp;
					${bList.r_content }
				</div>
				</div>
				<div style="clear:both; height:10px;"></div>		
				<div style="clear:both; width:510px; border:1px solid #d5d5d5;"></div>
		
			</c:forEach>
			</div>
			<c:if test="${shopTotalCount > 0 }">
				<div id="readMore" style="width:500px;height:50px;" onclick="bookmarkReadMore();"><h2>▽더보기</h2></div>
			</c:if>
			</div>
		</div> --%>
		</td>
	</tr>
</table>
</div>
</body>
</html>