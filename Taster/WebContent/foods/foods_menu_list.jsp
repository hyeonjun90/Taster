<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>업종별 맛집 리스트</title>
<link rel="stylesheet" href="/Taster/css/style.css" />

<style>
	.clearDiv{	clear:both;	}
	.shopInfo {	border:1px solid #d5d5d5; width:300px; height:150px; margin:20px; float:left; text-align:center;
	 box-sizing:border-box; vertical-align: middle}
	 .shopInfo span {vertical-align: middle; position:relative; color:#000; font-size:18px; font-weight:bold;
	  			margin-top:50px;  }
	.shopKind {width:98%;margin-top:25px;margin-left:10px;text-align:left;font-size:14px;color:#ff792a;font-weight:bold;}
	
	#topMenu{
		height: 30px; 
		width: 850px;
	}
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

</body>
</html>







