<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	ArrayList<OrderBean> orderList = (ArrayList<OrderBean>)request.getAttribute("orderList");
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
	<tr><th>주문번호</th><th>주문날짜</th><th>결제수단</th><th>결제금액</th></tr>
	<%
		for(OrderBean order: orderList){
			%>
			<tr>
			<td><%=order.getO_id() %></td>
			<td><%=order.getO_rdate() %></td>
			<td><%=order.getO_payment() %></td>
			<td><%=order.getO_amount() %></td>
			</tr>
			<%
		}
	%>
</table>
</body>
</html>