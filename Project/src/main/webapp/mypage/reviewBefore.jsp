<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 헤더 들어가는곳 -->

<!-- 헤더 들어가는곳 -->
  
<!-- 본문들어가는 곳 -->
  <!-- 본문 메인 상단 -->
  
  <section id=""> 

  <article id="">000님,<br>
  오늘도 꽃같은 날이예요</article>
	
  <article id="">
  <a href=""> 등급정보</a>ㅣ
 	<a href=""> 포인트</a>ㅣ
 	<a href=""> 나의정보</a>
  </article>
  
  </section>
  
  <!-- 본문 왼쪽 메뉴 -->
  <!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->
  <section id="">
	<div>
  	<h2>마이꾸까</h2>
  	<ul type="none">
  		<li><a href="">주문내역/배송조회</a></li>
  		<li><a href="">나의 정기구독</a></li>
  		<li><a href="">클래스 수강내역</a></li>
		<li><a href="ReviewFormAction.rv">상품 리뷰</a></li>
  	</ul>
 	 </div>
 	 
 	 <div>
  	 <h2>개인정보 관리</h2>
  	<ul type="none">
  		<li><a href="">개인정보 수정</a></li>
  		<li><a href="">회원등급</a></li>
  		<li><a href="">포인트</a></li>
		<li><a href="">1:1 문의내역</a></li>
		<li><a href="">자주묻는질문</a></li>
  	</ul>
  	</div>
	</section>
  	
  <!-- 본문 내용 -->
  <%
  ArrayList<OrderBean> nonArrayList = (ArrayList<OrderBean>)request.getAttribute("nonArrayList");
  ArrayList<OrderBean> arrayList = (ArrayList<OrderBean>)request.getAttribute("arrayList");
  
  
  %>
 
  	<section>
	 	<div>
		   	<h2>상품 리뷰</h2>
		   		<div>
		   		<h6>작성 가능한 후기</h6>
		   			<table border="1">
		   				<tr><td>주문/신청일자</td><td>상세 정보</td><td>상태</td></tr>
		   				<tr><td>2021-07-16</td><td>산호초 에디션</td><td><a href="ReviewInsert.rv">리뷰 작성 가능</a></td></tr>
		   				<tr><td>2021-03-15</td><td>로지 핑크 에디션</td><td>상품 배송 중</a></td></tr>
<!-- 		   				ㄴ얘는 색이 변경됐으면 좋겠습니다. -->
		   			</table>
		   		</div>
		   			<table border="1">
		   				<tr><td>주문/신청일자</td><td>상세 정보</td><td>상태</td></tr>
		   				<tr><td>2021-03-15</td><td>로지 핑크 에디션</td><td><a href="리뷰 수정">리뷰 수정</a></td></tr>
		   				<tr><td>2020-12-09</td><td>홈 가든 에디션</td><td>삭제된 리뷰</td></tr>
<!-- 		   				ㄴ얘는 색이 변경됐으면 좋겠습니다. -->
		   			</table>
		   		<div>
		   		<h6>내 리뷰</h6>
		   		</div>
	 	</div>
 	</section>
 	
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>
 
 
 

