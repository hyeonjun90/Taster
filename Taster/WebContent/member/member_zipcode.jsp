<%@ page contentType="text/html; charset=euc-kr"%>
<html>
<head>
<title>우편번호</title>
<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.0.min.js'></script>
<script>
	function zipSearch() {
		$("#zipcode").html("<center><img src='/Taster/images/loader.gif'/></center>");
		$.ajax({
			url: "zipcodeSearch.action", 
			method: "post",
			data: {"dong": encodeURIComponent($("#dong").val())},
			success: function(data) {
				
				$("#zipcode").html(data);
				 
			}
		});
	}
</script>
</head>
<body bgcolor="#f5f5f5">
<table width="370" border="0" cellspacing="0" cellpadding="5">
		<tr align="center">
		<td align="center">
		<font color="#ff4500">-우편번호 검색-</font><br>
		</td>
	</tr>
</table>

<form method="post" name="form">
	<table width="370" border="0" cellspacing="0" cellpadding="5">
	<tr align="center">
		<td align="center">
			<font size="2">지역명 : </font>
			<input type="text" name="dong" id="dong" onkeydown="javascript:if(event.keyCode==13){ zipSearch(); return false; }"/>
			<input type="button" value="검색" onclick="zipSearch();"><br>
			<font size="2">동을 입력하세요.(예:방배, 원천, 2글자 이상입력)</font>
		</td>
	</tr>
	</table>
</form>
<br>
<table width="370" border="0" cellspacing="0" cellpadding="5">
<tr>
	<td width="100%" colspan="2" id="zipcode">
	</td>
</tr>

</table>
</body>
</html>