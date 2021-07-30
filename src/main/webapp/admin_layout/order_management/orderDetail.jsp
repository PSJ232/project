<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	OrderBean orderBean = (OrderBean)request.getAttribute("orderBean");
	ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>)request.getAttribute("orderDetailList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 주문상세</title>
<style>
	.container {
		margin-top: 150px;
		margin-left: 25em;
		margin-bottom: 100px;
	}
	.container #delivery_info label, #payment_info label {
		width: 100px; 
		display: inline-block;
	}
	
	.container #payment_info {
		display: inline-block;
		width: 500px;
		
	}
	.sub_container, #delivery_info{
		margin-left: 100px;
		margin-top: 50px;
	}
	.sub_container {
		display: flex;
	}
	h1 {
		margin-bottom: 50px;
	}
	input[type=text]{
		border: none;
	}
	
	#product_list table {
		border-collapse: collapse;
		text-align: center;
		width: 550px;
	}
	
	#product_list table td,th {
		height: 13px;
	}
	#address {
		width: 400px;
	}
</style>
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	function insertTrackingNum(od_id){
		window.open("InsertTrackingNum.ad?od_id="+od_id, "운송장 등록", "width=400, height=250, left=1100, top=150");
	}
</script>
</head>
<body>
   	<!-- header -->
   	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
   	<!-- header -->
   	
    <!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	
	<div class="container">
		
		<div id="delivery_info">
		<h1>Order Detail</h1>
			<h3>배송지 정보</h3>
			<label>주문자</label><input type="text" value="<%=orderBean.getO_sender()%>" readonly>
			<label>받는자</label><input type="text" value="<%=orderBean.getO_receiver()%>" readonly>
			<label>받는자 전화번호</label><input type="text" value="<%=orderBean.getO_phone()%>" readonly><br>
			<label>주소</label><input type="text" id="address" value="<%=orderBean.getO_address()%>" readonly><br>
		</div>
		<div class="sub_container">
		<div id="payment_info">
			<h3>결제 정보</h3>
			<label>총 상품금액</label><input type="text" value="50000" readonly><br>
			<label>할인금액</label><input type="text" value="5000" readonly><br>
			<label>적립금사용</label><input type="text" value="3000" readonly><br>
			<label>결제수단</label><input type="text" value="카드" readonly><br>
			<label>최종결제금액</label><input type="text" value="42000" readonly>
		</div>
		<div id="product_list">
			<h3>주문상품 리스트</h3>
			<table border="1">
				<tr><th>순번</th><th>상품</th><th>수량</th><th>배송요청일</th><th>편지지</th><th>문구</th><th>운송장번호</th><th>구매확정</th></tr>
				<%
					for(int i = 0; i < orderDetailList.size(); i++){
						%><tr><td><%=i+1 %></td>
						<td><%=orderDetailList.get(i).getI_name() %></td>
						<td><%=orderDetailList.get(i).getOd_qty() %></td>
						<td><%=orderDetailList.get(i).getOd_delivery_date() %></td>
						<td><%=orderDetailList.get(i).getL_id() %></td>
						<td><%=orderDetailList.get(i).getOd_message() %></td>
						<td><%=orderDetailList.get(i).getOd_invoice() %> <input type="button" value="운송장등록" onclick="insertTrackingNum(<%=orderDetailList.get(i).getOd_id()%>)"></td>
						<%
							if(orderDetailList.get(i).getOd_confirm() == 1){
								%><td>O</td><%
							}else {
								%><td>X</td><%
							}
						%>
						</tr><%
					}
				%>
				
			</table>
		</div>
		</div>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>