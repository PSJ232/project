<%@page import="vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String,Integer> orderCount = (HashMap<String,Integer>)request.getAttribute("orderCount");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int currentPage = pageInfo.getPage();
	int listCount = pageInfo.getListCount();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
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
<link rel="stylesheet" href="./css/list_style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	.search {
		display: flex;
		margin-top: 50px;
		justify-content: flex-start;
	}
	#order_status {
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 770px;
		height: 70px;
		padding-left: 50px;
		padding-right: 50px;
	}
	
	#order_status h2 {
		
		height: 50px;
		font-size: 25px;
		padding-top: 12px;
		align-items: center;
	}
	fieldset {
		width: 800px;
		padding: 10px;
		border-radius: 10px;
		border: 2px solid #FFDF24;
	}
	
	
</style>
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function searchFunction(){
		var search_val = document.getElementById("search_val").value;
		var filter = document.getElementById("filter").value;
		var page = <%=currentPage%>;
		request.open("Post", "http://localhost:8080/project/OrderSearch.ad?search_val=" + encodeURIComponent(search_val) + "&filter=" + encodeURIComponent(filter)+ "&page=" + encodeURIComponent(page), true);
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
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("주문 목록");
	});
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
			<option value="">filter</option>
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
		<section id="pageList">
		<% if(maxPage != 1){
			if(currentPage <= 1) {%>
					<input class="page_btn" type="button" value="<<">&nbsp;
			<%} else {%>
					<input class="page_btn" type="button" value="<<" onclick="location.href='OrderList.ad?page=<%=currentPage - 1 %>'">&nbsp;
			<%} %>
			
			<%for(int i = startPage; i <= endPage; i++) { 
					if(i == currentPage) { %>
						<span id="selected_page_num"><%="  "+ i + "  " %></span>
				<%} else {%>
				<a id="page_num" href="OrderList.ad?page=<%=i %>"><%="  "+ i + "  " %></a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(currentPage >= maxPage) {%>
				<input class="page_btn" type="button" value=">>">
			<%} else { %>
				<input class="page_btn" type="button" value=">>" onclick="location.href='OrderList.ad?page=<%=currentPage + 1 %>'">
			<% } 
		}%>
		</section>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>