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
	.container {
		display: flex;
		width: 1000px;
		margin-left: 450px;
		margin-top: 120px;
		margin-bottom: 50px;
	}
	.reserv_container {
		width: 1000px;
		margin-left: 450px;
		margin-top: 120px;
		margin-bottom: 100px;
		display: inline-block;
	}
	.sub_container {
		display: inline-block;
		width: 500px;
		height: 500px;
		margin-top: 15px;
	}
	.images {
		margin-top: 15px;
		display: inline-block;
		width: 500px;
	}
	#main_img {
		width: 308px;
		height: 308px;
		border: 1px solid #fff;
		border-radius: 5px;
	}
	.sub_img {
		margin-top: 10px;
	}
	.sub_img img {
		width: 100px;
		height: 100px;
		border: 1px solid #fff;
		border-radius: 5px;
	}
	label {
		width: 130px;
		float: left;
		font-weight: bold;
	}
	input[type=text]{
		margin-bottom: 30px;
		border: none;
		outline:none;
	}
	label, input[type=text]{
		font-size: 15px;
	}
	input[type=button]{
		width: 100px;
		height: 40px;
		border: 1px solid #fff;
		border-radius: 5px;
		background-color: #FFDF24;
		margin-top: 10px;
	}
	input[type=button]:hover {
		background-color: #FFCD12;
		cursor: pointer;
	}
	#timespan {
		font-size: 15px;
	}
	#times {
		display: inline-block;
		margin-right: 10px;
		margin-top: 20px;
		margin-bottom: 30px;
	}
	#reserv_table {
		margin-top: 30px;
		margin-bottom: 100px;
		width: 800px;
		text-align: center;
		border: 1px solid #ececec;
		border-collapse: collapse;
		border-radius: 10px;
	}
	#reserv_table th,td {
		padding: 10px;
	}
	#reserv_table th {
		background-color: #f7f7f7;
	}
	#reserv_table tr:hover {
		background-color: #FFDF24;
	}
</style>
<link rel="stylesheet" href="./css/admin.css">
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
		$('#times').click(function(){
			$('#times').css('background-color', '#fff');
			$(this).css('background-color', '#FFDF24');
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
			<label>현재인원 </label><input type="text" value="<%=classBean.getClass_current_member() %>" readonly><br>
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
				%><h2 id="times"><a href="#" onclick="getReservInfo(this)"><%=time%></a></h2><%
			}
		%>
		<table id="reserv_table" border="1">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>ID</th>
					<th>인원</th>
					<th>신청날짜</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
				<tr>
					<td colspan="4">조회할 시간을 선택해주세요</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html> 