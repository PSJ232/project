<%@page import="vo.ReviewBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String m_id = (String)session.getAttribute("m_id");
ReviewBean rb = (ReviewBean)request.getAttribute("rb");
%>

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
		<li><a href="./ReviewInsertForm.rv">상품 리뷰</a></li>
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
 <div>
 <form action="ReviewUpdatePro.rv" method="post" name="fr" enctype="multipart/form-data">
<input type="hidden" name="od_id" value="<%=rb.getOd_id() %>">
<input type="hidden" name="r_id" value="<%=rb.getR_id() %>">
r_id : <%=rb.getR_id() %> <br>
작성자 : <input type="text" name="r_writer" value="<%=m_id %>" readonly>
제목 : <input type="text" name="r_title" value=<%=rb.getR_title() %>> <br>
내용 : <textarea rows="10" cols="20" name="r_content" ><%=rb.getR_content() %></textarea> <br>
평점 : <input type="text" name="r_rate" value=<%=rb.getR_rate() %>> <br>
이미지:<input type="file" name="r_img"><%=rb.getR_img() %><br>
     <input type="hidden" name="oldr_img" value="<%=rb.getR_img() %>">
<input type="submit" value="작성하기">
 </form>


 
 
 </div>
 
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>