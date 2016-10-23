<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<<<<<<< HEAD
<title>업종별 맛집 리스트</title>
<link rel="stylesheet" href="/Taster/css/style.css" />

=======
<title>Insert title here</title>
<link rel="stylesheet" href="/Taster/css/style.css" />
>>>>>>> branch 'master' of https://github.com/hyeonjun90/Taster
<style>
	.clearDiv{	clear:both;	}
	.c1 {background:url('http://itvplus5.cafe24.com/img/category/c01.png');}
	.c2 {background:url(http://itvplus5.cafe24.com/img/category/c02.png);}
	.c3 {background:url(http://itvplus5.cafe24.com/img/category/c03.png);}
	.c4 {background:url(http://itvplus5.cafe24.com/img/category/c12.png);}
	.c5 {background:url(http://itvplus5.cafe24.com/img/category/c04.png);}
	.c6 {background:url(http://itvplus5.cafe24.com/img/category/c05.png);}
	.c7 {background:url(http://itvplus5.cafe24.com/img/category/c06.png);}
	.c8 {background:url(http://itvplus5.cafe24.com/img/category/c07.png);}
	.c9 {background:url(http://itvplus5.cafe24.com/img/category/c08.png);}
	.c10 {background:url(http://itvplus5.cafe24.com/img/category/c09.png);}
	.c11 {background:url(http://itvplus5.cafe24.com/img/category/c11.png);}
	.c12 {background:url(http://itvplus5.cafe24.com/img/category/c10.png);}
	
	
	.icon {
		width: 70px;
		height: 70px;
		display: inline-block;
		background-repeat: no-repeat;
		cursor: pointer;
	}
<<<<<<< HEAD
	#topMenu ul li{  			
		color: white;
		background-color:FF9900; 
		float: left;    		
		line-height: 30px;   
		vertical-align: middle; 
		text-align:center;		
 	} 
 	#topMenu .menuLink{       
 		text-decoration:none; 
 		color: white;              
        display: block;         
        width: 150px;          
        font-size: 12px;       
        font-weight: bold;     
        font-family: "Trebuchet MS", Dotum, Arial; 
 	}
 	#topMenu .menuLink:hover{   
 		color:red;
 		background-color: FF6600;
 	}
=======
	.category_bt{
		width: 80px;
		height: 80px;
		float: left;
		text-align: center;
		background: white;
		border-radius: 60px;
		margin: 10px 23px 10px; /* 탑 왼 바텀 오 */
		border: 7px solid white;
		padding-top: 0px;
	}
	.icon_title{
		font-size: 13px;
		font-weight: 600;
		margin-top: -10px;
		font-family : 'Noto Sans', sans-serif;	
	}
	.category_bt:hover{
		border: 7px solid #DDE5B8;
		padding-top: 0px;
	}
	
	.cat_select{
		border: 7px solid #ABC1DF;
		padding-top: 0px;
	}
		
>>>>>>> branch 'master' of https://github.com/hyeonjun90/Taster
</style>
</head>
  
<body>
       <nav id="topMenu" >
                <ul>
                        <li><a class="menuLink" href="#">한식</a></li>
                        <li><a class="menuLink" href="#">양식</a></li>
                        <li><a class="menuLink" href="#">일식</a></li>
                        <li><a class="menuLink" href="#">중식</a></li>
                        <li><a class="menuLink" href="#">고기</a></li>
                </ul>
        </nav>

<<<<<<< HEAD
=======
<center>
<div style="width:100%;min-height:500px;margin-top:40px;">

<div style="width:900px;height:220px;background: #F3F3F3;padding: 10px 0px 20px;border: 1px solid #E6E3E3;text-align:center;">

<div style="width:848px;margin:0px auto;">
	<div class="category_bt">
		<em class="c1 icon"></em>
		<div class="icon_title">한식</div>
	</div>
	<div class="category_bt">
		<em class="c2 icon"></em>
		<div class="icon_title">양식</div>
	</div>
	<div class="category_bt">
		<em class="c3 icon"></em>
		<div class="icon_title">일식</div>
	</div>
	<div class="category_bt">
		<em class="c4 icon"></em>
		<div class="icon_title">중식</div>
	</div>
	<div class="category_bt">
		<em class="c5 icon"></em>
		<div class="icon_title">분식</div>
	</div>
	<div class="category_bt">
		<em class="c6 icon"></em>
		<div class="icon_title">해산물</div>
	</div>
	<div class="clearDiv"></div>
	
	
	<div class="category_bt">
		<em class="c7 icon"></em>
		<div class="icon_title">치킨</div>
	</div>
	<div class="category_bt">
		<em class="c8 icon"></em>
		<div class="icon_title">주류</div>
	</div>
	<div class="category_bt">
		<em class="c9 icon"></em>
		<div class="icon_title">제빵</div>
	</div>
	<div class="category_bt">
		<em class="c10 icon"></em>
		<div class="icon_title">육류</div>
	</div>
	<div class="category_bt">
		<em class="c11 icon"></em>
		<div class="icon_title">카페</div>
	</div>
	<div class="category_bt">
		<em class="c12 icon"></em>
		<div class="icon_title">이색</div>
	</div>
	<div class="clearDiv"></div>
</div>
</div>
</div>
</center>
>>>>>>> branch 'master' of https://github.com/hyeonjun90/Taster
</body>
</html>







