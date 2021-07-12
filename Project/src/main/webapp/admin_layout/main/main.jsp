<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script type="text/javascript" src="../script/Chart.js"></script>
<style>
</style>
</head>
<body>
	<header>
		<jsp:include page="../partial/header.jsp"></jsp:include>
	</header>
	<div>
	<nav>
		<jsp:include page="../partial/nav.jsp"></jsp:include>
	</nav>
	<canvas id="myLineChart" style="display:inline-block; width: 800px; height:400px;"></canvas>
	<canvas id="myChart" style="display:inline-block;"></canvas>
	</div>
	<footer>
		<jsp:include page="../partial/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		var context = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(context, {
			type: 'pie',
			data: {
				labels: ['남', '여'],
				datasets: [{
					backgroundColor: ["blue","red"],
					hoverBackgroundColor: ["skyblue","pink"],
					data: [5,5] 
				}]
			}, 
				options: {
					responsive: false
				}
		});
		
		var context_line = document.getElementById('myLineChart').getContext('2d');
		var myLineChart = new Chart(context_line, {
			type: 'line',
			data: {
				labels: ["1월","2월","3월","4월","5월","6월","7월"],
				datasets: [{
					label: 'My First Dataset',
					data: [65, 59, 80, 81, 56, 55, 40],
					fill: false,
					borderColor: 'rgb(75, 192, 192)',
					tension: 0.1
				}]
			},
			options: {
				responsive: false
			}
		});
	</script>
</body>
</html>