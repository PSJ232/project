<%@page import="java.text.NumberFormat"%>
<%@page import="vo.OrderDetailBean"%>
<%@page import="vo.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	OrderBean orderBean = (OrderBean)request.getAttribute("orderBean");
	ArrayList<OrderDetailBean> orderDetailList = (ArrayList<OrderDetailBean>)request.getAttribute("orderDetailList");
	String address = orderBean.getO_address();
	address = address.replace("&", " ");
	String payment = "";
	if(orderBean.getO_payment() == 1){
		payment = "카드";
	}else {
		payment = "현금";
	}
	int p_amount = 0;
	for(int i = 0; i < orderDetailList.size(); i++){
		p_amount += orderDetailList.get(i).getI_price();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 주문상세</title>
<style>
	fieldset {
		padding: 20px;
		border: 2px solid #FFCD12;
		border-radius: 5px;
		margin-right: 20px;
	}
	label{
		width: 120px; 
		float: left;
	}
	
	#payment_info {
		display: inline-block;
		width: 290px;
		font-size: 15px;
	}
	#delivery_info {
		display: inline-block;
		width: 650px;
		font-size: 15px;
	}
	.sub_container {
		display: flex;
		margin-left: 10px;
	}
	input[type=text]{
		border: none;
		outline: none;
		overflow: visible;
		font-size: 13px;
		margin-bottom: 13px;
	}
	
	#product_list table {
		border-collapse: collapse;
		text-align: center;
		width: 1000px;
		border: 1px solid #ececec;
	}
	
	#product_list table td,th {
		height: 30px;
		padding: 5px;
	}
	#product_list table th {
		background-color: #f7f7f7;
	}
	#insertBtn {
		border: none;
		background-color: #FAED7D;
		padding: 5px;
		border: 1px solid #fff;
		border-radius: 5px;
	}
	#insertBtn:hover {
		background-color: #FFCD12;
		cursor: pointer;
		
	}
	#address {
		width: 500px;
	}
	.btn {
		margin-left: 960px;
		margin-top: 10px;
		cursor: pointer;
	}
</style>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/list_style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	function insertTrackingNum(od_id){
		window.open("InsertTrackingNum.ad?od_id="+od_id, "운송장 등록", "width=400, height=250, left=1100, top=150");
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("주문 상세");
	});
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
		
		<div id="product_list">
			<fieldset>
				<legend>주문상품 리스트</legend>
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
							<td><%=orderDetailList.get(i).getOd_invoice() %> 
							<%
								if(orderDetailList.get(i).getOd_invoice().equals("운송장을 입력해주세요")){
									%><input type="button" value="운송장등록" id="insertBtn" onclick="insertTrackingNum(<%=orderDetailList.get(i).getOd_id()%>)"><%
								}else {
									%><input type="button" value="운송장수정" id="insertBtn" onclick="insertTrackingNum(<%=orderDetailList.get(i).getOd_id()%>)"><%
								}
							%>
							
							</td>
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
			</fieldset>
		</div>
		<div class="sub_container">
			<fieldset>
				<legend>배송정보</legend>
				<div id="delivery_info">
					<label>주문자</label><input type="text" value="<%=orderBean.getM_id()%>" readonly><br>
					<label>보내는자</label><input type="text" value="<%=orderBean.getO_sender()%>" readonly><br>
					<label>받는자</label><input type="text" value="<%=orderBean.getO_receiver()%>" readonly><br>
					<label>받는자 전화번호</label><input type="text" value="<%=orderBean.getO_phone()%>" readonly><br>
					<label>주소</label><input type="text" id="address" value="<%=address%>" readonly><br>
				</div>
			</fieldset>
			<fieldset>
				<legend>결제정보</legend>
				<div id="payment_info">
					<label>총 상품금액</label><input type="text" value=<%=NumberFormat.getInstance().format(p_amount) %> readonly><br>
					<label>할인금액</label><input type="text" value="<%=NumberFormat.getInstance().format(orderBean.getO_gdiscount()) %> " readonly><br>
					<label>적립금사용</label><input type="text" value="<%=NumberFormat.getInstance().format(orderBean.getO_point()) %>" readonly><br>
					<label>결제수단</label><input type="text" value="<%=payment %>" readonly><br>
					<label>최종결제금액</label><input type="text" value="<%=NumberFormat.getInstance().format(orderBean.getO_amount()) %>" readonly>
				</div>
			</fieldset>
		</div>
		<input type="button" class="btn" value="목록" onclick="location.href='OrderList.ad'">
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>