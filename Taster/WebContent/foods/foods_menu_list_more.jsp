<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div style="float:right;" class="favorite">º°</div>
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