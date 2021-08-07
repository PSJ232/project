<%@page import="vo.PageInfo"%>
<%@page import="vo.ReviewBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ReviewBean> reviewList = (ArrayList<ReviewBean>)request.getAttribute("reviewList");
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
		$('#filter').change(function(){
			if($(this).val() =="r_id_desc"){
				location.href="ReviewList.ad";
			}else if($(this).val() == "rate_asc"){
				location.href="ReviewList.ad?filter=rate_asc";
			}else if($(this).val() == "rate_desc"){
				location.href="ReviewList.ad?filter=rate_desc";
			}
		});
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
	<h1>오늘 작성된 리뷰</h1>
	<div class="container">
		<select name="filter" id="filter">
			<option value="">필터선택</option>
			<option value="r_id_desc">등록순</option>
			<option value="rate_asc">별점낮은순</option>
			<option value="rate_desc">별점높은순</option>
		</select>
		<table border="1" id="reviewList">
			<thead>
				<tr><th width="50">순번</th><th width="120">작성날짜</th><th width="150">작성자</th><th width="250">제목</th><th width="100">별점</th></tr>
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
		<section id="pageList">
			<% if(maxPage != 1){
				if(currentPage <= 1) {%>
						<input class="page_btn" type="button" value="<<">&nbsp;
				<%} else {%>
						<input class="page_btn" type="button" value="<<" onclick="location.href='ReviewList.ad?page=<%=currentPage - 1 %>'">&nbsp;
				<%} %>
				
				<%for(int i = startPage; i <= endPage; i++) { 
						if(i == currentPage) { %>
							<span id="selected_page_num"><%="  "+ i + "  " %></span>
					<%} else {%>
					<a id="page_num" href="ReviewList.ad?page=<%=i %>"><%="  "+ i + "  " %></a>&nbsp;
					<%} %>
				<%} %>
				
				<%if(currentPage >= maxPage) {%>
					<input class="page_btn" type="button" value=">>">
				<%} else { %>
					<input class="page_btn" type="button" value=">>" onclick="location.href='ReviewList.ad?page=<%=currentPage + 1 %>'">
				<% } 
			}%>
		</section>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>