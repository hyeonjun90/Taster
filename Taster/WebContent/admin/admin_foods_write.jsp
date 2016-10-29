<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>식당 등록 게시판</title>
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
		font-family : 'Noto Sans', sans-serif;
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
		font-size: 14px; font-family : 'Noto Sans', sans-serif;
	}
</style>

<script language="javascript">
function openZipcode(){
	var url="AdminShopSearchZipcode.action";
	open(url, "","toolbar=no,location=no,"
			+"status=no,menubar=no,"
			+"scrollbars=yes,resizable=no,"
			+"width=410,height=400");
}

</script>
</head>

<body>

<center>
<div id="joinDiv">
<div><strong>식당 등록</strong></div>


<form action="AshopWriteAction.action" method="post" enctype="multipart/form-data" name="joinForm">

<input type="hidden" name="r_shop_addr" value=""/>
<input type="hidden" name="r_shop_addr1" value="" />
<input type="hidden" name="r_shop_addr2" value="" />
<input type="hidden" name="r_shop_addr3" value="" />

<table id="joinTable">
		<tr>
			<th>식당 이름</th>
			<td>
				<s:textfield name="shop_name" theme="simple" value="%{resultClass.shop_name}"/>
			</td>                                                                
		</tr> 
		
       <tr>
       		<th>전화번호</th>
			<td>
				<s:textfield name="shop_tel" theme="simple"  value="%{resultClass.shop_tel}" />
			</td>
		</tr>
		
		<tr>
		<th>가격대</th>
		<td>
			<s:textfield name="shop_price" theme="simple" value="%{resultClass.shop_price}"/>
			</td>
			
		</tr>
		 
	  
		<tr>
		<th>주소</th>
		<td>
		<input type="text" name="shop_addr4" id="shop_addr4" class="zipcode" size="50" onclick="openZipcode();"/>
		<img src="/Taster/images/bt_zipcode.gif" alt="" onclick="openZipcode();" /> <br />
		<s:textfield name="r_shop_addr4" theme="simple"/>
		</td>
		</tr>
		

		
		<tr>
		<th>휴일:</th>
		<td>
	     <s:textfield name="shop_holiday" theme="simple" value="%{resultClass.shop_holiday}"/>
	     </td>
		</tr>
		
		<tr>
		<th>업종</th>
			<td>
			<input type="radio" name="shop_kind" value="한식"> 한식 
			<input type="radio" name="shop_kind" value="중식"> 중식
			<input type="radio" name="shop_kind" value="양식"> 양식 
		    <input type="radio" name="shop_kind" value="일식"> 일식 
		    <input type="radio" name="shop_kind" value="분식"> 분식 
		    <input type="radio" name="shop_kind" value="치킨"> 치킨 
		    <input type="radio" name="shop_kind" value="주류"> 주류 
		    <input type="radio" name="shop_kind" value="제빵"> 제빵 
		    <input type="radio" name="shop_kind" value="육류"> 육류 
		    <input type="radio" name="shop_kind" value="카페"> 카페
		    <input type="radio" name="shop_kind" value="이색"> 이색
		    <input type="radio" name="shop_kind" value="해산물"> 해산물 
			</td>
		</tr>
		
		<tr>
		<th>첨부파일</th>
          <td>
            <s:file name="upload" theme="simple"/>
            <s:if test="resultClass.file_orgname != NULL">
            <s:property value="resultClass.file_orgname" /> 파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
            </s:if>
          </td>
        </tr>

	<tr>
		<td colspan="2" align="center" style="height:50px;border:1px solid white;">
		
		<input type= "image" src="/Taster/images/bt_ok.gif">

		<img src="/Taster/images/bt_ok.gif" alt="" onclick="document.joinForm.submit()" >

		<img src="/Taster/images/bt_cancel.gif" alt="" onclick="javascript:if(confirm('작성한 정보가 초기화 됩니다. 취소하시겠습니까?')){location.href='AshopWriteForm.action'}" /> 
	

	</tr>
		
</table>
</form>
</div>
</body>
</html>