<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, Integer> salesInfo = (HashMap<String, Integer>)request.getAttribute("salesInfo");
	HashMap<String, Integer> weekCardSales = (HashMap<String, Integer>)request.getAttribute("weekCardSales");
	List<String> weekCardSalesKeys = (List<String>)request.getAttribute("weekCardSalesKeys");
	HashMap<String, Integer> weekCashSales = (HashMap<String, Integer>)request.getAttribute("weekCashSales");
	List<String> weekCashSalesKeys = (List<String>)request.getAttribute("weekCashSalesKeys");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<!-- <script type="text/javascript" src="../script/Chart.js"></script> -->
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/list_style.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
#income_anal {
	display: flex;
	width: 900px;
}
#income_anal h1 {
	margin-right: 20px;
	margin-bottom: 40px;
	border: 2px solid #ddd;
	border-radius: 10px;
	padding: 30px;
	width: 280px;
	font-size: 32px;
	text-align: center;
}
.span {
	display: block;
	text-align: left;
	font-size: 15px;
	margin-bottom: 20px;
}
#chart {
	width: 800px;
	padding: 40px;
	border-radius: 10px;
	border: 2px solid #ddd;
}
#items {
	float:right;
}
.item {
	width: 300px;
	height: 300px;
	background-color: #ccc;
	margin-bottom: 10px;
}

</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
	<!-- header -->
	
	<!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	<div class="container">
<!-- 	<h1>DashBoard</h1> -->
		<div id="items">
			<div class="item"></div>
			<div class="item"></div>
			<div class="item"></div>
		</div>
		<div id="income_anal">
			<h1 id="total">  </h1> <h1 id="cash">Cash <%=salesInfo.get("현금매출") %> won</h1> <h1 id="card">Card <%=salesInfo.get("카드매출") %> won</h1>
		</div>
		<fieldset id="chart">
			<legend>Weekly Income</legend>
			<canvas id="myLineChart" style=" width: 800px; height:400px;"></canvas>
		</fieldset>
		
	</div>
	
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
	
</body>
<script type="text/javascript">
		var card_dates = [];
		var card_numbers = [];
		var cash_dates = [];
		var cash_numbers = [];
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		document.getElementById("total").innerHTML = "<span class='span'>Total</span> ￦" + numberWithCommas(<%=salesInfo.get("총매출") %>);
		document.getElementById("cash").innerHTML = "<span class='span'>Cash</span> ￦" + numberWithCommas(<%=salesInfo.get("현금매출") %>);
		document.getElementById("card").innerHTML = "<span class='span'>Card</span> ￦" + numberWithCommas(<%=salesInfo.get("카드매출") %>);
		<%
			for(String str: weekCardSalesKeys){
				%>card_dates.push("<%=str%>");
				card_numbers.push("<%=weekCardSales.get(str)%>");
				<%
			}
		%>
		<%
			for(String str: weekCashSalesKeys){
				%>cash_dates.push("<%=str%>");
				cash_numbers.push("<%=weekCashSales.get(str)%>");
				<%
			}
		%>
		var data_card = {
				label: "카드",
				data: card_numbers,
				backgroundColor: "rgba(39,79,76,.5)",
				borderColor: "rgba(39,79,76)",
				borderWidth: 1,
				tension: 0.1
		}
		var data_cash = {
				label: "현금",
				data: cash_numbers,
				backgroundColor: "rgba(40,161,130,.5)",
				borderColor: "rgba(40,161,130)",
				borderWidth: 1,
				tension: 0.1
		}
		var delayed;
		var context_line = document.getElementById('myLineChart').getContext('2d');
		var myLineChart = new Chart(context_line, {
			type: 'bar',
			data: {
				labels: card_dates,
				datasets: [data_card, data_cash]
			},
			options: {
				scales:{
					x:{stacked:true},
					y:{stacked:true, }
				},
				animation: {
				      onComplete: () => {
				        delayed = true;
				      },
				      delay: (context) => {
				        let delay = 0;
				        if (context.type === 'data' && context.mode === 'default' && !delayed) {
				          delay = context.dataIndex * 300 + context.datasetIndex * 100;
				        }
				        return delay;
				      },
				    },
				responsive: false
			}
		});
	</script>
</html>