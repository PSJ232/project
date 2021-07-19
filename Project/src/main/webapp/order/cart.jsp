<%@page import="svc.ItemDetailService"%>
<%@page import="java.util.ArrayList"%>
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
ArrayList<CartBean> cartList = (ArrayList<CartBean>) request.getAttribute("cartList");
%>
<body>
	<h2>장바구니</h2>
	<form action="" method="post">
		<input type="checkbox">전체선택(//숫자)
		<table border="1">
			<%
			ItemDetailService itemDetailService = new ItemDetailService();
			ItemBean ib = null;
			int totalAmount = 0;
			for(CartBean cb : cartList) {
				ib = itemDetailService.selectItem(cb.getI_id());
				int letterPrice = 0; // 편지지 추가에 따른 추가요금
				if(cb.getC_letter() == 1){
					letterPrice = 2500;
				}
				
				int sumAmount = ib.getI_price() * cb.getC_qty() + letterPrice;
				
				totalAmount += sumAmount;
				
			%>
			<tr>
				<td><input type="checkbox"></td>
				<td><input type="button" value="x" onclick="">상품이미지<%=ib.getI_img() %></td>
				<td>수령일:<%=cb.getC_delivery_date() %></td>
				<td>수량:<%=cb.getC_qty() %></td>
				<td>합계금액 <%=sumAmount%></td>
				<td><input type="button" value="x" onclick="">추가옵션:<%=cb.getC_letter() %></td>
			</tr>
			<%	
			}
			%>
	
		</table>
	
	
	
		
		구매 전 확인해주세요.<br>
		- 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)<br>
		- [정기구독] 상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.<br>
	
		총 주문금액 <%=totalAmount %> 원 + 무료배송 = 총 결제 금액 <%=totalAmount %>원<br>
	
		<input type="submit" value="구매하기">
	</form>
	<br><br><br><br><br>
	<form action="CartInsertPro.cr" method="post">
		- 장바구니 담기 테스트 용 input -<br>
		아이템ID<input type="number" name="i_id" value=""><br>
		수량<input type="number" name="c_qty" value=""><br>
		편지지추가(2500원)<input type="checkbox" name="c_letter" value="1"><br>
		배달요청일<input type="date" name="c_delivery_date">
		<input type="submit" value="장바구니담기">
	</form>
</body>
</html>