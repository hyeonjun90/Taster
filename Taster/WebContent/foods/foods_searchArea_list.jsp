<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var currentPage = 1;
var fTotalCount = ${fTotalCount};
	function init() {
		searchArea('서울', document.getElementById("start"), '1');
		if(fTotalCount <= 3) {
			$("#readMore").css("display", "none");
		}
	}
init();
</script>
<div class="menuList" id="menuList" style="width:830px; margin:0px auto;">
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
		
	</c:forEach>
	</div>
		<c:if test="${empty fList }">
			<div id="" style="width:500px;height:50px;margin-top:30px;"><h2>등록된 식당 정보가 없습니다.</h2></div>
		</c:if>
		<c:if test="${fTotalCount > 0 }">
			<div id="readMore" style="width:500px;height:50px;margin:0px auto;text-align:center;">
				<h2 style="cursor:pointer;" onclick="readMore();">▽더보기</h2>
			</div>
		</c:if>