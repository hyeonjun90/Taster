<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<link rel="stylesheet" href="/Taster/css/style.css" />
</head>
<style>
	.clearDiv{	clear:both;	}
	.icon { width: 70px; height: 70px; display: inline-block; background-repeat: no-repeat; cursor: pointer; }
	
	.category_bt{ width: 80px; height: 80px; float: left; text-align: center; background: white; border-radius: 60px;margin: 10px 23px 10px; /* ž �� ���� �� */border: 7px solid white;padding-top: 0px; }
	.icon_title{ font-size: 13px; font-weight: 600; margin-top: -10px; font-family : 'Noto Sans', sans-serif;}
	.category_bt:hover{ border: 7px solid #DDE5B8; padding-top: 0px; }
	.selected { border: 7px solid #DDE5B8; padding-top: 0px; }

	.menuList div {font-family : 'Noto Sans', sans-serif; }
	.shopInfo div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif;}
	.title { font-size: 18px; color:#555; font-weight:bold; cursor:pointer;}
	.r_score { font-size: 18px; color:orange; font-weight:bold; }
	.shop_addr {width:600px;float:left;text-align:left; color:#a6a6a6; font-size:13px; }
	.r_content {padding: 10px; font-size: 12px; float:left; width: 600px; text-align:left; margin-top:10px;}
	.favorite {   
    width: 32px;
    height: 31px;}
   
    .m_image { width:30px; height: 30px; border-radius: 30px; display:block; float: left;
    	  background:url('/Taster/images/basic_profile.png') no-repeat; background-size:36px 36px; margin-right:5px;}
    	 
	#VIEW { background: url(http://itvplus5.cafe24.com/img/map/map.png);width: 250px;height: 290px;font-size: 11px;float: left;background-size: 250px 290px;margin-left: 16px; }
	#VIEW span{color: #939393;font-family: NanumGothic;cursor: pointer;text-shadow: 1px 1px 1px #FFF;position: absolute;font-weight: bold;font-size: 10px;}
	#VIEW span:hover { color: #ff3300;	}
	#MAP { height: 315px;padding: 20px 10px 0px;margin-right: 30px;width: 941px;margin: 35px auto; background-color:#f3f3f3;}
	#icon { background: url(http://itvplus5.cafe24.com/img/map/icon.svg);width: 25.584px;height: 39.582px;display: block;float: left;margin-top: -10px;margin-right: 5px;margin-left: 10px; }
	#submsg {color:#777; font-size:10px;}
	#context_title { height: 40px; width: 150px; float: left; position: absolute; line-height: 40px; font-size: 10px; text-align: center; background: #DF1E37;margin: 0px 0px 0px 50px; color:#fff }
	#context_title span {font-size:13px; font-weight:bold;}
	#context { background: rgba(255, 255, 255, 0.8); width: 480px; height: 190px; margin: 30px 0px 0px 25px; border: 2px solid #DF1E37; float: left; padding: 25px; }
	#context div { width:80px; height: 20px; font-size: 11px; font-weight: bold; font-family: "NanumGothic"; text-align: center; float:left; }
	#from { color: #ff3300; }
	.area_selected { color: #ff3300; }
	.gugun { cursor:pointer; vertical-align:middle; text-align:center; padding-top:7px; }
	.gugun:hover { background-color:#ff3300; color: #fff;}
	.favorite {background-image: url('/Taster/images/fav.png'); 
    			 width: 52px; height: 31px; background-size: 32px 31px; background-repeat: no-repeat; 
    			 background-position:50% 0%; float:right;padding-top:30px;}
    .favorite:hover { background-image: url('/Taster/images/fav_check.png'); }
    .m_image { width:30px; height: 30px; border-radius: 30px; display:block; float: left;
    	  background:url('/Taster/images/basic_profile.png') no-repeat; background-size:36px 36px; margin-right:5px;}
</style>

<script>
var currentPage = 1;
var fTotalCount = ${fTotalCount};
var beforeThis = "";
//alert(fTotalCount);
	function init() {
		searchArea('����', document.getElementById("start"), '1');
		if(fTotalCount <= 3) {
			$("#readMore").css("display", "none");
		}
	}
	function readMore() {
		currentPage += 1;
		fTotalCount -= 3; // ������ ����
		$.ajax({
			url: "foodsMenuListMore.action",
			type: "POST",
			async:true,
			dataType: "Text", 
			data: {"currentPage": currentPage },
			success: function(data) {
				//alert(data);
				//alert(fTotalCount);
				$("#menuList").append(data);
				if(fTotalCount <= 3) {
					$("#readMore").css("display", "none");
				}
			}
			
		});
	}
	
	function menuSearch(keyword, div) {
		searchForm = document.searchForm;
		searchForm.keyword.value = keyword;
		searchForm.submit();
	}
	function searchArea(area, span, startNum) {
		
		if(beforeThis != "" && beforeThis.style.color == "red") {
			beforeThis.style.color = "#939393";
		}
		span.style.color = "red";
		beforeThis = span;
		
		$("#area").html(area);
		$("#context").html("<center><img src='/Taster/images/loader.gif'/></center>");
		$.ajax({
			url: "foodsAreaSearch.action",
			type: "POST",
			async:true,
			dataType: "Text", 
			data: {"sido": encodeURIComponent(area), "startNum": startNum },
			success: function(data) {
				$("#context").html(data);

			}
		});
	}
	
	function foodsAreaListSearch(gugun) {
		$(".gugun").css("backgroundColor", "");
		$(".gugun").css("color", "black");
		document.getElementById(gugun).style.backgroundColor = "red";
		document.getElementById(gugun).style.color = "white";
		$("#menuWrap").html("<center><img src='/Taster/images/loader.gif'/></center>");
		$.ajax({
			url: "foodsAreaListSearch.action",
			type: "POST",
			async:true,
			dataType: "Text", 
			data: {"gugun": encodeURIComponent(gugun) },
			success: function(data) {
				$("#menuWrap").html(data);

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
<body onload="init();">
<div id="MAP" class="frame">
	<div>
		<em id="icon"></em>
		<span style="color:#DF1E37;font-family:NanumGothicB;">������</span>
		����ã��
		<span id="submsg">  �������� ������ ������ �� ���������� �������ּ���.</span>
	</div>
	<div id="VIEW" style="">
		<span title="����Ư����ġ��" class="from" style="margin: 256px 0px 0px 38px;" onclick="searchArea('����', this, '0');">����</span>
		<span title="���󳲵�" class="from" style="margin: 200px 0px 0px 60px;" onclick="searchArea('����', this, '0');">����</span>
		<span title="�λ걤����" class="from" style="margin: 188px 0px 0px 185px;" onclick="searchArea('�λ�', this, '0');">�λ�</span>
		<span title="��걤����" class="from" style="margin: 165px 0px 0px 195px;" onclick="searchArea('���', this, '0');">���</span>
		<span title="��󳲵�" class="from" style="margin: 175px 0px 0px 133px;" onclick="searchArea('�泲', this, '0');">�泲</span>
		<span title="���ֱ�����" class="from" style="margin: 184px 0px 0px 42px;" onclick="searchArea('����', this, '0');">����</span>
		<span title="����ϵ�" class="from" style="margin: 147px 0px 0px 59px;" onclick="searchArea('����', this, '0');">����</span>
		<span title="�뱸������" class="from" style="margin: 145px 0px 0px 141px;" onclick="searchArea('�뱸', this, '0');">�뱸</span>
		<span title="���ϵ�" class="from" style="margin: 110px 0px 0px 148px;" onclick="searchArea('���', this, '0');">���</span>
		<span title="����������" class="from" style="margin: 115px 0px 0px 75px;" onclick="searchArea('����', this, '0');">����</span>
		<span title="��û����" class="from" style="margin: 92px 0px 0px 45px;" onclick="searchArea('�泲', this, '0');">�泲</span>
		<span title="����Ư����ġ��" class="from" style="margin:105px 0px 0px 55px" onclick="searchArea('����', this, '0');">����</span>
		<span title="��û�ϵ�" class="from" style="margin: 87px 0px 0px 87px;" onclick="searchArea('���', this, '0');">���</span>
		<span title="��⵵" class="from" style="margin: 65px 0px 0px 58px;" onclick="searchArea('���', this, '0');">���</span>
		<span title="������" class="from" style="margin: 48px 0px 0px 120px;" onclick="searchArea('����', this, '0');">����</span>
		<span title="��õ������" class="from" style="margin: 48px 0px 0px 50px;" onclick="searchArea('��õ', this, '0');">��õ</span>
		<span title="����Ư����" id="start" class="from" style="margin: 41px 0px 0px 69px;" onclick="searchArea('����', this, '0');">����</span>
	</div><!-- <c:if test="${selected eq '����'}">color:red;</c:if> -->
	
	<div style="display: block; width:450px; margin-left:50px; height:250px; float:left;">
			<div id="context_title"><span id="area">����</span> ����ã��</div>
			<div id="context">
			</div>
	</div>
</div>	
<div style="width:941px; margin:0px auto;" id="menuWrap">
	<div class="menuList" id="menuList" style="width:830px; margin:0px auto;">
	
	<c:forEach items="${fList}" var="fList" varStatus="status">
		<div class="shopInfo" style="width:810px;margin-top:20px;">
			<div style="background-image:url('/Taster/images/shop/${fList.file_savname}');
					background-repeat: no-repeat; display:block; 
					width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
			</div>
			<div style="float:left; width:550px; text-align:left;"
				onclick="location.href='foodsDetailView.action?shop_idx=${fList.shop_idx }'" style="cursor:pointer;">
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
									onclick="javascript:alert('�α��� �Ŀ� �̿� �����մϴ�.');"
								</c:if>
			>
			<font style="font-size:11px;">���ã��</font>
			</div>
			<div class="shop_addr">${fList.shop_addr1 } ${fList.shop_addr2 } ${fList.shop_addr3 } ${fList.shop_addr4 }</div>
			<div class="r_content" >
				<div class="m_image">
				</div>
				<strong>${fList.member_nicname }</strong>&nbsp;
				${fn:substring(fList.r_content, 0, 150) }...
			</div>
		</div>
		<div style="width:300px; text-align:right; float:right;font-size:11px;color:#a6a6a6;"> 
			<span onclick="location.href='foodsDetailView.action?shop_idx=${fList.shop_idx }'" style="cursor:pointer;">
				>>${fList.shop_name} ���� ������
			</span>
		</div>
		<div style="clear:both; height:10px;"></div>		
		<div style="clear:both; width:800px; border:1px solid #d5d5d5;"></div>
		
	</c:forEach>
	</div>
		<c:if test="${empty fList }">
			<div id="" style="width:500px;height:50px;margin-top:30px;"><h2>��ϵ� �Ĵ� ������ �����ϴ�.</h2></div>
		</c:if>
		<c:if test="${fTotalCount > 0 }">
			<div id="readMore" style="width:500px;height:50px;margin:0px auto;text-align:center;">
				<h2 style="cursor:pointer;" onclick="readMore();">�������</h2>
			</div>
		</c:if>
</div>		
</body>
</html>