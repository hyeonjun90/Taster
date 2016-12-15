<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="/Taster/rboard/ckeditor/ckeditor.js" charset="utf-8"></script>

</head>
<body>
<form method="post" enctype="multipart/form-data" action="insert.jsp" name="f">

<textarea name="rec_content" id="rec_content" rows="10" cols="80">dd</textarea>
</form>

<script>
CKEDITOR.replace('rec_content',
		{
	toolbar :'Basic',
	filebrowserImageUloadUrl:'fileupload.jsp?type=images', //파일 업로드시 사용
	width : '100%', //넓이값
	height : '200' //높이값
		})
</script>
</body>
</html>