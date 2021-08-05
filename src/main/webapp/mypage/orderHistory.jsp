<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_orderHistory.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	})
</script>
</head>
<!-- ajax에 쓰이는 css : 수정 마음껏 하셔도 괜찮습니다. -->



<%
// 멤버 정보
String m_id = (String) session.getAttribute("m_id");
MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");

ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>) request.getAttribute("nonOrderArrayList");
ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>) request.getAttribute("orderArrayList");
ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>) request.getAttribute("nonItemArrayList");
ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>) request.getAttribute("itemArrayList");
ArrayList<OrderDetailBean> nonOrderDetailArrayList = (ArrayList<OrderDetailBean>) request
		.getAttribute("nonOrderDetailArrayList");
ArrayList<OrderDetailBean> orderDetailArrayList = (ArrayList<OrderDetailBean>) request
		.getAttribute("orderDetailArrayList");

// 출력되는 행의 컬럼번호 받아오기(해당 행에만 <td rowspan="">부여)
// 주문내역의 o_id에 따른 번호 리스트
String o_id = "";
ArrayList<Integer> nonCol = new ArrayList<Integer>();
for (int i = 0; i < nonOrderArrayList.size(); i++) {
	if (!o_id.equals((nonOrderArrayList.get(i).getO_id() + ""))) {
		nonCol.add(i);
	} else {
	}
	if (i == nonOrderArrayList.size() - 1) {
		nonCol.add(i + 1);
	}
	o_id = nonOrderArrayList.get(i).getO_id() + "";
}
// 취소내역의 o_id에 따른 컬럼 번호 리스트
o_id = "";
ArrayList<Integer> col = new ArrayList<Integer>();
for (int i = 0; i < orderArrayList.size(); i++) {
	if (!o_id.equals((orderArrayList.get(i).getO_id() + ""))) {
		col.add(i);
	} else {
	}
	if (i == orderArrayList.size() - 1) {
		col.add(i + 1);
	}
	o_id = orderArrayList.get(i).getO_id() + "";
}
%>
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

		<section class="mypage_orderHistory_all">
			<h2 id="mypage_orderHistory_title">주문내역/배송조회</h2>

			<!--   -------------------------------------------------- -->
			<ul class="tabs">
				<li class="tab_link_current" data-tab="tab-1">주문/배송내역</li>
				<li class="tab-link" data-tab="tab-2">취소/환불내역</li>
			</ul>
			<!--   -------------------------------------------------- -->

			<div class="mypage_orderHistory_main">
				<div id="tab-1" class="tab-content current">
					<table id="mypage_orderHistory_table" >
						<tr>
							<td id="mypage_orderHistory_table_td_s" >주문 일자</td>
							<td id="mypage_orderHistory_table_td_b">상품 정보</td>
							<td id="mypage_orderHistory_table_td_s">상태</td>
						</tr>

						<%
						if (nonOrderDetailArrayList.isEmpty()) {
						%><tr>
							<td id="mypage_orderHistory_table_th" colspan="3">주문 / 배송내역이 존재하지 않습니다.</td>
						</tr>
						<%
						} else { int count = 0;
						for (int i = 0; i < nonOrderArrayList.size(); i++) {
						%>

						<tr>
							<%if (nonCol.contains(i)) {%>
							<td id="mypage_orderHistory_situation" rowspan="<%=nonCol.get(count + 1) - nonCol.get(count)%>"><%=nonOrderArrayList.get(i).getO_rdate()%></td>
							<%} else {}%>
							<td>
							<dl id="mypage_orderHistory_td">
								<dt id="mypage_orderHistory_img"><img id="mypage_orderHistory_img" src="./admin_layout/upload/<%=nonItemArrayList.get(i).getI_img() %>"/></dt>
								<dt id="mypage_orderHistory_span_one">  상품 명 : <a href="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id()%>"><%=nonItemArrayList.get(i).getI_name()%></a></dt>
								<dd id="mypage_orderHistory_span_two">수령일 : <%=nonOrderDetailArrayList.get(i).getOd_delivery_date()%></dd>
								<dt id="mypage_orderHistory_span_two"> 받는 분 : <%=nonOrderArrayList.get(i).getO_receiver()%></dt>
								<dd id="mypage_orderHistory_span_one">가격 :<%=(int) (nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100%>
										/ <%=nonOrderDetailArrayList.get(i).getOd_qty()%>개</dd>
							</dl>
							</td>
							<%if (nonCol.contains(i)) {if (nonOrderDetailArrayList.get(i).getOd_confirm() == 1) {%>
							<td id="mypage_orderHistory_situation" rowspan="<%=nonCol.get(count + 1) - nonCol.get(count)%>">배송 완료</td>
							<%} else if (!nonOrderDetailArrayList.get(i).getOd_invoice().equals("주문접수")) {%>
							<td id="mypage_orderHistory_situation" rowspan="<%=nonCol.get(count + 1) - nonCol.get(count)%>">배송중</td>
							<%} else if (nonOrderDetailArrayList.get(i).getOd_invoice().equals("주문접수")) {%>
							<td id="mypage_orderHistory_situation" rowspan="<%=nonCol.get(count + 1) - nonCol.get(count)%>">주문접수</td>
							<%}
							count++;
							} else {
							}
							%>
						</tr>
						<%
						}
						}
						%>
					</table>
				</div>

				<div id="tab-2" class="tab-content">
					<table id="mypage_orderHistory_table">
						<tr>
							<td id="mypage_orderHistory_table_td_s">주문 일자</td>
							<td id="mypage_orderHistory_table_td_b">상품 정보</td>
							<td id="mypage_orderHistory_table_td_s">상태</td>
						</tr>

						<%
						if (orderDetailArrayList.isEmpty()) {
						%><tr>
							<td id="mypage_orderHistory_table_th" colspan="3">취소 / 환불내역이 존재하지 않습니다.</td>
						</tr>
						<%} else {int ccount = 0;
						for (int i = 0; i < orderArrayList.size(); i++) {
						%>

						<tr>
							<%if (col.contains(i)) {%>
							<td rowspan="<%=col.get(ccount + 1) - col.get(ccount)%>"><%=orderArrayList.get(i).getO_rdate()%></td>
							<%} else {}%>
							<td>
							<dl id="mypage_orderHistory_td">
								<dt id="mypage_orderHistory_img"><img id="mypage_orderHistory_img" src="./admin_layout/upload/<%=nonItemArrayList.get(i).getI_img() %>"/></dt>
								<dt id="mypage_orderHistory_span_one">  상품 명 : <a href="OrderMypageDetail.od?o_id=<%=nonOrderArrayList.get(i).getO_id()%>"><%=nonItemArrayList.get(i).getI_name()%></a></dt>
								<dd id="mypage_orderHistory_span_two">수령일 : <%=nonOrderDetailArrayList.get(i).getOd_delivery_date()%></dd>
								<dt id="mypage_orderHistory_span_two"> 받는 분 : <%=nonOrderArrayList.get(i).getO_receiver()%></dt>
								<dd id="mypage_orderHistory_span_one">가격 :<%=(int) (nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100%>
										/ <%=nonOrderDetailArrayList.get(i).getOd_qty()%>개</dd>
							</dl>
							</td>
							<%if (col.contains(i)) {%>
							<td rowspan="<%=col.get(ccount + 1) - col.get(ccount)%>">주문 취소</td>
							<%
							ccount++;
							} else {
							}
							%>
						</tr>
						<%
						}
						}
						%>
					</table>
				</div>

			</div>
		</section>

	</div>



	<!-- 푸터 들어가는곳 -->
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<!-- 푸터 들어가는곳 -->
</body>
</html>