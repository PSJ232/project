<%@page import="vo.OrderListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	ArrayList<OrderListBean> orderList = (ArrayList<OrderListBean>)request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원상세정보</h1>
회원아이디: <%=memberBean.getM_id() %><br>
회원이름: <%=memberBean.getM_name() %><br>
회원전화번호: <%=memberBean.getM_phone() %><br>
회원생일: <%=memberBean.getM_birth() %><br>
회원성별: <%=memberBean.getM_gender() %><br>
회원등급: <%=memberBean.getG_id()%><br>
마케팅 동의여부: <%=memberBean.getM_agree() %><br>
가입날짜: <%=memberBean.getM_rdate() %><br>
포인트: <%=memberBean.getM_point() %><br>
<%if(memberBean.getM_drop() != null){ %>탈퇴날짜: <%=memberBean.getM_drop() %><%} %><br>

<h1>회원 주문 기록</h1>
<table id="orderList" border="1">
	<tr>
		<th>주문번호</th>
		<th>주문자ID</th>
		<th>주문상품</th>
		<th>주문금액</th>
		<th>주문일시</th>
		<th>배송상태</th>
	</tr>
	<%
		for(OrderListBean order: orderList){
			%>
			<tr>
			<td><a href='OrderDetail.ad?o_id=<%=order.getO_id() %>'><%=order.getO_id() %></a></td>
			<td><%=order.getM_id() %></td>
			<td><%=order.getI_name() %></td>
			<td><%=order.getO_amount() %></td>
			<td><%=order.getO_rdate() %></td>
			<td><%=order.getOd_invoice() %></td>
			</tr>
			<%
		}
	%>
</table>
</body>
</html>