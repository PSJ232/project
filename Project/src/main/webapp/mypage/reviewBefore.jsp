<%@page import="vo.ItemBean"%>
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
  ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>)request.getAttribute("nonOrderArrayList");
  ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>)request.getAttribute("orderArrayList");
  ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>)request.getAttribute("nonItemArrayList");
  ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>)request.getAttribute("itemArrayList");
  ArrayList<Integer> nonOdList = (ArrayList<Integer>)request.getAttribute("nonOdList");
  ArrayList<Integer> odList = (ArrayList<Integer>)request.getAttribute("odList");
  %>
 
  	<section>
	 	<div>
		   	<h2>상품 리뷰</h2>
		   		<div>
		   		<h6>작성 가능한 후기</h6>
	   			<table border="1">
	   				<tr><td>주문/신청일자</td><td>상세 정보</td><td>상태</td></tr>
	   			<%
		   		  for(int i=0; i<nonOrderArrayList.size(); i++) {
		   			  nonOrderArrayList.get(i).getO_rdate();
		   			  nonOrderArrayList.get(i).getO_rdate();
//		   		 	  SELECT o_id, o_rdate, o_delivery_date, o_receiver, o_amount
// 			   		  SELECT i_id, i_name, i_img
		   			  nonItemArrayList.get(i).getI_name();
	   			%>
	   				<tr><td><%=nonOrderArrayList.get(i).getO_rdate() %></td>
	   					<td><%=nonItemArrayList.get(i).getI_name() %></td>
	   					<td><a href="ReviewInsert.rv?od_id=<%=nonOdList.get(i) %>">리뷰 작성</a></td></tr>
<!-- 		   				// 여기서 링크타고 갈때 번호를 줘야될듯 -->
<!-- 		   				ㄴ얘는 색이 변경됐으면 좋겠습니다. -->
				<%}%>
	   			</table>
		   		</div>
		   			
		   		<div>
		   		<h6>내 리뷰</h6>
		   		<table border="1">
		   				<tr><td>주문/신청일자</td><td>상세 정보</td><td>상태</td></tr>
	   			<%
		   		  for(int i=0; i<orderArrayList.size(); i++) {
	   			%>
	   				<tr><td><%=orderArrayList.get(i).getO_rdate() %></td>
	   					<td><%=itemArrayList.get(i).getI_name() %></td>
	   					<td><a href="ReviewUpdate.rv?od_id=<%=odList.get(i) %>">리뷰 수정</a> | <a href="ReviewInsert.rv">리뷰 삭제</a></td></tr>
				<%}%>		   				
<!-- 		   				ㄴ얘는 색이 변경됐으면 좋겠습니다. -->
		   		</table>
		   		</div>
	 	</div>
 	</section>
 	
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>
 
 
 

