<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
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
ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>)request.getAttribute("nonOrderArrayList");
ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>)request.getAttribute("orderArrayList");
ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>)request.getAttribute("nonItemArrayList");
ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>)request.getAttribute("itemArrayList");
ArrayList<OrderDetailBean> nonOrderDetailArrayList = (ArrayList<OrderDetailBean>)request.getAttribute("nonOrderDetailArrayList");
ArrayList<OrderDetailBean> orderDetailArrayList = (ArrayList<OrderDetailBean>)request.getAttribute("orderDetailArrayList");

String m_id = (String)session.getAttribute("m_id");
MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail");
%>

<!-- 헤더 들어가는곳 -->

<!-- 헤더 들어가는곳 -->
  
<!-- 본문들어가는 곳 -->
  <!-- 본문 메인 상단 -->
  
  <section id=""> 

  <article id=""><%=m_id %>님,<br>
  오늘도 꽃같은 날이예요</article>
	
  <article id="">
  등급 정보 : <a href=""><%=memberMypageDetail.getG_id() %> </a>ㅣ 
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
  		<li><a href="">개인정보 수정</a></li>
  		<li><a href="">회원등급</a></li>
  		<li><a href="">포인트</a></li>
		<li><a href="">1:1 문의내역</a></li>
		<li><a href="">자주묻는질문</a></li>
  	</ul>
  	</div>
	</section>
  	
  <!-- 본문 내용 -->
 <section>
 	<div>
 		<h2>주문내역/배송조회</h2>
 		
 		<div>
 		<h6>주문/배송내역</h6>
 		<table border="1">
 			<tr><td>주문 일자</td><td>상품 정보</td><td>상태</td></tr>
 	
			<%for(int i=0; i<nonOrderArrayList.size(); i++) {
   				int sumAmount = nonOrderArrayList.get(i).getO_amount() + nonOrderArrayList.get(i).getO_point() + nonOrderArrayList.get(i).getO_gdiscount();
   			%>
   				<tr><td><%=nonOrderArrayList.get(i).getO_rdate() %></td>
   					<td><%=nonItemArrayList.get(i).getI_name() %><br>
   						수령인 : <%=nonItemArrayList.get(i).getI_name() %><br>
   						가격 : <%=sumAmount %><br>
   						수량 : <%=nonOrderDetailArrayList.get(i).getOd_qty() %></td>
   					<td>
   					<%
   					if(nonOrderDetailArrayList.get(i).getOd_confirm()==1) {
   						%>배송 완료<%
   					} else if(!nonOrderDetailArrayList.get(i).getOd_invoice().equals("주문접수")) {
   						%>배송중<%
   					} else if(nonOrderDetailArrayList.get(i).getOd_invoice().equals("주문접수")) {
   						%>주문 접수<%
   					}
   					%>
   					</td>
   				</tr>
		<%}%>
 		</table>
 		</div>
 		
 		<div>
 		<h6>취소/환불내역</h6>
 		<table border="1">
 			<tr><td>주문 일자</td><td>상품 정보</td><td>상태</td></tr>
 			
		<%for(int i=0; i<orderArrayList.size(); i++) {
			int sumAmount = orderArrayList.get(i).getO_amount() + orderArrayList.get(i).getO_point() + orderArrayList.get(i).getO_gdiscount();
		%>
			<tr><td><%=orderArrayList.get(i).getO_rdate() %></td>
				<td><%=itemArrayList.get(i).getI_name() %><br>
					수령인 : <%=itemArrayList.get(i).getI_name() %><br>
					가격 : <%=sumAmount %><br>
					수량 : <%=orderDetailArrayList.get(i).getOd_qty() %>
				</td>
				<td>주문취소</td>
			</tr>
		<%}%>	
 		</table>
 		</div>

 	</div>
 </section>
 
 
 
 
 
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>