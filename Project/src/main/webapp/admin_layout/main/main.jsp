<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script type="text/javascript" src="../script/Chart.js"></script>
<link rel="stylesheet" href="admin_layout/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
	<header>
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
	</header>
	<div>
	<nav>
<<<<<<< HEAD
		<jsp:include page="../partial/navi.jsp"></jsp:include>
=======
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
>>>>>>> branch 'master' of https://github.com/PSJ232/project.git
	</nav>
	<h1>DashBoard</h1>
	<h1 id="total_income">총 매출액 2000000원</h1> <h1 id="cash">현금 1000000원</h1> <h1 id="card">카드 1000000원</h1>
	
	<canvas id="myLineChart" style=" background-color:#ddd; width: 800px; height:400px;"></canvas>
	</div>
	
	<div id="sold_out">
		<h2>품절 목록</h2>
		
	</div>
	
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
	<script type="text/javascript">
		
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