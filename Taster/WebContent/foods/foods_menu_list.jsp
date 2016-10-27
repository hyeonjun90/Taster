<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>������ ���� ����Ʈ</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<link rel="stylesheet" href="/Taster/css/style.css" />
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
	
	.category_bt{ width: 80px; height: 80px; float: left; text-align: center; background: white; border-radius: 60px;margin: 10px 23px 10px; /* ž �� ���� �� */border: 7px solid white;padding-top: 0px; }
	.icon_title{ font-size: 13px; font-weight: 600; margin-top: -10px; font-family : 'Noto Sans', sans-serif;}
	.category_bt:hover{ border: 7px solid #DDE5B8; padding-top: 0px; }
	.selected { border: 7px solid #DDE5B8; padding-top: 0px; }

	.menuList div {font-family : 'Noto Sans', sans-serif; }
	.shopInfo div {margin-left:10px; padding: 3px; font-family : 'Noto Sans', sans-serif;}
	.title { font-size: 18px; color:#555; font-weight:bold;}
	.r_score { font-size: 18px; color:orange; font-weight:bold; }
	.shop_addr {width:600px;float:left;text-align:left; color:#a6a6a6; font-size:13px;}
	.r_content {padding: 10px; font-size: 12px; float:left; width: 600px; text-align:left; margin-top:10px;}
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
//alert(fTotalCount);
	
	function init() {
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
<form action="foodsMenuList.action" name="searchForm">
	<input type="hidden" name="keyword" value=""/>
</form>
<div style="width:100%;min-height:500px;margin-top:40px;">

	<div style="width:900px;height:220px;background: #F3F3F3;padding: 10px 0px 20px;border: 1px solid #E6E3E3;text-align:center;">
	
		<div style="width:848px;margin:0px auto;">
			<div class="category_bt <c:if test="${keyword eq '�ѽ�'}">selected</c:if>" onclick="menuSearch('�ѽ�', this);">
				<em class="c1 icon"></em>
				<div class="icon_title">�ѽ�</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '���'}">selected</c:if>" onclick="menuSearch('���');">
				<em class="c2 icon"></em>
				<div class="icon_title">���</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '�Ͻ�'}">selected</c:if>" onclick="menuSearch('�Ͻ�');">
				<em class="c3 icon"></em>
				<div class="icon_title">�Ͻ�</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '�߽�'}">selected</c:if>" onclick="menuSearch('�߽�');">
				<em class="c4 icon"></em>
				<div class="icon_title">�߽�</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '�н�'}">selected</c:if>" onclick="menuSearch('�н�');">
				<em class="c5 icon"></em>
				<div class="icon_title">�н�</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '�ػ깰'}">selected</c:if>" onclick="menuSearch('�ػ깰');">
				<em class="c6 icon"></em>
				<div class="icon_title">�ػ깰</div>
			</div>
			<div class="clearDiv"></div>
			
			
			<div class="category_bt <c:if test="${keyword eq 'ġŲ'}">selected</c:if>" onclick="menuSearch('ġŲ');">
				<em class="c7 icon"></em>
				<div class="icon_title">ġŲ</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '�ַ�'}">selected</c:if>" onclick="menuSearch('�ַ�');">
				<em class="c8 icon"></em>
				<div class="icon_title">�ַ�</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '����'}">selected</c:if>" onclick="menuSearch('����');">
				<em class="c9 icon"></em>
				<div class="icon_title">����</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '����'}">selected</c:if>" onclick="menuSearch('����');">
				<em class="c10 icon"></em>
				<div class="icon_title">����</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq 'ī��'}">selected</c:if>" onclick="menuSearch('ī��');">
				<em class="c11 icon"></em>
				<div class="icon_title">ī��</div>
			</div>
			<div class="category_bt <c:if test="${keyword eq '�̻�'}">selected</c:if>" onclick="menuSearch('�̻�');">
				<em class="c12 icon"></em>
				<div class="icon_title">�̻�</div>
			</div>
			<div class="clearDiv"></div>
		</div>
	</div>

	<div class="menuList" id="menuList" style="width:830px;">
	
		<c:forEach items="${fList}" var="fList" varStatus="status">
		<div class="shopInfo" style="width:810px;margin-top:20px;">
			<div style="background-image:url('/Taster/images/shop/${fList.file_savname}');
					background-repeat: no-repeat; display:block; 
					width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
			</div>
			<div style="float:left; width:550px; text-align:left;">
				<span class="title">${status.index + 1}. ${fList.shop_name}</span>
				<span class="r_score">
				<c:if test="${fList.avg_r_score != null }">
					${fList.avg_r_score }
				</c:if>
			
				</span>
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
				<div class="m_image" 
					<c:if test="${fList.member_image != null }">
					style="background:url('/Taster/images/member/${fList.member_image }') no-repeat;
							background-size: 36px 36px;" </c:if>>
				</div>
				<strong>
				<c:if test="${fList.member_nicname != null }">
					${fList.member_nicname }
				</c:if>
				</strong>&nbsp;
				
				<c:if test="${fList.r_content != null }">
					${fList.r_content }
				</c:if>
				
				
			</div>
		</div>
		<div style="clear:both; height:10px;"></div>		
		<div style="clear:both; width:800px; border:1px solid #d5d5d5;"></div>
		
	</c:forEach>
	</div>
		<c:if test="${empty fList }">
			<div id="" style="width:500px;height:50px;margin-top:30px;"><h2>��ϵ� �Ĵ� ������ �����ϴ�.</h2></div>
		</c:if>
		<c:if test="${fTotalCount > 0 }">
			<div id="readMore" style="width:500px;height:50px;">
				<h2 style="cursor:pointer;" onclick="readMore();">�������</h2>
			</div>
		</c:if>
</div>
</center>
</body>
</html>







