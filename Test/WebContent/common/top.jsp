<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div class="top_module">
  <div class="menu_container">
    <div class="btn_home" style="float:left;">로고</div>
    <div class="btn_category" onclick="location.href='qboardList.action'">1:1문의</div>
    <div class="btn_category" onclick="location.href='memberMypage.action'">마이페이지</div>
    <div class="btn_category" onclick="location.href='memberJoin.action'" >회원가입</div>
    <div class="btn_category" onclick="location.href='memberLogin.action'">로그인</div>
    <div class="btn_category" onclick="location.href='approvalRequestList.action'" style="background:#ff792a;" >신규식당 승인</div>
    <div class="btn_category" onclick="location.href='adminMemberList.action'" style="background:#ff792a;">회원 관리</div>
  </div>
  <div style="width:100%; height:100px; text-align:center; color:#fff;">
  	<h3>솔직한 리뷰, 믿을 수 있는 평점!</h3>
  	<h3>맛객에 오신 것을 환영합니다.</h3>
  	
  	<select name="" id="selectbox" class="selectbox">
  		<option value="">식당명</option>
  		<option value="">지역</option>
  	</select>
  	
  	<input type="text" name="keyword" id="keyword" placeholder="검색 목록을 선택해 주세요."/>
  	<input type="button" value="검  색" class="btn_search" style="margin-right:30px;font-size:13px;font-weight:bold;"/>
  	<input type="button" value="상세검색" class="btn_search" style="font-size:13px;font-weight:bold;"/>
  </div>
</div>
<table style="width:100%;" class="top_table">
	<tr>
		<td onclick="location.href='foodsMenuList.action'">업종별 맛집</td>
		<td onclick="location.href='foodsAreaList.action'">지역별 맛집</td>
		<td onclick="location.href='foodsHotList.action'">뜨는 맛집</td>
		<td onclick="location.href=">신규 맛집</td>
		<td onclick="location.href='foodsRecommendList.action'">추천 맛집</td>
		<td onclick="">전체 보기</td>
	</tr>
</table>




























