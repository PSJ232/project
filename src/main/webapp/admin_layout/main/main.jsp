<%@page import="vo.ReviewBean"%>
<%@page import="vo.ItemBean"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<ItemBean> rankingItems = (ArrayList<ItemBean>)request.getAttribute("rankingItems");
	ArrayList<ReviewBean> recentReview = (ArrayList<ReviewBean>)request.getAttribute("recentReview");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_main.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script>
	var request = new XMLHttpRequest();
	function getContent(r_id, value){
		if(!document.getElementById('content_'+r_id)){
			
			var value_idx = $(value).index();
			request.open("Post", "http://localhost:8080/project/getReviewContent.ad?r_id=" + encodeURIComponent(r_id) , true);
			request.onreadystatechange = function(){
				var table = document.getElementById("reviewList");
				if(request.readyState == 4 && request.status == 200){
					var object = eval('('+request.responseText+')'); 
					var result = object.result;
					var row = table.insertRow(value_idx + 2);
					row.innerHTML = "<td id=content_" + r_id + " class='admin_review_content' colspan='5'>" + result[0].value + "</td>";
				}
			};
			request.send(null);
			
		}else{
			document.getElementById('content_'+r_id).parentNode.remove();
		}
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("????????????");
	});
</script>
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
		<fieldset id="items">
			<legend>Best Seller</legend>
			<%
				for(ItemBean item : rankingItems){
					%>
					<div class="item">
					<a href="ItemDetail.ad?i_id=<%=item.getI_id()%>"><img src="./admin_layout/upload/<%=item.getI_img()%>" alt="flowerimage"></a>
					<h3><%=item.getI_name() %></h3>
					</div>
					<%
				}
			%>
			
		</fieldset>
		<div id="income_anal">
			<h1 id="total">  </h1> <h1 id="cash">Cash <%=salesInfo.get("????????????") %> won</h1> <h1 id="card">Card <%=salesInfo.get("????????????") %> won</h1>
		</div>
		<fieldset id="chart">
			<legend>Weekly Income</legend>
			<canvas id="myLineChart" style=" width: 800px; height:400px;"></canvas>
		</fieldset>
		<fieldset id="recent_review">
			<legend>Recent Review</legend>
			<table border="1" id="reviewList">
			<thead  class="dash_padding">
				<tr><th class="dash_table_volume_th" width="50">??????</th><th class="dash_table_volume_th" width="120">????????????</th><th class="dash_table_volume_th" width="150">?????????</th><th class="dash_table_volume_th" width="250">??????</th><th class="dash_table_volume_th" width="100">??????</th></tr>
			</thead>
			<tbody class="dash_padding">
				<%
					for(int i = 0; i < recentReview.size(); i++){
						%><tr class="dash_table_volume" id="showContent" onclick="getContent(<%=recentReview.get(i).getR_id()%>,this)">
							<td><%=recentReview.get(i).getR_id() %></td>
							<td><%=recentReview.get(i).getR_rdate() %></td>
							<td><%=recentReview.get(i).getR_writer() %></td>
							<td><%=recentReview.get(i).getR_title() %></td>
							<td><span class="star">
							<%
							for(int j=0; j < recentReview.get(i).getR_rate(); j++){
								%>???<%
							}
							%>
							</span>
							</td>	
						</tr><%
					}
				%>
			</tbody>
		</table>
		</fieldset>
	</div>
	
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
	
</body>
<script type="text/javascript">
		var dates = [];
		var card_numbers = [];
		var cash_numbers = [];
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		document.getElementById("total").innerHTML = "<span class='span'>Total</span> ???" + numberWithCommas(<%=salesInfo.get("?????????") %>);
		document.getElementById("cash").innerHTML = "<span class='span'>Cash</span> ???" + numberWithCommas(<%=salesInfo.get("????????????") %>);
		document.getElementById("card").innerHTML = "<span class='span'>Card</span> ???" + numberWithCommas(<%=salesInfo.get("????????????") %>);
		<%
			for(String str: weekCardSalesKeys){
				%>dates.push("<%=str%>");
				card_numbers.push("<%=weekCardSales.get(str)%>");
				<%
			}
		%>
		<%
			for(String str: weekCardSalesKeys){
				%>
				cash_numbers.push("<%=weekCashSales.get(str)%>");
				<%
			}
		%>
		var data_card = {
				label: "??????",
				data: card_numbers,
				backgroundColor: "rgba(39,79,76,.5)",
				borderColor: "rgba(39,79,76)",
				borderWidth: 1,
				tension: 0.1
		}
		var data_cash = {
				label: "??????",
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
				labels: dates,
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