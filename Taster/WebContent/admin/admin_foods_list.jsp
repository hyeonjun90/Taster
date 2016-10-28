<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의 게시판</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
<style type="text/css">
a:link, a:visited, a:hover, a:active {
	font-size: 10pt;
	color: black;
	text-decoration: none;
}
</style>
</head>

<body>
	
<div style="width:800px; margin:30px auto; ">
   
   
   <table width="800" border="0" cellspacing="0" cellpadding="2">
  	 
      <tr align="center" bgcolor="#FF895A" height="10">
         <td width="90" height="30px" bgcolor="#FF9D62"><font color="white" size="2"><strong>글번호</strong></td>
         <td width="390" height="35px"><font color="white" size="2"><strong>식당명</strong></td>
         <td width="90" height="35px"><font color="white" size="2"><strong>가격대</strong></td>
         <td width="120" height="35px"><font color="white" size="2"><strong>전화번호</strong></td>
         <td width="90" height="35px"><font color="white" size="2"><strong>업종</strong></td>
         <td width="120" height="35px"><font color="white" size="2"><strong>휴일</strong></td>
         <td width="120" height="35px"><font color="white" size="2"><strong>주소</strong></td>
         <td width="120" height="35px"><font color="white" size="2"><strong>조회수</strong></td>
      </tr>
      
      <tr>
		<td colspan="8"><hr/></td>
	  </tr>

   <s:iterator value="list" status="stat">
   <!-- 상세보기 관련 액션 -->
      <s:url id="viewURL" action="AdminShopListDetailView">
         <s:param name="shop_idx">
            <s:property value="shop_idx" />
         </s:param>
         <s:param name="currentPage">
            <s:property value="currentPage" />
         </s:param>
      </s:url>
   
      <tr align="center">
         <!-- 글 번호 -->
         <td align="center"><s:property value= "shop_idx" /></td>
         <td align="center">   
         <!-- 식당이름 -->
             <s:a href="%{viewURL}"><s:property value="shop_name"/></s:a>
         </td>
         <td  align="center"><s:property value="shop_price" /></td>
         <td  align="center"><s:property value="shop_tel" /></td>
         <td  align="center"><s:property value="shop_kind" /></td>
         <td  align="center"><s:property value="shop_holiday" /></td>
         <td  align="center"><s:property value="shop_addr1" /></td>
         <td  align="center"><s:property value="shop_readCount" /></td>
      </tr>

      <tr>
			<td colspan="8"><hr/></td>
	  </tr>

   </s:iterator>
   
   <s:if test="list.size() <= 0">
		<tr tr bgcolor="#FFFFFF" align="center">
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
		</tr>
		
		<tr bgcolor="#777777">
					<td height="1" colspan="5"></td>
		</tr>
	</s:if>

    <tr align="center">
		<td colspan="8"><s:property value="pagingHtml" escape="false" /></td>
	</tr>
	<tr>
		  <td colspan="8"><hr /></td>
	</tr>

   <!-- 글쓰기 버튼 -->
   <tr align="left">
      <td colspan="8">
         <input name="list" type="button" value="글 올리기" class="inputb" onClick="javascript:location.href='AshopWriteForm.action?currentPage=<s:property value="currentPage" />';" />
      </td>
   </tr>
   
  	

	<tr align="center">
		<td colspan="8">
			<form action="AshoplistSearchNAction.action">
				<select name="searchNum" >
					<option value="0">식당명</option>
					<option value="1">업종</option>
					
				</select>
				<s:textfield name="searchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb">
			</form>
		</td>
		
	
	</tr>
	
		<tr>
				<td colspan="8"><hr/></td>
		</tr>

  </table>
</div> 
</body>
</html>