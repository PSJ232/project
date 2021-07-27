<%@page import="java.time.LocalDate"%>
<%@page import="vo.MemberBean"%>
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
	MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail"); 
	String m_id = (String)session.getAttribute("m_id");
	
	String realGrade = "";
	switch(memberMypageDetail.getG_id()) {
		case 3: realGrade = "BLACK"; break;
		case 2: realGrade = "RED"; break;
		case 1: realGrade = "GREEN"; break;
		case 0: realGrade = "WHITE"; break;
	}
	
%>

<!-- 헤더 들어가는곳 -->

<!-- 헤더 들어가는곳 -->
  
<!-- 본문들어가는 곳 -->
  <!-- 본문 메인 상단 -->
  
  <section id=""> 

  <article id=""><%=m_id %>님,<br>
  오늘도 꽃같은 날이예요</article>
	
  <article id="">
  등급 정보 : <a href=""><%=realGrade %> </a>ㅣ 
  포인트 : <a href=""><%=memberMypageDetail.getM_point() %></a>ㅣ
  나의 구독 : <a href="">2</a>
  </article>
  
  </section>
  
  <!-- 본문 왼쪽 메뉴 -->
  <!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->
  <section id="">
	<div>
  	<h2>마이꾸까</h2>
  	<ul type="none">
  		<li><a href="OrderMypageDetail.od">주문내역/배송조회</a></li>
  		<li><a href="">나의 정기구독</a></li>
  		<li><a href="">클래스 수강내역</a></li>
		<li><a href="ReviewInsertForm.rv">상품 리뷰</a></li>
  	</ul>
 	 </div>
 	 
 	 <div>
  	 <h2>개인정보 관리</h2>
  	<ul type="none">
  		<li><a href="MemberUpdate.me">개인정보 수정</a></li>
  		<li><a href="MemberMypageGradeDetail.me">회원등급</a></li>
  		<li><a href="MemberMypagePointDetail.me">포인트</a></li>
		<li><a href="../QnaInsert.qna">1:1 문의내역</a></li>
		<li><a href="">자주묻는질문</a></li>
  	</ul>
  	</div>
	</section>
  	
  <!-- 본문 내용 -->
 <%=m_id %>님의 <%=LocalDate.now().getMonthValue() %>월 회원 등급은 <%=realGrade %>입니다.
 
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>