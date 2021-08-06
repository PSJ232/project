<%@page import="vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	HashMap<String, Integer> memberData = (HashMap<String, Integer>)request.getAttribute("memberData");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	
	int currentPage = pageInfo.getPage();
	int listCount = pageInfo.getListCount();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 회원정보</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/list_style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	
	.search_container {
		display: flex;
		margin-top: 50px;
		justify-content: flex-start;
	}
	
	.chart-div {
		
		display: flex;
		margin: 0 auto;
	}
	
	#pieChartCanvas {
		margin-left: 120px;
	}
	
	#pie {
		margin-left: 50px;
	}
	
	.container fieldset {
		width: 800px;
		padding: 15px;
		border-radius: 10px;
		border: 2px solid #ccc;
	}

</style>
<script type="text/javascript">
	var doughnutChartData = {
		    labels: ["10대이하", "20대", "30대", "40대", "50대이상"],
		    datasets: [{
		        data: [<%=memberData.get("10대이하")%>, <%=memberData.get("20대")%>, <%=memberData.get("30대")%>, <%=memberData.get("40대")%>, <%=memberData.get("50대이상")%>],
		        backgroundColor: ['#FAED7D', '#CEF279', '#B2EBF4', '#FFB2D9', '#DB9CFF']
		    }] 
		};
	var doughnutChartDraw = function () {
		var ctx = document.getElementById("pie").getContext('2d');
		window.pieChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: doughnutChartData,
		    options: {
		        pieceLabel: {
		        	render: 'label',
		          },
		        responsive: false
	            }
		    });
	};
	// 성별비율
	var pieChartData = {
		    labels: ['남', '여'],
		    datasets: [{
		        data: [<%=memberData.get("남")%>, <%=memberData.get("여")%>],
		        backgroundColor: ['#489CFF', '#FF6C6C']
		    }] 
		};
		
	var pieChartDraw = function () {
		var ctx = document.getElementById('pieChartCanvas').getContext('2d');
		    
		window.pieChart = new Chart(ctx, {
		    type: 'doughnut',
		    data: pieChartData,
		    options: {
		        responsive: false,
		        pieceLabel: { 
		        render:'label'
		           }
		        }
		    });
		};
	
	var request = new XMLHttpRequest();
	function searchFunction(){
		var search_val = document.getElementById("search_val").value;
		var filter = document.getElementById("filter").value;
		request.open("Post", "http://localhost:8080/project/MemberSearch.ad?search_val=" + encodeURIComponent(search_val) + "&filter=" + encodeURIComponent(filter) , true);
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
						cell.innerHTML = "<a href='MemberDetail.ad?m_id=" + result[i][j].value + "'>" + result[i][j].value + "</a>";
					}else {
						cell.innerHTML = result[i][j].value;
					}
				}
			}
		}
	}
	
	
	window.onload = function(){
		pieChartDraw();
		searchFunction();
		doughnutChartDraw();
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("회원 목록");
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
			<legend>회원통계</legend>
			<div class="chart-div">
		        <canvas id="pieChartCanvas" width="250px" height="250px" ></canvas>
		        <canvas id="pie" width="250px" height="250px"></canvas>
	   		</div>
   		</fieldset>
		<div class="search_container">
			<select name="filter" id="filter">
				<option value="0">filter</option>
				<option value="1">name</option>
				<option value="2">id</option>
				<option value="3">phone</option>
				<option value="4">grade</option>
			</select>
			<input type="text" name="search" id="search_val" onkeyup="searchFunction()">
		</div>
		<table class="table" border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>휴대폰번호</th>
					<th>성별</th>
					<th>등급</th>
					<th>가입일자</th>
					<th>탈퇴여부</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
			</tbody>
		</table>
		<section id="pageList">
		<%
		if(maxPage != 1){
			if(currentPage <= 1) {%>
					<input type="button" value="이전">&nbsp;
			<%} else {%>
					<input type="button" value="이전" onclick="location.href='OrderList.ad?page=<%=currentPage - 1 %>'">&nbsp;
			<%} %>
			
			<%for(int i = startPage; i <= endPage; i++) { 
					if(i == currentPage) { %>
						[<%=i %>]
				<%} else {%>
				<a href="OrderList.ad?page=<%=i %>">[<%=i %>]</a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(currentPage >= maxPage) {%>
				<input type="button" value="다음">
			<%} else { %>
				<input type="button" value="다음" onclick="location.href='OrderList.ad?page=<%=currentPage + 1 %>'">
			<% } 
			} %>
		</section>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>