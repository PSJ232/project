<%@page import="vo.MemberBean"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mypage.css" rel="stylesheet">
<link href="css/mypage_reviwe.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<!-- ajax에 쓰이는 css : 수정 마음껏 하셔도 괜찮습니다. -->
<style type="text/css">
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	background: none;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current {
	color: #222;
}

.tab-content {
	display: none;
	padding: 15px;
}

.tab-content.current {
	display: inherit;
}
</style>

<%
MemberBean memberMypageDetail = (MemberBean) request.getAttribute("memberMypageDetail");
String m_id = (String) session.getAttribute("m_id");

ArrayList<OrderBean> nonOrderArrayList = (ArrayList<OrderBean>) request.getAttribute("nonOrderArrayList");
ArrayList<OrderBean> orderArrayList = (ArrayList<OrderBean>) request.getAttribute("orderArrayList");
ArrayList<ItemBean> nonItemArrayList = (ArrayList<ItemBean>) request.getAttribute("nonItemArrayList");
ArrayList<ItemBean> itemArrayList = (ArrayList<ItemBean>) request.getAttribute("itemArrayList");
ArrayList<OrderDetailBean> nonOrderDetailArrayList = (ArrayList<OrderDetailBean>) request
		.getAttribute("nonOrderDetailArrayList");
ArrayList<OrderDetailBean> orderDetailArrayList = (ArrayList<OrderDetailBean>) request
		.getAttribute("orderDetailArrayList");
ArrayList<Integer> deleteOdList = (ArrayList<Integer>) request.getAttribute("deleteOdList");

String realGrade = "";
switch (memberMypageDetail.getG_id()) {
case 3:
	realGrade = "BLACK";
	break;
case 2:
	realGrade = "RED";
	break;
case 1:
	realGrade = "GREEN";
	break;
case 0:
	realGrade = "WHITE";
	break;
}

request.setAttribute("memberMypageDetail", memberMypageDetail);
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
		<section>

			<h2>상품 리뷰</h2>

			<!--   -------------------------------------------------- -->
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">작성 가능한 후기</li>
				<li class="tab-link" data-tab="tab-2">내 리뷰</li>
			</ul>
			<!--   -------------------------------------------------- -->

			<div>
				<div id="tab-1" class="tab-content current">
					<table border="1">
						<colgroup>
							<col width="22%">
							<col width="58%">
							<col width="20%">
						</colgroup>
						<thead class="mysubscribe_head">
							<th><span>첫 구독일</span></th>
							<th><span>상품 정보</span></th>
							<th><span>상태</span></th>
						</thead>
						<%
						if (nonOrderDetailArrayList.isEmpty()) {
						%>
						<tbody class="mysubscribe_order_none">
							<tr>
								<td colspan="3">작성 가능한 후기가 존재하지 않습니다.<br> <input
									type="button" onclick="location.href='Flowers.shop'"
									value="꽃다발 보러가기">
								</td>
							</tr>
						</tbody>
						<%
						} else {

						for (int i = 0; i < nonOrderArrayList.size(); i++) {
							int sumAmount = (nonOrderArrayList.get(i).getO_amount() + nonOrderArrayList.get(i).getO_point()
							+ nonOrderArrayList.get(i).getO_gdiscount() / 100) * 100;
						%>
						<tr>
							<td><%=nonOrderArrayList.get(i).getO_rdate()%></td>
							<td>
								<dl id="mypage_reviewBefore_td">
									<dt id="mypage_reviewBefore_img">
										<img id="mypage_orderHistory_img"
											src="./admin_layout/upload/<%=nonItemArrayList.get(i).getI_img()%>" />
									</dt>
									<dt id="mypage_reviewBefore_dt"><%=nonItemArrayList.get(i).getI_name()%></dt>
									<dt id="mypage_reviewBefore_dd">
										수령일 :
										<%=nonOrderDetailArrayList.get(i).getOd_delivery_date()%></dt>
									<dt id="mypage_reviewBefore_dd">
										받는 분 :
										<%=nonOrderArrayList.get(i).getO_receiver()%></dt>
									<dt id="mypage_reviewBefore_dt">
										가격 :<%=(int) (nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100%>
										/
										<%=nonOrderDetailArrayList.get(i).getOd_qty()%>개
									</dt>
								</dl>
							</td>
							<td><a
								href="ReviewInsert.rv?od_id=<%=nonOrderDetailArrayList.get(i).getOd_id()%>">리뷰
									작성</a></td>
						</tr>
						<%
						}
						}
						%>
					</table>
				</div>

				<div id="tab-2" class="tab-content">
					<%
					if (orderDetailArrayList.isEmpty()) {
					%>작성한 후기가 존재하지 않습니다.<br> <input type="button"
						onclick="location.href='Flowers.shop'" value="꽃다발 보러가기">
					<%
					} else {
					%>

					<table border="1">
						<tr>
							<td>주문/신청일자</td>
							<td>상세 정보</td>
							<td>상태</td>
						</tr>
						<%
						for (int i = 0; i < orderArrayList.size(); i++) {
							int sumAmount = (orderArrayList.get(i).getO_amount() + orderArrayList.get(i).getO_point()
							+ orderArrayList.get(i).getO_gdiscount() / 100) * 100;
						%>
						<tr>
							<td><%=orderArrayList.get(i).getO_rdate()%></td>
							<td>
								<dl id="mypage_reviewBefore_td">
									<dt id="mypage_reviewBefore_img">
										<img id="mypage_orderHistory_img"
											src="./admin_layout/upload/<%=nonItemArrayList.get(i).getI_img()%>" />
									</dt>
									<dt id="mypage_reviewBefore_dt"><%=nonItemArrayList.get(i).getI_name()%></dt>
									<dt id="mypage_reviewBefore_dd">
										수령일 :
										<%=nonOrderDetailArrayList.get(i).getOd_delivery_date()%></dt>
									<dt id="mypage_reviewBefore_dd">
										받는 분 :
										<%=nonOrderArrayList.get(i).getO_receiver()%></dt>
									<dt id="mypage_reviewBefore_dt">
										가격 :<%=(int) (nonItemArrayList.get(i).getI_price() * nonItemArrayList.get(i).getI_discount() / 100) * 100%>
										/
										<%=nonOrderDetailArrayList.get(i).getOd_qty()%>개
									</dt>
								</dl>
							</td>
							<!-- 				삭제된 리뷰와, 수정 및 삭제가 가능한 리뷰를 구분	   			 -->
							<%
							if (deleteOdList.contains(orderDetailArrayList.get(i).getOd_id())) {
							%>
							<td><a
								href="ReviewUpdate.rv?od_id=<%=orderDetailArrayList.get(i).getOd_id()%>">리뷰
									수정(od_id : <%=orderDetailArrayList.get(i).getOd_id()%>)
							</a> | <a
								href="ReviewDelete.rv?od_id=<%=orderDetailArrayList.get(i).getOd_id()%>">리뷰
									삭제</a></td>
							<%
							} else {
							%>
							<td>삭제된 리뷰 (od_id : <%=orderDetailArrayList.get(i).getOd_id()%>)
							</td>
							<%
							}
							%>

						</tr>
						<%
						}
						%>
					</table>
					<%
					}
					%>
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




