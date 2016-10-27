<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:forEach items="${fList}" var="fList" varStatus="status">
		<div class="shopInfo" style="width:810px;margin-top:20px;">
			<div style="background-image:url('/Taster/images/shop/${fList.file_savname}');
					background-repeat: no-repeat; display:block; 
					width:150px;height:150px;background-size:150px 150px;padding-top:5px;float:left;">
			</div>
			<div style="float:left; width:550px; text-align:left;">
				<span class="title">${fList.rnum}. ${fList.shop_name}</span>
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
				<div class="m_image" 
					<c:if test="${fList.member_image != null }">
					style="background:url('/Taster/images/member/${fList.member_image }') no-repeat;
							background-size: 36px 36px;" </c:if>>
				</div>
				<strong>${fList.member_nicname }</strong>&nbsp;
				${fn:substring(fList.r_content, 0, 150) }...
			</div>
		</div>
		<div style="width:300px; text-align:right; float:right;font-size:11px;color:#a6a6a6;"> >>${fList.shop_name} 정보 더보기</div>
		<div style="clear:both; height:10px;"></div>		
		<div style="clear:both; width:800px; border:1px solid #d5d5d5;"></div>
</c:forEach>