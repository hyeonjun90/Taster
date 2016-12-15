<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>insertForm.html</title>

<!-- 스마트에디터 CSS, 자바스크립트 관련 자료 설정 -->

<link href="/Taster/rboard/smartEditor2/css/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/Taster/rboard/smartEditor2/js/HuskyEZCreator.js" charset="utf-8"></script>




</head>

<body>

<form method="post" enctype="multipart/form-data" 

   action="insert.jsp" name="f">

 <table border="1" cellspacing="0" width="900">

  <tr>

   <td>작성자</td>

   <td><input type="text" name="writer"/></td>

  </tr>

  <tr>

   <td>제목</td>

   <td><input type="text" name="title"/></td>

  </tr>

  <tr>

   <td>내용</td>

   <td>

    <textarea name="content" id="content" 

    style="width:725px; height:300px; display:none;"></textarea>

   </td>

  </tr>

  <tr>

   <td>파일첨부</td>

   <td><input type="file" name="file1"/></td>

  </tr>

 </table>

 <input type="button" onclick="_onSubmit(this)" value="서버에 전송"></input>

</form>

<script type="text/javascript" charset="utf-8">

// 이미지업로드 경로(붙여넣기할때 경로명이 바뀔수도 있으니 조심해야 한다. /로시작하는것은 절대경로를 의미)

var imagepath = "/Taster/rboard/smartEditor2/smartImages";

var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

 oAppRef: oEditors,

 elPlaceHolder: "content",

 sSkinURI: "/Taster/rboard/smartEditor2/SmartEditor2Skin.html",

 fCreator: "createSEditor2"

});




function insertIMG(irid,fileame){

  var sHTML = "<img src='" + imagepath + "/" + fileame + "' border='0'>";

  oEditors.getById[irid].exec("PASTE_HTML", [sHTML]);

}

function _onSubmit(elClicked){ 

 oEditors.getById["content"].exec("UPDATE_IR_FIELD", []); 

 f.submit();

}




</script>

</body>

</html>



