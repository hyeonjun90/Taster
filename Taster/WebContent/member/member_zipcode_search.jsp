<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	a {
		font-size: 11px;
		font-family : 'NanumGothic';
		text-decoration: none;
	}
	a:VISITED {
		text-decoration: none;
	}
	li {
		height: 12px;
		font-size: 0.5em;
	}
</style>
<script>
function setZipcode(zipcode, sido, gugun, dong, ri, bldg, bunji){
	var juso = "" + sido + " " + gugun + " " + dong + " " + ri + bldg + " " + bunji;
	var zipcode1 = zipcode.substring(0, zipcode.indexOf("-"));
	var zipcode2 = zipcode.substring(zipcode.indexOf("-")+1, zipcode.length);
	
	opener.document.forms[0].member_zipcode1.value=zipcode1;
	opener.document.forms[0].member_zipcode2.value=zipcode2;
	opener.document.forms[0].member_addr1.value=juso;
	self.close();
}
</script>
</head>
<body>

<c:forEach var="zip" items="${zipList }">
<ul>
	<li>	
	<a href="javascript:setZipcode('${zip.zipcode}', '${zip.sido}', '${zip.gugun }','${zip.dong }', '${zip.ri }', '${zip.bldg }', '${zip.bunji }');">
		[${zip.zipcode }] ${zip.sido } ${zip.gugun } ${zip.dong } ${zip.ri } ${zip.bldg } ${zip.bunji }
	</a>
	</li>
</ul>
</c:forEach>
</body>
</html>