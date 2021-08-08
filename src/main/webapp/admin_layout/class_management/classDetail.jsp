<%@page import="java.sql.Time"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassBean classBean = (ClassBean)request.getAttribute("classBean");
	ArrayList<Time> selectedTimeList = (ArrayList<Time>)request.getAttribute("selectedTimeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 | 클래스 상세</title>
<style>
	
</style>
<link rel="stylesheet" href="./css/admin.css">
<link rel="stylesheet" href="./css/admin_class_detail.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	function deleteContent(){
		var result = confirm("삭제하시겠습니까?");
		if(result == true){
			location.href="ClassDelete.ad?class_num=<%=classBean.getClass_id()%>";
		}
	}
	var request = new XMLHttpRequest();
	function getReservInfo(time_val){
		time_val.style.backgroundColor = "#ccc";
		var time = time_val.text;
		var place = document.getElementById("place").value;
		var date = document.getElementById("date").value;
		request.open("GET", "http://localhost:8080/project/GetReservInfo.ad?time=" + encodeURIComponent(time) + "&place=" + encodeURIComponent(place)+ "&date=" + encodeURIComponent(date) , true);
		request.onreadystatechange = getInfoProcess;
		request.send(null);
	}
	function getInfoProcess(){
		var table = document.getElementById("ajaxTable");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200){
			var object = eval('('+request.responseText+')'); 
			var result = object.result;
			for(var i = 0; i < result.length; i++){
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++){
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
	$(document).ready(function(){
		$('.admin_header_subtitle').text("클래스 상세");
		$('.times').click(function(){
			  if ($(".times").hasClass("active")) { 
			  		$(".times").removeClass("active");
			  		$(this).addClass("active");
				  }else {
					  $(this).addClass("active");
				  }
			$('.times').css('background-color', '#ffffff');
			$('.times.active').css('background-color', '#FFDF24');
		});
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
		<div class="images">
			<img id="main_img" src='<%="img_upload/"+classBean.getClass_main_img()%>'>
			<div class="sub_img">
				<img src='<%="img_upload/"+classBean.getClass_sub_img1()%>'>
				<img src='<%="img_upload/"+classBean.getClass_sub_img2()%>'>
				<img src='<%="img_upload/"+classBean.getClass_sub_img3()%>'>
			</div>
		</div>
		<div class="sub_container">
			<label>클래스명 </label><input type="text" value="<%=classBean.getClass_subject() %>" readonly><br>
			<label>클래스요약설명 </label><input type="text" value="<%=classBean.getClass_sub_desc() %>" readonly><br>
			<label>지점 </label><input type="text" id="place" value="<%=classBean.getClass_place()%>" readonly><br>
			<label>시간 </label><span id="timespan">
			<%
				for(Time time : selectedTimeList){
					%><%=time%> <%
				}
			%></span>
			<br><br>
			<label>비용 </label><input type="text" value="<%=classBean.getClass_price() %>" readonly><br>
			<label>정원 </label><input type="text" value="<%=classBean.getClass_max_member() %>" readonly><br>
			<label>게시일자 </label><input type="text" value="<%=classBean.getClass_create_date() %>" readonly><br>
			<label>클래스일자 </label><input type="text" id="date" value="<%=classBean.getClass_date() %>" readonly><br>
			<label>조회수 </label><input type="text" value="<%=classBean.getClass_readcount() %>" readonly><br>
			<label>클래스설명 </label><input type="text" value="<%=classBean.getClass_desc() %>" readonly><br>
			<input type="button" name="listBtn" value="목록" onclick="location.href='ClassList.ad'">
			<input type="button" name="modifyBtn" value="수정" onclick="location.href='ClassModifyForm.ad?class_num=<%=classBean.getClass_id()%>'">
			<input type="button" value="삭제" onclick="deleteContent()">
		</div>
	</div>
	<div class="reserv_container">
		<h1>예약정보</h1>
		<%
			for(Time time : selectedTimeList){
				%><a href="#" class="times" onclick="getReservInfo(this)"><%=time%></a><%
			}
		%>
		<table id="reserv_table" border="1">
			<thead>
				<tr>
					<th width="50">예약번호</th>
					<th width="250">ID</th>
					<th>인원</th>
					<th>신청날짜</th>
					<th>결제금액</th>
					<th>결제수단</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
				<tr>
					<td colspan="6">조회할 시간을 선택해주세요</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html> 