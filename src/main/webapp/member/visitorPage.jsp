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
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

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
 	<!-- header -->
  	<jsp:include page="../inc/header.jsp" ></jsp:include>
  	<!-- header -->




	주문내역상세<br>
	#<%=order.getO_id() %>
	<table>
		<tr>
			<td>배송일</td>
			<td>상품명</td>
			<td>가격</td>
			<td>배송비</td>
			<td>상태</td>
		</tr>
		<tr>
			<td><%=orderDetail.getOd_delivery_date() %></td>
			<td><%=itemDetail.getI_name() %></td>
			<td><%=NumberFormat.getInstance().format(order.getO_amount()) %></td>
			<td>0 원</td>
			<td><%=status %></td>
		</tr>
	</table>
	
	배송지정보<br>
	수령인이름 <%=order.getO_receiver() %><br>
	주소 <%=address[0]+" "+address[1]+" "+address[2] %><br>
	연락처 <%=order.getO_phone() %><br>
	
	편지정보-비회원<br>
	상품명 <%=itemDetail.getI_name() %>
	<textarea rows="10" cols="20"><%=orderDetail.getOd_message() %></textarea><br>
	
	결제정보<br>
	상품 합계 <%=NumberFormat.getInstance().format(order.getO_amount()) %>원<br>
	배송비 0원<br>
	쿠폰 할인 -0원<br>
	총 결제금액: <%=NumberFormat.getInstance().format(order.getO_amount()) %>원<br>
	
	결제방법:<%=payment %><br>
	결제일시:<%=sdf.format(order.getO_rdate2())%><br>
	
	*현금 영수증 발행은 1:1문의를 이용 부탁드립니다.<br>
	
	<input type="button" value="홈으로 돌아가기" onclick="location.href='./'">
	
	
	
		<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>