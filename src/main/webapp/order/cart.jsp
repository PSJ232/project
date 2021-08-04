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
<link rel="stylesheet" href="./css/cart.css" type="text/css" />
<%
ArrayList<CartBean> cartList = (ArrayList<CartBean>) request.getAttribute("cartList"); //장바구니에서 가져온 목록
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList"); //장바구니에 담긴 아이템의 목록(위 장바구니 ArrayList와 순서동일)
%>
<script type="text/javascript">
function qtyUpdate(c_id, i_inven, c_qty){ // 버튼을 누르면 증감 수행, 재고수량보다 많이 담을 경우 더 이상 담을 수 없다고 정보 표시함
	if(i_inven > c_qty) {
    	document.getElementById('cartNotice'+c_id).innerHTML = "";
    	location.href="CartUpdatePro.cr?c_id="+c_id+"&add=1";
	} else {
		document.getElementById('cartNotice'+c_id).innerHTML = "- 해당 상품의 최대 구매 가능한 수량은 " + i_inven + "개 입니다.";
	}
}
</script>
<link rel="stylesheet" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- header -->
	<div class="cart_div">
		<header class="cart_header">
			<h2 class="cart_h2">장바구니</h2>
		</header>

		<form action="OrderCart.od" method="post">
			<div class="cart_div2">
				<div class="cart_div3">
					<div class="cart_div4">
						<table border="1" class="cart_table">
							<tr>
								<td class="cart_td"><input type="checkbox"
									class="cart_input"><span class="cart_span">상품정보</span></td>
								<td class="cart_td"><span class="cart_span2">추가상품</span></td>
								<td class="cart_td"><span class="cart_span3">합계금액</span></td>
							</tr>

							<%
							if (cartList.size() != 0) { // 장바구니 목록이 비어있는지 확인하여 화면을 선택 표시
								int totalAmount = 0; // 총 합계 금액 저장할 변수
								int i;
								for (i = 0; i < cartList.size(); i++) {// 장바구니와 아이템의 ArrayList에서 필요 정보 반복 추출
									String i_img = itemList.get(i).getI_img(); //상품 이미지
									String i_name = itemList.get(i).getI_name(); //상품 이름
									String delivery_date = cartList.get(i).getC_delivery_date(); //상품 배송 요청일
									int i_price = (int) (itemList.get(i).getI_price() * itemList.get(i).getI_discount() / 100) * 100; //상품(할인) 가격, 강제형변환으로 10원단위 절삭함
									int c_qty = cartList.get(i).getC_qty(); // 상품 수량
									int c_letter = cartList.get(i).getC_letter(); //편지지 선택 여부
									int c_id = cartList.get(i).getC_id(); // 장바구니 상품 번호 
									int i_inven = itemList.get(i).getI_inven(); // 상품 재고
									int i_category = itemList.get(i).getI_category(); // 상품 분류 번호
									int sub_option = cartList.get(i).getSub_option(); // 구독옵션 번호

									int letterPrice = 0; // 편지지 추가에 따른 추가요금
									String letter = ""; // 편지지가 선택되면 추가상품에 보이고, 선택되지 않으면 안보임(널스트링)
									if (c_letter == 1) { // 편지지가 1이면 2500원 추가, 0이면 선택안함
								letterPrice = 2500;
								letter = "편지 2,500원";
									}

									int sumAmount = i_price * c_qty + letterPrice; //각 상품에 대한 합계금액

									String sub_content = "";
									switch (sub_option) {
									case 2:
								sub_content = "1개월구독권 x 2주";
								i_price = i_price * sub_option;
								sumAmount = i_price * c_qty + letterPrice;
								break;
									case 4:
								sub_content = "2개월구독권 x 2주";
								i_price = i_price * sub_option;
								sumAmount = i_price * c_qty + letterPrice;
								break;
									case 12:
								sub_content = "6개월구독권 x 2주";
								i_price = i_price * sub_option;
								sumAmount = i_price * c_qty + letterPrice;
								break;
									case 24:
								sub_content = "12개월구독권 x 2주";
								i_price = i_price * sub_option;
								sumAmount = i_price * c_qty + letterPrice;
								break;
									}

									totalAmount += sumAmount; // 각 상품에 대한 합계금액을 누적한 총 합계금액
							%>
							<tr class="cart_tr">
								<td class="cart_td2"><input type="checkbox"
									class="cart_input2" name="c_id<%=i%>" value="<%=c_id%>" checked><img
									src="./admin_layout/upload/<%=i_img%>" class="cart_img"><br>
									<span class="cart_span4"><%=i_name%></span><input type="button"
									class="cart_input3" value="x"
									onclick="location.href='CartDeletePro.cr?c_id=<%=c_id%>'"><br>
									<%
									if (i_category == 3) {
									%> 첫 구독일 : <%=delivery_date%><br>
									구독내용 : <%=sub_content%><br> <%=NumberFormat.getInstance().format(i_price * c_qty)%>원<br>
									<%
									} else {
									%> <span class="cart_span5">수령일:<%=delivery_date%></span><br>
									<span class="cart_span6"><%=NumberFormat.getInstance().format(i_price * c_qty)%>원</span><br>
									<%
									}
									%> <input type="button" class="cart_input4" value="-"
									onclick="location.href='CartUpdatePro.cr?c_id=<%=c_id%>&add=-1'">
									<span class="cart_span7"><%=c_qty%></span> <input type="button" 
									class="cart_input4" value="+" onclick="qtyUpdate(<%=c_id%>, <%=i_inven%>, <%=c_qty%>)">
									<br> <span id="cartNotice<%=c_id%>"></span></td>
								<td class="cart_td3"><span class="cart_span8"><%=letter%></span>
									<%
									if (c_letter == 1) {
									%><input type="button" class="cart_input7" value="x"
									onclick="location.href='CartUpdatePro.cr?c_id=<%=c_id%>&letter=0'">
									<%
									}
									%></td>
								<td class="cart_td4"><span class="cart_span9"><%=NumberFormat.getInstance().format(sumAmount)%>원</span><br>
									<span class="cart_span10
					
					">무료배송</span></td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
				</div>
			</div>
			<div class="cart_div5">
				<p class="cart_p">
					<strong class="cart_strong">&nbsp;&nbsp;구매 전 확인해주세요.</strong><br> <span
						class="cart_span11">- 구매 금액 합산이 30,000원 이상일 경우, 배송비는
						무료입니다.(단,[정기구독],[무료배송] 상품은 구매금액 합산에 포함되지 않습니다.)</span><br> <span
						class="cart_span11">- [정기구독]상품의 첫 번째 발송일에 일반 택배 상품을 함께 구매하실
						경우,중복 배송비는 부분 환불 처리해 드립니다.</span>
				</p>
				<p class="cart_p2">
					<span class="cart_span12"> <span class="cart_span13">총
							주문금액</span><span class="cart_span14">&nbsp;<%=totalAmount%>원
					</span>
					</span> <span class="cart_span15">+</span> <span class="cart_span12">
						<span class="cart_span13">배송비<span class="cart_span16">0원</span></span>
					</span> <span class="cart_span19">=</span> <span class="cart_span17">
						<span class="cart_span18">총 결제 금액</span> <span class="cart_span20"><%=totalAmount%>원</span>
						<%-- (체크하면 금액계산되는 기능 구현 필요)--%>
					</span>
				</p>
				<br> <input type="hidden" name="iNum" value="<%=i%>">
				<div class="cart_div6">
					<div class="cart_div7">
						<input type="submit" class="cart_input5" value="구매하기">
					</div>
				</div>
			</div>
		</form>

		<%
		} else {
		%>
		</table>
		</form>
		<!-- if문안에서 태그가 짤려서 추가 -->
		<p class="cart_p3">
			<span class="cart_span21">장바구니가 비어있습니다. <br> 그 계절 가장 이쁜
				꽃으로 행복을 채워보세요.
			</span> <input type="button" class="cart_input6" value="쇼핑하러 가기"
				onclick="location='./'">
		</p>
		<%
		}
		%>
	</div>

	<!-- footer -->
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	<!-- footer -->
	
	
</body>
</html>