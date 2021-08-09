<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, Integer> memberData = (HashMap<String, Integer>)request.getAttribute("memberData");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<script>
	window.onload = function () {
	    pieChartDraw();
	}
	
	var pieChartData = {
	    labels: ['남', '여'],
	    datasets: [{
	        data: [<%=memberData.get("남")%>, <%=memberData.get("여")%>],
	        backgroundColor: ['blue', 'red']
	    }] 
	};
	
	var pieChartDraw = function () {
	    var ctx = document.getElementById('pieChartCanvas').getContext('2d');
	    
	    window.pieChart = new Chart(ctx, {
	        type: 'doughnut',
	        data: pieChartData,
	        options: {
	            responsive: false
	        }
	    });
	};
</script>
</head>
<body>
	<div class="chart-div">
        <canvas id="pieChartCanvas" width="300px" height="300px"></canvas>
    </div>

    <script src="script.js"></script>
</body>
</html>