<%@page import="java.util.ArrayList"%>
<%@page import="vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String,Integer> orderCount = (HashMap<String,Integer>)request.getAttribute("orderCount");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 주문관리</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_order_list.css">
<link rel="stylesheet" href="./css/list_style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction(){
		var search_val = document.getElementById("search_val").value;
		var filter = document.getElementById("filter").value;
		request.open("Post", "http://localhost:8080/project/OrderSearch.ad?search_val=" + encodeURIComponent(search_val) + "&filter=" + encodeURIComponent(filter), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200){
			var object = eval('('+request.responseText+')'); 
			var result = object.result;
			for(var i = 0; i < result.length; i++){
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++){
					var cell = row.insertCell(j);
					if(result[i][j].value == "주문취소"){
						row.style.backgroundColor = "#ddd";
					}
					if(result[i][j].value == "배송중"){
						cell.style.color = "#6B66FF";
					}
					if(result[i][j].value == "배송완료"){
						cell.style.color = "#F15F5F";
					}
					if(result[i][j].value == "주문접수"){
						cell.style.color = "#74D36D";
					}
					if(j == 2){
						cell.innerHTML = "<a href='OrderDetail.ad?o_id=" + result[i][0].value + "'>" + result[i][j].value + "</a>";
					}else {
						cell.innerHTML = result[i][j].value;
					}
				}
			}
		}
	}
	window.onload = function(){
		searchFunction();
		lineChartDraw()
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("주문 목록");
	});
	
</script>
<style>
	
</style>
</head>
<body>
<!-- 	<header> -->
		<jsp:include page="/inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
		<jsp:include page="/inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
	<div class="container">
		<fieldset>
			<legend>주문현황</legend>
			<div id="order_status">
				<h2>주문접수 <%=orderCount.get("주문접수") %> </h2>
				<h2>배송중 <%=orderCount.get("배송중") %> </h2> 
				<h2>배송완료 <%=orderCount.get("배송완료") %> </h2>
			</div>
		</fieldset>
		<div class="search">
		<select name="filter" id="filter">
			<option value="">필터</option>
			<option value="1">아이디</option>
			<option value="2">주문날짜</option>
			<option value="3">주문상태(Number)</option>
		</select> 
		 <input type="text" name="search" id="search_val" onkeyup="searchFunction()">
		</div>
		<div class="table_container">
			<table class="table" border="1">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문자</th>
						<th>주문상품</th>
						<th>주문금액</th>
						<th>주문일시</th>
						<th>배송상태</th>
					</tr>
				</thead>
				
				<tbody id="ajaxTable">
				</tbody>
			</table>
		</div>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>