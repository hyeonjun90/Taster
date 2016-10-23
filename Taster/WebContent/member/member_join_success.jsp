<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
	function locationURL() {
		//if(window.name == "insert") {
			alert("회원가입이 완료되었습니다.");
			location.href='main.action';
		//} else {
		//	alert("가입 도중 에러가 발생하였습니다.");
		//	history.back(-1);
		//}
	}
</script>
</head> 
<body>
<script>
	locationURL();
</script>
</body>
</html>