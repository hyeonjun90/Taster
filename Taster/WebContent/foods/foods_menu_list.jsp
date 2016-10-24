<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>업종별 맛집 리스트</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<title>Insert title here</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
<style>
	.clearDiv{	clear:both; }
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
	
	.cat_select{ border: 7px solid #ABC1DF; padding-top: 0px; }

	.menuList div {font-family : 'Noto Sans', sans-serif; }
	.shopInfo div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif;}
	.title { font-size: 18px; color:#555; font-weight:bold;}
	.r_score { font-size: 18px; color:orange; font-weight:bold; }
	.shop_addr {width:600px;float:left;text-align:left; color:#a6a6a6; font-size:13px;}
	.r_content {padding: 10px; font-size: 12px; float:left; width: 600px; text-align:left; margin-top:10px;}
	.favorite {   
    width: 32px;
    height: 31px;}
    .m_image { width:25px; height: 24px; border-radius: 20px; display:block; float: left;
    	 background:url('/Taster/images/basic_profile.png') no-repeat; background-size:32px 32px; margin-right:5px;}
</style>

<script>
	function init() {
		alert("${fTotalCount}");
	}
</script>
</head>
  
<body onload="init();">
<center>
<div style="width:100%;min-height:500px;margin-top:40px;">

	<div style="width:900px;height:220px;background: #F3F3F3;padding: 10px 0px 20px;border: 1px solid #E6E3E3;text-align:center;">
	
		<div style="width:848px;margin:0px auto;">
			<div class="category_bt">
				<em class="c1 icon"></em>
				<div class="icon_title">한식</div>
			</div>
			<div class="category_bt">
				<em class="c2 icon"></em>
				<div class="icon_title">양식</div>
			</div>
			<div class="category_bt">
				<em class="c3 icon"></em>
				<div class="icon_title">일식</div>
			</div>
			<div class="category_bt">
				<em class="c4 icon"></em>
				<div class="icon_title">중식</div>
			</div>
			<div class="category_bt">
				<em class="c5 icon"></em>
				<div class="icon_title">분식</div>
			</div>
			<div class="category_bt">
				<em class="c6 icon"></em>
				<div class="icon_title">해산물</div>
			</div>
			<div class="clearDiv"></div>
			
			
			<div class="category_bt">
				<em class="c7 icon"></em>
				<div class="icon_title">치킨</div>
			</div>
			<div class="category_bt">
				<em class="c8 icon"></em>
				<div class="icon_title">주류</div>
			</div>
			<div class="category_bt">
				<em class="c9 icon"></em>
				<div class="icon_title">제빵</div>
			</div>
			<div class="category_bt">
				<em class="c10 icon"></em>
				<div class="icon_title">육류</div>
			</div>
			<div class="category_bt">
				<em class="c11 icon"></em>
				<div class="icon_title">카페</div>
			</div>
			<div class="category_bt">
				<em class="c12 icon"></em>
				<div class="icon_title">이색</div>
			</div>
			<div class="clearDiv"></div>
		</div>
	</div>
	
	<div class="menuList" style="width:830px;">
	<c:forEach items="${fList}" var="fList" varStatus="status">
		<div class="shopInfo" style="width:810px;margin-top:20px;">
			<div style="background-image:url('/Taster/images/shop/${fList.file_savname}');
					background-repeat: no-repeat; display:block; 
					width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
			</div>
			<div style="float:left; width:550px; text-align:left;">
				<span class="title">${status.index + 1}. ${fList.shop_name}</span>
				<span class="r_score">${fList.avg_r_score }</span>
			</div>
			<div style="float:right;" class="favorite">별</div>
			<div class="shop_addr">${fList.shop_addr1 } ${fList.shop_addr2 } ${fList.shop_addr3 } ${fList.shop_addr4 }</div>
			<div class="r_content" >
				<div class="m_image">
				</div>
				<strong>${fList.member_nicname }</strong>&nbsp;
				${fList.r_content }
			</div>
		</div>
		<div style="clear:both; height:10px;"></div>		
		<div style="clear:both; width:800px; border:1px solid #d5d5d5;"></div>
		<div class="shopInfo" style="width:810px;margin-top:20px;">
			<div style="background-image:url('/Taster/images/shop/${fList.file_savname}');
					background-repeat: no-repeat; display:block; 
					width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
			</div>
			<div style="float:left; width:550px; text-align:left;">
				<span class="title">${status.index + 1}. ${fList.shop_name}</span>
				<span class="r_score">${fList.avg_r_score }</span>
			</div>
			<div style="float:right;" class="favorite">별</div>
			<div class="shop_addr">${fList.shop_addr1 } ${fList.shop_addr2 } ${fList.shop_addr3 } ${fList.shop_addr4 }</div>
			<div class="r_content" >
				<div class="m_image">
				</div>
				<strong>${fList.member_nicname }</strong>&nbsp;
				${fList.r_content }
			</div>
		</div>
		<div style="clear:both; height:10px;"></div>		
		<div style="clear:both; width:800px; border:1px solid #d5d5d5;"></div>
	</c:forEach>
	</div>
</div>
</center>
</body>
</html>







