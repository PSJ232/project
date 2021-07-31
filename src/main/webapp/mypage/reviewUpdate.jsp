<%@page import="vo.MemberBean"%>
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
MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail"); 
String m_id = (String)session.getAttribute("m_id");
ReviewBean rb = (ReviewBean)request.getAttribute("rb");

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
  등급 정보 : <a href="MemberMypageGradeDetail.me"><%=realGrade %> </a>ㅣ 
  포인트 : <a href="MemberMypagePointDetail.me"><%=memberMypageDetail.getM_point() %></a>ㅣ
  나의 구독 : <a href="">2</a>
  </article>
  
  </section>
  
  <!-- 본문 왼쪽 메뉴 -->
  <!-- 큰 메뉴 두 가지 한 번에 묶여 있음 -->
  <section id="">
	<div>
  	<h2>마이꾸까</h2>
  	<ul type="none">
  		<li><a href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
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
		<li><a href="QnaInsert.qna">1:1 문의내역</a></li>
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
평점 : 
<%
String s5 ="", s4="", s3="", s2="", s1="";
switch(rb.getR_rate()) {
	case 5 : s5 = "selected"; break;
	case 4 : s4 = "selected"; break;
	case 3 : s3 = "selected"; break;
	case 2 : s2 = "selected"; break;
	case 1 : s1 = "selected"; break;
}
%>

<select name="r_rate">
	<option value="5" <%=s5 %>>5</option>
	<option value="4" <%=s4 %>>4</option>
	<option value="3" <%=s3 %>>3</option>
	<option value="2" <%=s2 %>>2</option>
	<option value="1" <%=s1 %>>1</option>
</select><br>
이미지:<input type="file" name="r_img"><%=rb.getR_img() %><br>
     <input type="hidden" name="oldr_img" value="<%=rb.getR_img() %>">
<input type="submit" value="작성하기">
 </form>


 
 
 </div>
 
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>