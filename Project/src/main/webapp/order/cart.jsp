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
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");
int letterCount = 0; // 편지지페이지에서 작성해야될 편지지 숫자를 알려주는 값
%>
<body>
	<h2>장바구니</h2>
	<form action="OrderCart.od" method="post">
		<input type="checkbox">전체선택(<%=cartList.size()%>)
		<table border="1">
			<tr>
				<td><input type="checkbox">상품정보</td>
				<td>추가상품</td>
				<td>합계금액</td>
			</tr>
			<%
			int totalAmount = 0; // 총합계금액 변수
			for (int i = 0; i < cartList.size(); i++) {// ArrayList에 든 CartBean 하나씩 꺼내기
				String i_img = itemList.get(i).getI_img();
				String i_name = itemList.get(i).getI_name();
				String delivery_date = cartList.get(i).getC_delivery_date();

				int c_letter = cartList.get(i).getC_letter();
				int i_price = itemList.get(i).getI_price();
				int c_qty = cartList.get(i).getC_qty();

				int letterPrice = 0; // 편지지 추가에 따른 추가요금
				String letter = ""; // 편지지가 선택되면 추가상품에 보이고, 선택되지 않으면 안보임
				if (c_letter == 1) { // 편지지가 1이면 2500원 추가, 0이면 선택안함
					letterPrice = 2500;
					letter = "편지 2,500원";
					letterCount += 1;
				}

				int sumAmount = i_price * c_qty + letterPrice;

				totalAmount += sumAmount;
			%>
			<tr>
				<td><input type="checkbox">상품이미지<%=i_img%><br> <%=i_name%><input
					type="button" value="x" onclick=""><br> 수령일:<%=delivery_date%><br>
					<%=i_price%>원<br> -<%=c_qty%>+<br></td>
				<td><%=letter%><input type="button" value="x" onclick=""></td>
				<td><%=sumAmount%>원<br> 무료배송</td>
			</tr>
			<%
			}
			%>
		</table>


		구매 전 확인해주세요.<br>
		- 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)<br>
		- [정기구독] 상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.<br>
		<hr>
	
		총 주문금액 <%=totalAmount %> 원 + 배송비 0원 = 총 결제 금액 <%=totalAmount %>원<br>
		
		<input type="hidden" name="letterCount" value="<%=letterCount %>">
		<input type="submit" value="구매하기">
	</form>
	
	
	
	<br><br><br>
	<hr>
	<form action="CartInsertPro.cr" method="post">
		- 장바구니 담기 테스트 용 input -<br>
		아이템ID<input type="number" name="i_id" value=""><br>
		수량<input type="number" name="c_qty" value=""><br>
		편지추가<input type="radio" name="c_letter" value="1" checked>추가할게요(2,500원)<input type="radio" name="c_letter" value="0">추가하지 않을게요<br>
		배달요청일<input type="date" name="c_delivery_date"><br>
		<input type="submit" value="장바구니담기">
	</form>
	<br><br><br><br><br>
</body>
</html>