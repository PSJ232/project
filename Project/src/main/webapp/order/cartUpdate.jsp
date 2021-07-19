<%@page import="vo.CartBean"%>
<%@page import="vo.ItemBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
CartBean cartDetail = (CartBean)request.getAttribute("cartDetail");
ItemBean itemDetail = (ItemBean)request.getAttribute("itemDetail");
int c_qty = cartDetail.getC_qty();

%>
<body>
<h2>장바구니</h2>
<form action="CartUpdatePro.cr" method="post">
	<table border="1">
		<tr>
			<td><input type="checkbox"></td>
			<td>상품정보</td>
			<td>추가상품</td>
			<td>합계금액</td>
		</tr>
		<tr>
			<td><input type="checkbox"></td>
			<td>
			<%=itemDetail.getI_img() %>
			<%=itemDetail.getI_name() %>
			<%=itemDetail.getI_price() %>
			<%=c_qty %>
			</td>
			<td>1번추가상품</td>
			<td><%=itemDetail.getI_price() %></td>
		</tr>
	</table>



	
	구매 전 확인해주세요.
	- 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)<br>
	- [정기구독] 상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.<br>

총 주문금액 <%=itemDetail.getI_price() %>원 + 배송비 ???원 = 총 결제 금액 <%=itemDetail.getI_price() %>원<br>



<input type="hidden" name="i_id" value="<%=cartDetail.getI_id()%>">
<input type="hidden" name="m_id" value="<%=cartDetail.getM_id()%>">
<input type="submit" value="장바구니 담기">
<input type="button" value="구매하기">
</form>
</body>
</html>