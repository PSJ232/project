<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사계 | 비회원 주문 조회</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_orderHistoryDetail.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="./css/utility.css">
<link rel="stylesheet" href="./css/mypage_subscribe.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	  rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%
OrderBean order = (OrderBean) request.getAttribute("visitorOrder");
OrderDetailBean orderDetail = (OrderDetailBean) request.getAttribute("orderDetail");
ItemBean itemDetail = (ItemBean) request.getAttribute("itemDetail");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String od_invoice = orderDetail.getOd_invoice();
String status = "주문접수";
if(!od_invoice.equals("주문접수") && orderDetail.getOd_confirm()==1) {
	status = "배송완료<br>" + od_invoice;
} else if(!od_invoice.equals("주문접수")){
	status = "배송중<br>" + od_invoice;
}

String[] address = order.getO_address().split("&");

int o_payment = order.getO_payment();
String payment = "";
switch (o_payment) {
case 0:
	payment = "무통장입금";
	break;
case 1:
	payment = "신용카드";
	break;
}
%>
</head>
<body>
	
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->
	<div class="mypage_container">
	
		<!-- 본문 내용 -->
<div class="mypage_orderHistoryDetail_all">
<h1 id="mypage_orderHistoryDetail_tltle">비회원 주문 상세 정보</h1>
<dl id="mypage_orderHistoryDetail_dl">
	<dt id="mypage_orderHistoryDetail_tltle_h3">주문내역상세</dt>
	<dd id="mypage_orderHistoryDetail_dd">#<%=order.getO_id() %></dd>
	</dl>
	<table class="mypage_orderHistoryDetail_table_t" >
		<tr>
			<td id="mypage_orderHistoryDetail_table_td_s" >배송일</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >상품명</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >가격</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >배송비</td>
			<td id="mypage_orderHistoryDetail_table_td_s" >상태</td>
		</tr>
		<tbody class="mypage_tbody">
		<tr>
			<td id="mypage_orderHistoryDetail_situation"><%=orderDetail.getOd_delivery_date() %></td>
			<td id="mypage_orderHistoryDetail_situation"><%=itemDetail.getI_name() %></td>
			<td id="mypage_orderHistoryDetail_situation"><%=NumberFormat.getInstance().format(order.getO_amount()) %></td>
			<td id="mypage_orderHistoryDetail_situation">0 원</td>
			<td id="mypage_orderHistoryDetail_situation"><%=status %></td>
		</tr>
		</tbody>
	</table>
	<div id="mypage_orderHistoryDetail_del_div">
	<h3 id="mypage_orderHistoryDetail_tltle_del_h3" >배송지정보</h3><br>
	<dl id="mypage_orderHistoryDetail_del_dl">
		<dt id="mypage_orderHistoryDetail_del_dt">수령인이름 <%=order.getO_receiver() %><br></dt>
	<dt id="mypage_orderHistoryDetail_del_dt">주소 <%=address[0]+" "+address[1]+" "+address[2] %><br></dt>
	<dt id="mypage_orderHistoryDetail_del_dt">연락처 <%=order.getO_phone() %><br></dt>
	</dl>
	
	<div id="mypage_orderHistoryDetail_del_div">
	<dl id="mypage_orderHistoryDetail_dl">
	
	<h3 id="mypage_orderHistoryDetail_tltle_del_h3" >편지정보-비회원</h3><br>
	<dt id="mypage_orderHistoryDetail_del_dt"> 상품명</dt>
	<dt id="mypage_orderHistoryDetail_del_dt"><%=itemDetail.getI_name() %></dt>
	<dt id="mypage_orderHistoryDetail_del_dt"><textarea class="mypage_textarea" rows="10" cols="20"><%=orderDetail.getOd_message() %></textarea></dt>
	</dl>
	</div>
	<div class="mypage_div">
	<h3 >결제정보</h3><br>
	<span id="mypage_orderHistoryDetail_del_span_l">상품 합계</span> <span id="mypage_orderHistoryDetail_del_span_r"> <%=NumberFormat.getInstance().format(order.getO_amount()) %>원</span><br> 
	<span id="mypage_orderHistoryDetail_del_span_l">배송비</span> <span id="mypage_orderHistoryDetail_del_span_r"> 0원</span><br> 
	<span id="mypage_orderHistoryDetail_del_span_l">쿠폰 할인</span> <span id="mypage_orderHistoryDetail_del_span_r"> -0원</span><br> 
	<span id="mypage_orderHistoryDetail_del_span_l">총 결제금액</span> <span id="mypage_orderHistoryDetail_del_span_r"> <%=NumberFormat.getInstance().format(order.getO_amount()) %>원</span><br> 
	</div>
	<div class="mypage_div">
	
	<span id="mypage_orderHistoryDetail_del_span_l">결제방법:</span><span id="mypage_orderHistoryDetail_del_span_r"><%=payment %></span><br>
	<span id="mypage_orderHistoryDetail_del_span_l">결제일시:</span><span id="mypage_orderHistoryDetail_del_span_r"><%=sdf.format(order.getO_rdate2())%></span><br>
	<div class="mypage_div">
	
	<p id="mypage_orderHistoryDetail_p">*현금 영수증 발행은 1:1문의를 이용 부탁드립니다.</p>
	
	<input class="mypage_button" type="button" value="홈으로 돌아가기" onclick="location.href='./'">
	</div>
</div>
</div>
	</div>



	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->

</body>
</html>