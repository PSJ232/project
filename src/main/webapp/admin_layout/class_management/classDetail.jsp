<%@page import="java.sql.Time"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ClassBean classBean = (ClassBean)request.getAttribute("classBean");
	ArrayList<Time> timeList = (ArrayList<Time>)request.getAttribute("timeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container {
		display: flex;
		width: 1000px;
	}
	.sub_container {
		display: inline-block;
		width: 500px;
		height: 500px;
		margin-top: 15px;
	}
	.images {
		display: inline-block;
		width: 500px;
	}
	#main_img {
		width: 308px;
		height: 308px;
	}
	.sub_img img {
		width: 100px;
		height: 100px;
	}
	label {
		width: 130px;
		float: left;
		font-weight: bold;
	}
	input[type=text]{
		margin-bottom: 30px;
		border: none;
	}
	label, input[type=text]{
		font-size: 15px;
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
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
	<!-- header -->
	
	<!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
	<div id="container">
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
			<label>지점 </label><input type="text" value="<%=classBean.getClass_place()%>" readonly><br>
			<label>비용 </label><input type="text" value="<%=classBean.getClass_price() %>" readonly><br>
			<label>정원 </label><input type="text" value="<%=classBean.getClass_max_member() %>" readonly><br>
			<label>현재인원 </label><input type="text" value="<%=classBean.getClass_current_member() %>" readonly><br>
			<label>게시일자 </label><input type="text" value="<%=classBean.getClass_create_date() %>" readonly><br>
			<label>클래스일자 </label><input type="text" value="<%=classBean.getClass_date() %>" readonly><br>
			<label>조회수 </label><input type="text" value="<%=classBean.getClass_readcount() %>" readonly><br>
			<label>클래스설명 </label><input type="text" value="<%=classBean.getClass_desc() %>" readonly><br>
			<div id="buttons">
				<input type="button" name="listBtn" value="목록" onclick="location.href='ClassList.ad'">
				<input type="button" name="modifyBtn" value="수정" onclick="location.href='ClassModifyForm.ad?class_num=<%=classBean.getClass_id()%>'">
				<input type="button" value="삭제" onclick="deleteContent()">
			</div>
		</div>
	</div>
</body>
</html> 