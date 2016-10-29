<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
<link rel="stylesheet" href="/Taster/css/style.css"/>
<style>
#joinTable {
		width: 800px;
		height: 380px;
		margin-top: 10px;
		padding: 0px;
	}
	#joinTable tr th {
		width: 20%;
		background-color: #f7f7f7;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
		background-image: url('/Taster/images/bg_01.gif');
		background-size:700%;
		background-repeat: no-repeat;
		border-bottom: 1px solid #a6a6a6;
	}
	#joinTable tr td {
		width: 80%;
		font-size: 11px;
		font-family : 'NanumGothic';
		vertical-align: middle;
		padding-left:3px;
		border-bottom: 1px solid #a6a6a6;
	}
	.zipcode {
		margin-bottom: 5px;
		font-size: 10px;
		font-family : 'Noto Sans', sans-serif;
	}
	#joinTable button {
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable input {
		height: 10px;
		font-size: 11px;
		font-family : 'NanumGothic';
	}
	#joinTable img {
		height: 20px;
		cursor: pointer;
	}
	#joinTable font {
		font-size: 10px;
		font-family : Noto Sans, sans-serif;
	}
	#joinDiv {
		width: 820px;
		border: 1px solid #a6a6a6;
		margin-top: 30px;
		margin-bottom: 15px;
	}
	#joinDiv div {
		width:750px; border-bottom:3px solid #f0f0f0;
		text-align: left; padding: 10px;
		font-size: 14px; font-family : Noto Sans, sans-serif;
	}
</style>
</head>
<body>
<center>
<div id="joinDiv">
 <div><strong>상세보기</strong></div>
      <table id="joinTable">
      
      <tr>
      <th>식당이름</th>
         <td>
            <s:property value="resultClass.shop_name"/> 
        </td>
      </tr>
      
      <tr>
      <th>전호번호</th>
         <td>
           <s:property value="resultClass.shop_tel"/>
         </td>   
      </tr>
      
      <tr>
      <th>가격</th>
         <td>
         <s:property value="resultClass.shop_price"/>
         </td>
      </tr>
     
      <tr>
      <th>업종</th>
         <td>
         <s:property value="resultClass.shop_kind"/>
         </td>
      </tr>
      
      <tr>
      <th>주소</th>
         <td>
         <s:property value="resultClass.shop_addr1 + '  ' + resultClass.shop_addr2 + '  ' + resultClass.shop_addr3 + resultClass.shop_addr4"/>
         </td>
      </tr>
     
      
      <tr>
      <th>휴일</th>
         <td>
          <s:property value="resultClass.shop_holiday"/>
         </td>
      </tr>
      
     
      
      <tr>
      <th>조회수</th>
         <td><s:property value="resultClass.shop_readCount"/>
         </td>
      </tr>
      
      <tr>
      <th>첨부파일</th>
         <td>
         <s:property value="resultClass.file_orgname"/> 
         </td>
      </tr>
              
      <tr>
      <td colspan="2" align="right">
      	<input name="list" align="right" type="button" value="목록보기" class="inputb" onClick="javascript:location.href='AshoplistAction.action?currentPage=<s:property value="currentPage" />'">
		<input name="list" type="button" value="삭제하기" class="inputb" onClick="javascript:location.href='AshopDeleteAction.action?shop_idx=<s:property value="resultClass.shop_idx" />&currentPage=<s:property value="currentPage" />'">
		<input name="list" type="button" value="수정하기" class="inputb" onClick="javascript:location.href='AshopModifyAction.action?shop_idx=<s:property value="resultClass.shop_idx" />&currentPage=<s:property value="currentPage" />'">
		
      </td>
      </tr>
    </table>

</div>
</body>
</html>