<%@page import="vo.DetailBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberBean memberBean = (MemberBean)request.getAttribute("memberBean");
	ArrayList<DetailBean> orderList = (ArrayList<DetailBean>)request.getAttribute("orderList");
	ArrayList<DetailBean> reviewList = (ArrayList<DetailBean>)request.getAttribute("reviewList");
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
<style>
	.container table {
		border-collapse: collapse;
		border: 1px solid #ececec;
		width: 900px;
		text-align: center;
	}
	.container table th {
		background-color: #f7f7f7;
	}
	.container table td,th {
		padding: 5px;
	}
	.container table tr:hover {
		background-color: #FFDF24;
	}
	.container label {
		float:left;
		width: 150px;
		font-size: 15px;
		font-weight: bold;
		margin-left: 15px;
	}
	.container input[type=text]{
		border:none;
		outline: none;
		margin-bottom: 10px;
		font-size: 14px;
	}
	.container fieldset {
		padding: 20px;
		border-radius: 5px;
		width: 950px;
		border: 2px solid #FFCD12;
		margin-bottom: 25px;
	}
	.container legend {
		padding: 15px;
		font-size: 20px;
	}
	.container [id^='content_'] {
		background-color: #FAF4C0;
	}
	#reviewList tr {
		cursor: pointer;
	}
	#listBtn {
		width: 100px;
		height: 40px;
		border: 1px solid #fff;
		border-radius: 5px;
		background-color: #FFDF24;
		margin-left: 850px;
	}
	#listBtn:hover {
		background-color: #FFCD12;
		cursor: pointer;
	}
	
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/list_style.css">
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
		<%if(memberBean.getM_gender() == 1){
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
		<label>보유포인트</label> <input type="text" value="<%=memberBean.getM_point()%>"><br>
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
			%>
					<tr>
					<td><a target="_blank" onclick="openOrderDetail(<%=order.getO_id()%>)"><%=order.getO_id() %></a></td>
					<td><%=order.getI_name() %></td>
					<td><%=order.getO_amount() %></td>
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
	<input type="button" value="목록" id="listBtn" onclick="location.href='MemberList.ad'">
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>