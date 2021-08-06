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
<link rel="stylesheet" href="./css/cart.css">
<link rel="stylesheet" href="./css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

<%
ItemBean itemDetail = (ItemBean) request.getAttribute("itemDetail");
CartBean cartDetail = (CartBean) request.getAttribute("cartDetail");
int sub_option = 1;
String sub_content = "";
if(request.getParameter("sub_option") != null){
	sub_option = Integer.parseInt(request.getParameter("sub_option"));
	switch(sub_option){
	case 2: sub_content = "1개월구독권 x 2주"; break;
	case 4: sub_content = "2개월구독권 x 2주"; break;
	case 12: sub_content = "6개월구독권 x 2주"; break;
	case 24: sub_content = "12개월구독권 x 2주"; break;
	}
}
%>
</head>
<body>

	<!-- header -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- header -->
	
	<div class="cart_div">
	<div class="cart_header">
	<h5>장바구니(비회원 미리보기)</h5>
	</div>
	<form action="VisitorOrderNow.od" method="post">
		<div class="cart_div2">
			<div class="cart_div3">
				<div class="cart_div4">
					<table border="1" class="cart_table">
						<tr class="cart_tr1">
							<td class="cart_td1">
							<div class="cart_span1">상품정보</div></td>
							<td class="cart_td2"><span class="cart_span">추가상품</span></td>
							<td class="cart_td3"><span class="cart_span">합계금액</span></td>
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

				String sumAmount = NumberFormat.getInstance().format((i_price * c_qty * sub_option) + letterPrice); //각 상품에 대한 합계금액
				String visiorAmount = NumberFormat.getInstance().format((itemDetail.getI_price() * c_qty  * sub_option) + letterPrice); //각 상품에 대한 할인전 합계금액
			%>
			<tr class="cart_tr2">
				<td class="cart_td2">
					<img src="./admin_layout/upload/<%=i_img%>" class="cart_img"><br>
					<div class="cart_desc">
					<span class="cart_span4"><%=i_name%></span><br>
					<%if(sub_option > 1){ %>
					첫 구독일 : <%=c_delivery_date%><br>
					구독내용 : <%=sub_content%><br>
					<%=NumberFormat.getInstance().format(i_price * c_qty * sub_option)%>원<br>
					<%}else{%> 
					수령일 : <%=c_delivery_date%><br>
					<%=NumberFormat.getInstance().format(i_price * c_qty)%>원<br>
					<%} %>
					<%=c_qty%> 개<br>
					</div>
				</td>
				<td><%=letter%></td>
				<td>
					<%=sumAmount%>원<br>
					무료배송
				</td>
			</tr>
		</table>
		</div>
		</div>
		</div>


		구매 전 확인해주세요.<br>
		 - 구매 금액 합산이 30,000원 이상일 경우, 배송비는 무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)<br>
		<hr>

		총 주문금액	<%=visiorAmount%>원 + 배송비 0원 = 총 결제 금액 <%=visiorAmount%>원 <%if(itemDetail.getI_discount() != 1){%>[회원가 <%=sumAmount%>원]<%}%><br>
		
		<input type="hidden" name="c_delivery_date" value="<%=c_delivery_date%>">
		<input type="hidden" name="i_id" value="<%=request.getParameter("i_id")%>">
		<input type="hidden" name="c_qty" value="<%=c_qty%>">
		<input type="hidden" name="c_letter" value="<%=c_letter%>">
		
		<input type="submit" value="할인없이 구매하기"><br>
		<input type="button" value="회원가입" onclick="location.href='MemberJoin.me'"><br>
		지금 회원가입 하시면 1,000p 바로 지급!
	</form>

	<%
	} else {
	%>
	</table></div>
	</form>
	<!-- if문안에서 태그가 짤려서 추가 -->
	장바구니가 비어있습니다.<br>
	그 계절 가장 이쁜 꽃으로 행복을 채워보세요.<br>

	<input type="button" value="쇼핑하러 가기" onclick="location='./'">


	<%
	}
	%>
	
	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
</body>
</html>