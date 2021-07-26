<%@page import="java.text.NumberFormat"%>
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
<%
ItemBean itemDetail = (ItemBean) request.getAttribute("itemDetail");
CartBean cartDetail = (CartBean) request.getAttribute("cartDetail");
%>
</head>
<body>
	<h2>장바구니</h2>
	<form action="OrderCart.od" method="post">
		<table border="1">
			<tr>
				<td>상품정보</td>
				<td>추가상품</td>
				<td>합계금액</td>
			</tr>
			<%
			if (itemDetail != null) { // 비어있는지 확인하여 화면을 선택 표시
				String i_img = itemDetail.getI_img(); //상품 이미지
				String i_name = itemDetail.getI_name(); //상품 이름
				String c_delivery_date = cartDetail.getC_delivery_date(); //상품 배송 요청일
				int i_price = (int) (itemDetail.getI_price() * itemDetail.getI_discount() / 100) * 100; //상품(할인) 가격, 강제형변환으로 10원단위 절삭함
				int c_qty = cartDetail.getC_qty(); // 상품 수량
				int c_letter = cartDetail.getC_letter(); //편지지 선택 여부

				int letterPrice = 0; // 편지지 추가에 따른 추가요금
				String letter = ""; // 편지지가 선택되면 추가상품에 보이고, 선택되지 않으면 안보임(널스트링)
				if (c_letter == 1) { // 편지지가 1이면 2500원 추가, 0이면 선택안함
					letterPrice = 2500;
					letter = "편지 2,500원";
				}

				String sumAmount = NumberFormat.getInstance().format((i_price * c_qty) + letterPrice); //각 상품에 대한 합계금액
			%>
			<tr>
				<td>
					<img src="<%=i_img%>"><br> <%=i_name%><br>
					수령일:<%=c_delivery_date%><br> <%=NumberFormat.getInstance().format(i_price)%>원<br>
					<%=c_qty%> 개<br>
				</td>
				<td><%=letter%></td>
				<td>
					<%=sumAmount%>원<br>
					무료배송
				</td>
			</tr>
		</table>


		구매 전 확인해주세요.<br>
		 - 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)<br>
		 - [정기구독] 상품의
		첫 번째 발송일에 일반 택배 상품을 함께 구매하실 경우,중복 배송비는 부분 환불 처리해 드립니다.<br>
		<hr>

		총 주문금액
		<%=sumAmount%>
		원 + 배송비 0원 = 총 결제 금액
		<%=sumAmount%>원<br>
		
		<input type="hidden" name="c_delivery_date" value="<%=c_delivery_date%>">
		<input type="hidden" name="i_id" value="<%=request.getParameter("i_id")%>">
		<input type="hidden" name="c_qty" value="<%=c_qty%>">
		<input type="hidden" name="c_letter" value="<%=c_letter%>">
		
		<input type="button" value="장바구니저장(회원전용)">
		<input type="button" value="회원가입">
		<input type="submit" value="할인 없이 구매하기">
	</form>

	<%
	} else {
	%>
	</table>
	</form>
	<!-- if문안에서 태그가 짤려서 추가 -->
	장바구니가 비어있습니다.<br>
	그 계절 가장 이쁜 꽃으로 행복을 채워보세요.<br>

	<input type="button" value="쇼핑하러 가기" onclick="location='./'">


	<%
	}
	%>
</body>
</html>