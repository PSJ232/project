<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 회원관리</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	table {
		margin: 0 auto;
		margin-top: 150px;
		width: 700px;
	}
	
</style>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction(){
		var search_val = document.getElementById("search_val").value;
		var filter = document.getElementById("filter").value;
		request.open("Post", "http://localhost:8080/OrderSearch.ad?search_val=" + encodeURIComponent(search_val) + "&filter=" + encodeURIComponent(filter), true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200){
			console.log('('+request.responseText+')');
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
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
<!-- 	</header> -->
<!-- 	<nav> -->
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
<!-- 	</nav> -->
	<div class="container">
		<select name="filter" id="filter">
			<option value="m_id">filter</option>
			<option value="1">id</option>
			<option value="2">date</option>
			<option value="3">status</option>
		</select>
		<input type="text" name="search" id="search_val" onkeyup="searchFunction()">
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
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>