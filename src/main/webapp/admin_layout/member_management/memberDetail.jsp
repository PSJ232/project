<%@page import="java.text.NumberFormat"%>
<%@page import="vo.DetailBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	ArrayList<DetailBean> orderList = (ArrayList<DetailBean>)request.getAttribute("orderList");
	ArrayList<DetailBean> reviewList = (ArrayList<DetailBean>)request.getAttribute("reviewList");
	ArrayList<DetailBean> reservList = (ArrayList<DetailBean>)request.getAttribute("reservList");
	String point = NumberFormat.getInstance().format(memberBean.getM_point());
	String grade = "";
	switch(memberBean.getG_id()){
	case 0: grade = "WHITE"; break;
	case 1: grade = "GREEN"; break;
	case 2: grade = "RED"; break;
	case 3: grade = "BLACK"; break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 멤버상세</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/list_style.css">
<link rel="stylesheet" href="./css/admin_member_detail.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function getContent(r_id, value){
		if(!document.getElementById('content_'+r_id)){
			
			var value_idx = $(value).index();
			request.open("Post", "http://localhost:8080/project/getReviewContent.ad?r_id=" + encodeURIComponent(r_id) , true);
			request.onreadystatechange = function(){
				var table = document.getElementById("reviewList");
				if(request.readyState == 4 && request.status == 200){
					var object = eval('('+request.responseText+')'); 
					var result = object.result;
					var row = table.insertRow(value_idx + 1);
					row.innerHTML = "<td id=content_" + r_id + " colspan='5'>" + result[0].value + "</td>";
				}
			};
			request.send(null);
			
		}else{
			document.getElementById('content_'+r_id).parentNode.remove();
		}
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("회원 상세");
	});
	function openOrderDetail(o_id){
		window.open('OrderDetail.ad?o_id='+o_id,'PopupWin','width=1700,height=900')
	}
</script>
</head>
<body>
<!-- 	<header> -->
		<jsp:include page="/inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
		<jsp:include page="/inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
<div class="container">
	<fieldset id="info_field">
		<legend>회원정보</legend>
		<label>아이디</label> <input type="text" value="<%=memberBean.getM_id()%>"><br>
		<label>이름</label> <input type="text" value="<%=memberBean.getM_name()%>"><br>
		<label>전화번호</label> <input type="text" value="<%=memberBean.getM_phone()%>"><br>
		<label>생일</label> <input type="text" value="<%=memberBean.getM_birth()%>"><br>
		<label>성별</label> 
		<%if(memberBean.getM_gender() == 0){
			%><input type="text" value="남"><br><%
		}else {
			%><input type="text" value="여"><br><%
		}
		%>
		<label>등급</label> <input type="text" value="<%=grade%>"><br>
		<label>마케팅동의여부</label> 
		<%
			if(memberBean.getM_agree() == null){
				%><input type="text" value="비동의"><br><%
			}else {
				%><input type="text" value="동의"><br><%
			}
		%>
		
		<label>가입날짜</label> <input type="text" value="<%=memberBean.getM_rdate()%>"><br>
		<label>보유포인트</label> <input type="text" value="<%=point%>"><br>
		<%
		if(memberBean.getM_drop() != null){
			%>탈퇴날짜: <%=memberBean.getM_drop()%><%
		}
		%><br>
	</fieldset>
	
	<fieldset id="order_field">
		<legend>회원주문목록</legend>
		<table id="orderList" border="1">
			<tr>
				<th>주문번호</th>
				<th>주문상품</th>
				<th>주문금액</th>
				<th>주문일시</th>
				<th>배송상태</th>
			</tr>
			<%
			for(DetailBean order: orderList){
				String amount = NumberFormat.getInstance().format(order.getO_amount());
			%>
					<tr>
					<td><a target="_blank" onclick="openOrderDetail(<%=order.getO_id()%>)"><%=order.getO_id() %></a></td>
					<td><%=order.getI_name() %></td>
					<td><%=amount %></td>
					<td><%=order.getO_rdate() %></td>
					<td><%=order.getOd_invoice() %></td>
					</tr>
					<%
				}
			%>
		</table>
	</fieldset>
	<fieldset id="review_field">
		<legend>회원리뷰목록</legend>
		<table id="reviewList" border="1">
			<tr>
				<th width="50px">순번</th>
				<th >품목</th>
				<th width="250px">제목</th>
				<th width="150px">작성일시</th>
				<th width="100px">평점</th>
			</tr>
			<%
				for(int i = 0; i < reviewList.size(); i++){
					%>
					<tr id="showContent" onclick="getContent(<%=reviewList.get(i).getR_id()%>,this)">
						<td><%=i+1 %></td>
						<td><%=reviewList.get(i).getI_name() %></td>
						<td><%=reviewList.get(i).getR_title() %></td>
						<td><%=reviewList.get(i).getR_rdate() %></td>
						<td>
						<%
						for(int j=0; j < reviewList.get(i).getR_rate(); j++){
							%>★<%
						}
						%>
						</td>
					</tr>
					<%
				}
			%>
		</table>
	</fieldset>
	<fieldset id="review_field">
		<legend>클래스 수강 목록</legend>
		<table id="reviewList" border="1">
			<tr>
				<th width="50px">순번</th>
				<th>수강날짜</th>
				<th width="100px">수강장소</th>
				<th width="100px">수강시간</th>
				<th width="250px">클래스명</th>
				<th width="50px">인원</th>
				<th width="70px">결제금액</th>
				<th width="70px">결제방법</th>
			</tr>
			<%
				for(int i = 0; i < reservList.size(); i++){
					String amount = NumberFormat.getInstance().format(reservList.get(i).getR_amount());
					%>
						<tr>
						<td><%=i+1 %></td>
						<td><%=reservList.get(i).getR_date() %></td>
						<td><%=reservList.get(i).getFd_place() %></td>
						<td><%=reservList.get(i).getFd_time() %></td>
						<td><%=reservList.get(i).getF_subject() %></td>
						<td><%=reservList.get(i).getR_num() %></td>
						<td><%= amount%></td>
						<td><%=reservList.get(i).getR_payment() %></td>
						</tr>
					<%
				}
			%>
		</table>
	</fieldset>
	<input type="button" value="목록" id="listBtn" onclick="location.href='MemberList.ad'">
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>