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
	img {
		width: 200px;
		height: 200px;
	}
	.sub_img img {
		width: 100px;
		height: 100px;
	}
</style>
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script>
	$(document).ready(function(){
		$("#date").text(moment(<%=classBean.getClass_create_date() %>).format('YYYY-MM-DD HH:mm:ss'));
	});
	
</script>
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
		<img src='<%="img_upload/"+classBean.getClass_main_img()%>'>
		<div class="sub_img">
			<img src='<%="img_upload/"+classBean.getClass_sub_img1()%>'>
			<img src='<%="img_upload/"+classBean.getClass_sub_img2()%>'>
			<img src='<%="img_upload/"+classBean.getClass_sub_img3()%>'>
		</div>
		<h3><%=classBean.getClass_subject() %></h3>
		<h4><%=classBean.getClass_desc() %></h4>
		<h4>장소: <%=classBean.getClass_place()%></h4>
		<h4>가격:	<%=classBean.getClass_price() %></h4>
		<span>정원: <%=classBean.getClass_max_member() %></span>
		<span>현재인원: <%=classBean.getClass_current_member() %></span>
		<span id="date">게시일자: <%=classBean.getClass_create_date() %></span>
		<span>클래스일자: <%=classBean.getClass_date() %></span>
		<span>조회수: <%=classBean.getClass_readcount() %></span>
		<input type="button" name="listBtn" value="목록" onclick="location.href='ClassList.ad'">
		<input type="button" name="modifyBtn" value="수정" onclick="location.href='ClassModifyForm.ad?class_num=<%=classBean.getClass_id()%>'">
		<input type="button" value="삭제" onclick="deleteContent()">
	</div>
</body>
</html> 