<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자페이지입니다.</title>
<link rel="stylesheet" href="/Taster/css/style.css"/><script type="text/javascript">
	function ApprovalOk() {
		alert('승인되었습니다.');
		window.location.href='approvalActionOk.action?r_idx=<s:property value="r_idx"/>&currentPage=<s:property value="currentPage"/>';
	
		/* var oWin = window.open(url, name, "scrollbars=no, status=no, resizable=no, width=300, height=150");		 */
	}
	
	function ApprovalNok() {
		alert('승인거부 되었습니다.');
		window.location.href='approvalActionNok.action?r_idx=<s:property value="r_idx"/>&currentPage=<s:property value="currentPage"/>';
		window.close();
	}

</script>
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
</head>
<body>
<center>
<div id="joinDiv">
<div><strong>신규식당등록 요청 목록</strong></div>

   <table id="joinTable">
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<th>번호</th> 
			<td> <s:property value="paramClass.r_idx"/></td>
		</tr>
		
		<tr>
			<th>작성일</th> 
			<td><s:property value="paramClass.r_regdate"/></td>
		</tr>
		
		<tr>
			<Th>ID</Th>
			<td><s:property value="paramClass.r_id"/></td>
		</tr>
		<tr>
			<Th>닉네임</Th>
			<td> <s:property value="paramClass.r_nicname"/></td>
		</tr>
		
		<tr>
			<th> 가게이름</th>
			<td><s:property value="paramClass.r_shop_name"/></td>
		</tr>

		<tr>
			<th> 전화번호 </th>
			<td><s:property value="paramClass.r_shop_tel"/></td>
		</tr>
		
		<tr>
			<th>업종</td>
			<td><s:property value="paramClass.r_shop_kind"/></td>
		</tr>

		<tr>
			<th>주소</th>
			<td><s:property value="paramClass.r_shop_addr1 + ' ' + paramClass.r_shop_addr2 + ' ' + paramClass.r_shop_addr3 + ' ' + paramClass.r_shop_addr4 "/></td>
		</tr>
		
		<tr>
			<th>가격대</th>
			<td><s:property value="paramClass.r_shop_price"/></td>
		</tr>

		<tr>
			<th> 휴일</th>
			<td><s:property value="paramClass.r_shop_holiday"/></td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><s:property value="paramClass.r_shop_content"/></td>
		</tr>
		
		<tr>
			<th>첨부파일</th>
			<td bgcolor="#FFFFFF"> &nbsp; &nbsp; 
			
			<s:url id="download" action="AprReq_fileDownloadAction">
			<s:param name="no">
				<s:property value="no"/>
			</s:param>
			</s:url>
			
			<s:a href="%{download}"><s:property value="paramClass.r_shop_file_orgname"/></s:a>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td height="10" colspan="2"></td>
		</tr>
		
		<tr>
			<td align="right" colspan="2">
			<%-- 	<s:url id="modifyURL" action="modifyForm">
					<s:param name="no">
						<s:property value="no"/>
					</s:param>
				</s:url> --%>
				
			<input name="ApprovalOk"  type="button" value="승인하기" class="inputb" onClick='ApprovalOk()'>
			<input name="ApprovalNok" type="button" value="거부하기" class="inputb" onClick='ApprovalNok()'>
			<input name="list" type="button" value=" 목 록 " class="inputb" onClick="javascript:location.href='approvalRequestList.action?currentPage=<s:property value="currentPage"/>'">
 			
 			</td>
 		</tr>
 	</table>
</div>
</body>
</html>