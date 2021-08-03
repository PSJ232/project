<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
<!-- ajax에 쓰이는 css : 수정 마음껏 하셔도 괜찮습니다. -->
<style type="text/css">

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
 ul.tabs li{ 
 	background: none; 
 	display: inline-block; 
 	padding: 10px 15px; 
 	cursor: pointer; 
 } 

ul.tabs li.current{
	color: #222;
}

.tab-content{
	display: none;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
</style>
</head>
<body>

<%  
// 멤버 정보
String m_id = (String)session.getAttribute("m_id");
MemberBean memberMypageDetail = (MemberBean)request.getAttribute("memberMypageDetail");

ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>)request.getAttribute("nonOrderArrayList");
ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>)request.getAttribute("orderArrayList");
ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>)request.getAttribute("nonItemArrayList");
ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>)request.getAttribute("itemArrayList");
ArrayList<OrderDetailBean> nonOrderDetailArrayList = (ArrayList<OrderDetailBean>)request.getAttribute("nonOrderDetailArrayList");
ArrayList<OrderDetailBean> orderDetailArrayList = (ArrayList<OrderDetailBean>)request.getAttribute("orderDetailArrayList");

// 출력되는 행의 컬럼번호 받아오기(해당 행에만 <td rowspan="">부여)
// 주문내역의 o_id에 따른 번호 리스트
String o_id = "";
ArrayList<Integer> nonCol = new ArrayList<Integer>();
for(int i =0; i<nonOrderArrayList.size(); i++) {
	if(!o_id.equals((nonOrderArrayList.get(i).getO_id()+""))) {
		nonCol.add(i);} 
	else {}
	if(i==nonOrderArrayList.size()-1) {nonCol.add(i+1);	}
	o_id = nonOrderArrayList.get(i).getO_id() + "";
}
// 취소내역의 o_id에 따른 컬럼 번호 리스트
o_id = "";
ArrayList<Integer> col = new ArrayList<Integer>();
for(int i =0; i<orderArrayList.size(); i++) {
	if(!o_id.equals((orderArrayList.get(i).getO_id()+""))) {
		col.add(i);}
	else {}
	if(i==orderArrayList.size()-1) {col.add(i+1);}
	o_id = orderArrayList.get(i).getO_id() + "";
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
  		<li><a href="OrderMypageDetailList.od">주문내역/배송조회</a></li>
  		<li><a href="MypageSubscribe.od">나의 정기구독</a></li>
  		<li><a href="MyClass.me">클래스 수강내역</a></li>
		<li><a href="ReviewInsertForm.rv">상품 리뷰</a></li>
  	</ul>
 	 </div>
 	 
 	 <div>
  	 <h2>개인정보 관리</h2>
  	<ul type="none">
		<li class="list"><a href="MemberUpdate.me">개인정보 수정</a></li>
		<li class="list"><a href="MemberMypageGradeDetail.me">회원등급</a></li>
		<li class="list"><a href="MemberMypagePointDetail.me">포인트</a></li>
		<li class="list"><a href="QnaInsert.qna">1:1 문의내역</a></li>
		<li class="list"><a href="QnaList.qna">QNA리스트</a></li>
		<li class="list"><a href="Faq.me">자주묻는질문</a></li>
  	</ul>
  	</div>
	</section>
  	
  <!-- 본문 내용 -->
 <section>
 		<h2>나의 정기구독</h2>

<!--   -------------------------------------------------- -->
  	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">주문/배송내역</li>
		<li class="tab-link" data-tab="tab-2">취소/환불내역</li>
	</ul>
<!--   -------------------------------------------------- -->

 	<div>
 		<div id="tab-1" class="tab-content current">
 		<h6>주문/배송내역</h6>
 		<table border="1">
 			<tr><td>첫 구독일</td><td>상품 정보</td><td>상태</td></tr>
 	
			<%
			if(nonOrderDetailArrayList.isEmpty()) {
				%><tr><td colspan="3">구독내역이 존재하지 않습니다.<br>
					  <input type="button"  onclick="location.href='Subscription.shop'" value="구독 상품 보러가기">
					  </td></tr><%
			} else {
				int count = 0;
				for(int i=0; i<nonOrderArrayList.size(); i++) {
	
					// 배송 날짜 String -> Date 변환
					Date deliveryDate = Date.valueOf(nonOrderDetailArrayList.get(i).getOd_delivery_date());
					Date today = Date.valueOf(LocalDate.now());
	   				%>
	   				
	   				<tr>
	   					<%if(nonCol.contains(i)) {
	   						%><td rowspan="<%=nonCol.get(count+1)-nonCol.get(count) %>"><%=nonOrderArrayList.get(i).getO_rdate() %></td><%
	   						count++;
	   					} else {}
	   					%>
	   					<td>
	   						상품 명 : <a href ="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id() %>"><%=nonItemArrayList.get(i).getI_name() %></a><br>
							수령일 : <%=nonOrderDetailArrayList.get(i).getOd_delivery_date() %><br>
							받는 분 : <%=nonOrderArrayList.get(i).getO_receiver() %><br>
							가격 : <%=(int)(nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100 %> / <%=nonOrderDetailArrayList.get(i).getOd_qty() %>
						</td>
	   					<%
	   					if(deliveryDate.before(today)) {
	   						%><td>배송 완료</td><%
	   					} else if(deliveryDate.after(today)) {
	   						%><td>배송 예정</td><%
	   					} else if(deliveryDate.equals(today)) {
	   						%><td>배송 완료</td><%
	   					}
	   					%>
	   				</tr>
				<%}
			}%>
 		</table>
 		</div>
 		
 		<div id="tab-2" class="tab-content">
 		<h6>취소/환불내역</h6>
 		 		<table border="1">
 			<tr><td>주문 일자</td><td>상품 정보</td><td>상태</td></tr>
 	
			<%
			if(orderDetailArrayList.isEmpty()) {
				%><tr><td colspan="3">취소/환불한 구독내역이 존재하지 않습니다.<br>
					  <input type="button"  onclick="location.href='Subscription.shop'" value="구독 상품 보러가기">
					  </td></tr><%
			} else {
			
				int ccount = 0;
				for(int i=0; i<orderArrayList.size(); i++) {
	   				%>
	   				
	   				<tr>
	   					<%if(col.contains(i)) {
	   						%><td rowspan="<%=col.get(ccount+1)-col.get(ccount) %>"><%=orderArrayList.get(i).getO_rdate() %></td><%
	   					} else {}
	   					%>
	   					<td>
	   						상품 명 : <a href ="OrderMypageDetail.od?o_id=<%=orderArrayList.get(i).getO_id() %>"><%=itemArrayList.get(i).getI_name() %></a><br>
							수령일 : <%=orderDetailArrayList.get(i).getOd_delivery_date() %><br>
							받는 분 : <%=orderArrayList.get(i).getO_receiver() %><br>
							가격 : <%=(int)(itemArrayList.get(i).getI_price() * itemArrayList.get(i).getI_discount() / 100) * 100 %> / <%=orderDetailArrayList.get(i).getOd_qty() %>
						</td>
						<%if(col.contains(i)) {
	   						%><td rowspan="<%=col.get(ccount+1)-col.get(ccount) %>">주문 취소</td><%
	   							ccount++;
	   					} else {}
						%>
	   				</tr>
				<%}
			}%>
 		</table>
 		</div>
 	</div>
 </section>
 
 
 
 
 
<!-- 푸터 들어가는곳 -->

<!-- 푸터 들어가는곳 -->
</body>
</html>