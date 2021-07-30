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
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	.container {
		margin-left: 40em;
		margin-top: 90px;
	}
	.table {
		margin-top: 80px;
		margin-bottom: 100px;
		width: 800px;
		text-align: center;
		border-collapse: collapse;
		background-color: #ccc;
	}
	.table th,td {
		height: 3em;
	}
	
	.search {
		display: flex;
		margin-top: 50px;
		justify-content: flex-start;
	}
	#order_status {
		margin-top: 30px;
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 800px;
		height: 70px;
		background-color: #eee;
		padding: 5px;
	}
	
	#order_status h2 {
		
		height: 50px;
		font-size: 3em;
		padding-top: 12px;
		align-items: center;
	}
	
</style>
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
					if(j == 0){
						cell.innerHTML = "<a href='OrderDetail.ad?o_id=" + result[i][j].value + "'>" + result[i][j].value + "</a>";
					}else {
						cell.innerHTML = result[i][j].value;
					}
				}
			}
		}
	}
	window.onload = function(){
		searchFunction();
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
		<h1 id="order_title">주문현황</h1>
		<div id="order_status">
		<h2>주문접수 <%=orderCount.get("주문접수") %></h2>
		<h2>배송중 <%=orderCount.get("배송중") %></h2> 
		<h2>배송완료 <%=orderCount.get("배송완료") %></h2>
		</div>
		<div class="search">
		<select name="filter" id="filter">
			<option value="m_id">filter</option>
			<option value="m_id">id</option>
			<option value="o_id">date</option>
			<option value="od_invoice">status</option>
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