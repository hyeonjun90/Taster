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
<link rel="stylesheet" href="/Taster/qboard/css.css" type="text/css">
</head>

<body>
   <table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
      <tr>
         <td align="center"><h2>식당 목록 리스트</h2></td>
      </tr>
   </table>
   
   
   <table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  
      <tr align="center" bgcolor="#f3f3f3">
         <td width="30"><strong>글번호</strong></td>
         <td width="50"><strong>식당명</strong></td>
         <td width="50"><strong>가격대</strong></td>
         <td width="50"><strong>전화번호</strong></td>
         <td width="50"><strong>업종</strong></td>
         <td width="50"><strong>휴일</strong></td>
         <td width="50"><strong>주소</strong></td>
         <td width="50"><strong>조회수</strong></td>
         
      </tr>
      

      
      <tr bgcolor="#777777">
         <td height="1" colspan="9"></td>
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
   
      <tr>
         <!-- 글 번호 -->
         <td align="center"><s:property value= "shop_idx" /></td>
         <td align="center">
         
            
         <!-- 식당이름 -->
             <s:a href="%{viewURL}"><s:property value="shop_name" /></s:a>
          </td>
         <td  align="center"><s:property value="shop_price" /></td>
         <td  align="center"><s:property value="shop_tel" /></td>
         <td  align="center"><s:property value="shop_kind" /></td>
         <td  align="center"><s:property value="shop_holiday" /></td>
         <td  align="center"><s:property value="shop_addr1" /></td>
         <td  align="center"><s:property value="shop_readCount" /></td>
      </tr>

      <tr bgcolor="#777777">
         <td height="1" colspan="8"></td>
      </tr>

   </s:iterator>
   
   <s:if test="list.size() <= 0">
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다</td>
		</tr>
	</s:if>

  <tr align="center">
		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>

   <!-- 글쓰기 버튼 -->
   <tr align="left">
      <td colspan="5">
         <input name="list" type="button" value="글 올리기" class="inputb" onClick="javascript:location.href='AshopWriteForm.action?currentPage=<s:property value="currentPage" />';" />
      </td>
   </tr>

<tr align="center">
		<td colspan="5">
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
	

  </table>
</body>
</html>