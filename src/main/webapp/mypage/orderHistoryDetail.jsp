<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> <
<%
String m_id = (String) session.getAttribute("m_id");
MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
OrderBean orderBean = (OrderBean) request.getAttribute("orderBean");
ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>) request.getAttribute("orderDetailList");
ArrayList<ItemBean> itemList = (ArrayList<ItemBean>) request.getAttribute("itemList");

// 주소 분리(우편번호, 도로명, 분류)
String[] address = orderBean.getO_address().split("&");

// 편지지 구매 이력을 기반으로 추가 상품 금액 도출
// 	int addPrice = 0;
// 	for(int i =0; i<orderDetailList.size(); i++) {
// 		if(orderDetailList.get(i).getL_id()!=0) {
// 			addPrice += 2500;
// 		} else {}
// 	}

// 왜인지 모르겠지만,꾸까는 단품(한종류)으로 여러개를 시키면 편지지는 중복계산되지않고 1개만 계산함
// 아마도 같은 배송지이고 같은 날자이기때문에 1개만 추가되는 것 같음
// 또한 정기구독의 경우도 마찬가지로 최초결제시 2500원 1회만 포함됨
// 그래서 위와같이 계산하면 표시되는 금액에 오류가 있으므로, 조금 번거롭지만 아래 처럼 코드를 수정함
int sumPrice = 0;
for (int i = 0; i < orderDetailList.size(); i++) {
	int i_id = orderDetailList.get(i).getI_id();
	int od_qty = orderDetailList.get(i).getOd_qty();

	for (int j = 0; j < itemList.size(); j++) {
		if (itemList.get(j).getI_id() == i_id) {
	int i_price = itemList.get(j).getI_price();
	float i_discount = itemList.get(j).getI_discount();
	int price = (int) (i_price * i_discount / 100) * 100 * od_qty;
	sumPrice += price;
		}
	}
}
int o_gdiscount = orderBean.getO_gdiscount();
int addPrice = orderBean.getO_amount() - sumPrice;

// 결제수단 구분
// 0:계좌이체, 1:신용카드, 2:카카오페이, 3:네이버페이 (미정)
String paymentMethod = "";
switch (orderBean.getO_payment()) {
case 0:
	paymentMethod = "계좌이체";
	break;
case 1:
	paymentMethod = "신용카드";
	break;
}

// 결제 일자 설정
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

</head>
<body>
	<!-- 헤더 들어가는곳 -->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<!-- 헤더 들어가는곳 -->

	<!-- 본문 메인 상단 -->
	<jsp:include page="../inc/mypagebanner.jsp"></jsp:include>

	<!-- 본문 왼쪽 메뉴 -->
	<div class="mypage_container">
		<jsp:include page="../inc/mypagemenu.jsp"></jsp:include>

		<!-- 본문 내용 -->

		<h1>OrderHistoryDetail</h1>
		<input type="button" value="주문 취소하기"
			onclick="location.href='OrderCancel.od?o_id=<%=orderBean.getO_id()%>&i_category=<%=itemList.get(0).getI_category()%>'">
		<h2>i_category : <%=itemList.get(0).getI_category()%></h2>
		<h3>주문내역 상세</h3>
		주문번호 :
		<%=orderBean.getO_id()%>

		<table border="1">
			<tr>
				<td>주문일자</td>
				<td>상품정보</td>
				<td>상태</td>
			</tr>

			<%
			for (int i = 0; i < itemList.size(); i++) {
			%>
			<tr>

				<%
				if (i == 0) {
				%><td rowspan=<%=itemList.size()%>><%=orderBean.getO_rdate()%></td>
				<%
				} else {
				}
				%>

				<td>상품 명 : <%=itemList.get(i).getI_name()%><br> 수령일 : <%=orderDetailList.get(i).getOd_delivery_date()%><br>
					받는 분 : <%=orderBean.getO_receiver()%><br> 가격 : <%=(int) (itemList.get(i).getI_price() * itemList.get(i).getI_discount() / 100) * 100%>
					/ <%=orderDetailList.get(i).getOd_qty()%>
				</td>

				<%
				if (i == 0) {
					if (orderDetailList.get(i).getOd_confirm() == 2) {
				%><td rowspan=<%=itemList.size()%>>주문 취소</td>
				<%
				} else if (orderDetailList.get(i).getOd_confirm() == 1) {
				%><td rowspan=<%=itemList.size()%>>배송 완료</td>
				<%
				} else if (!orderDetailList.get(i).getOd_invoice().equals("주문접수")) {
				%><td rowspan=<%=itemList.size()%>>배송중</td>
				<%
				} else if (orderDetailList.get(i).getOd_invoice().equals("주문접수")) {
				%><td rowspan=<%=itemList.size()%>>주문 접수</td>
				<%
				}
				} else {
				}
				%>

			</tr>
			<%
			}
			%>
		</table>

		<h3>배송정보</h3>
		<%=orderBean.getO_receiver()%>,
		<%=orderBean.getO_phone()%>
		(보내는 사람:
		<%=orderBean.getO_sender()%>)<br> [<%=address[0]%>]
		<%=address[1]%>,
		<%=address[2]%>


		<h4>결제 정보</h4>
		<table border="1">
			<tr>
				<td>주문 금액<br> <%=orderBean.getO_amount()%></td>
				<td>할인 금액<br> <%=orderBean.getO_point() + orderBean.getO_gdiscount()%></td>
				<td>최종 결제 금액<br> <%=orderBean.getO_amount() + orderBean.getO_point() + orderBean.getO_gdiscount()%></td>
			</tr>

			<tr>
				<td>총 상품 금액 <%=orderBean.getO_amount()%>원<br> 상품 금액 <%=orderBean.getO_amount() - addPrice%>원<br>
					추가 상품 <%=addPrice%>원<br> 배송비 0원
				</td>
				<td>포인트 할인 <%=orderBean.getO_point()%><br> 등급 할인 <%=orderBean.getO_gdiscount()%></td>
				<td>결제 방법 <%=paymentMethod%><br> 결제 일자 <%=simpleDateFormat.format(orderBean.getO_rdate2())%></td>
			</tr>
		</table>
		* 현금영수증 발행은 1:1 문의를 이용 부탁드립니다.
	</div>
	<!-- 푸터 들어가는곳 -->

	<!-- 푸터 들어가는곳 -->
</body>
</html>