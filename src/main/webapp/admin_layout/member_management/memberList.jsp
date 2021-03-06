<%@page import="vo.PageInfo"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	HashMap<String, Integer> memberData = (HashMap<String, Integer>)request.getAttribute("memberData");
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
<link rel="stylesheet" href="./css/admin_member_list.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
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
			console.log(request.responseText);
			var result = object.result;
			for(var i = 0; i < result.length; i++){
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++){
					var cell = row.insertCell(j);
					if(result[i][j].value == "탈퇴"){
						row.style.backgroundColor = "#ddd";
					}
					if(result[i][j].value == "White"){
						cell.style.color = "#A566FF";
					}
					if(result[i][j].value == "Red"){
						cell.style.color = "#FF0000";
					}
					if(result[i][j].value == "Green"){
						cell.style.color = "#47C83E";
					}
					if(result[i][j].value == "Black"){
						cell.style.fontWeight = "bold";
					}
					
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
		<div>
			<fieldset class="admin_memlist_chartbox">
				<legend>회원통계</legend>
				<div class="chart-div">
			        <canvas id="pieChartCanvas" class="admin_memlist_chart" width="270px" height="270px"></canvas>
			        <canvas id="pie" class="admin_memlist_chart" width="270px" height="270px"></canvas>
		   		</div>
	   		</fieldset>
	   		<div class="memList_content">
	   			<div class="admin_memlist_title">회원 목록 및 상세</div>
				<div class="search_container">
					<select name="filter" id="filter" class="admin_memlist_select">
						<option value="0">필터</option>
						<option value="1">이름</option>
						<option value="2">아이디</option>
						<option value="3">휴대폰</option>
						<option value="4">등급(number)</option>
					</select>
					<input type="text" name="search" id="search_val" onkeyup="searchFunction()">
				</div>
				<table class="table" border="1">
					<thead>
						<tr class="admin_memList_height">
							<th>아이디</th>
							<th>이름</th>
							<th>휴대폰번호</th>
							<th>성별</th>
							<th>등급</th>
							<th>가입일자</th>
							<th>탈퇴여부</th>
						</tr>
					</thead>
					<tbody id="ajaxTable" class="admin_memlist_content">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>