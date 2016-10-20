<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ĵ� ��ġ ã��</title>

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
function setZipcode(sido, gugun, dong){
	var juso=""+sido+" "+gugun+" "+dong;
	
	//alert(juso + "//" + zipcode1 + "//" + zipcode2);
	//member_food_wirte �� joinForm�� ������ ���� 
	opener.document.joinForm.shop_addr.value=juso;  //�����ֱ����� ������ �ּ� 
	
	document.joinForm.shop_addr1.value = sido; //shopAddAction�� hidden������ �Ѱ��ֱ� ���� ��
	document.joinForm.shop_addr2.value = gugun;
	document.joinForm.shop_addr3.value = dong;
	
	self.close();
}


</script>
</head>
<body>
<c:if test="${empty zipList}">
	<center><h3>�˻��� ����� �����ϴ�.</h3></center>
</c:if>

<c:forEach var="zip" items="${zipList}">
<ul>
	<li>
	<a href="javascript:setZipode('${zip.sido}', '${zip.gugun }','${zip.dong }');">
		${zip.sido } ${zip.gugun } ${zip.dong } 
	</a>
	</li>
</ul>
</c:forEach>
</body>
</html>