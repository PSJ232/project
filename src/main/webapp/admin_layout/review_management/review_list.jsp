<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 리뷰목록</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/list_style.css">
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
					row.innerHTML = "<td id=content_" + r_id + " colspan='5'>" + result[0].value + "</td>";
				}
			};
			request.send(null);
			
		}else{
			document.getElementById('content_'+r_id).parentNode.remove();
		}
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("리뷰 목록");
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
		<table border="1" id="reviewList">
			<thead>
				<tr><th width="50">순번</th><th width="120">작성날짜</th><th width="150">작성자</th><th width="250">제목</th><th width="100">평점</th></tr>
			</thead>
			<tbody>
				<%
					for(int i = 0; i < reviewList.size(); i++){
						%><tr id="showContent" onclick="getContent(<%=reviewList.get(i).getR_id()%>,this)">
						<td><%=reviewList.get(i).getR_id() %></td>
						<td><%=reviewList.get(i).getR_rdate() %></td>
						<td><%=reviewList.get(i).getR_writer() %></td>
						<td><%=reviewList.get(i).getR_title() %></td>
						<td>
						<%
						for(int j=0; j < reviewList.get(i).getR_rate(); j++){
							%>★<%
						}
						%>
						</td>	
						</tr><%
					}
				%>
			</tbody>
		</table>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>