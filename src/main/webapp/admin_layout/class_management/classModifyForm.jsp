<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ClassBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	
%>
<title>관리자 | 클래스수정</title>
<style>
	body {
		text-align: center;
	}
</style>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<%
	ClassBean classBean = (ClassBean)request.getAttribute("classBean");
	ArrayList<Time> selectableTimeList = (ArrayList<Time>)request.getAttribute("selectableTimeList");
%>
</head>
<body>
	<!-- header -->
	<jsp:include page="/inc/adminHeader.jsp" ></jsp:include>
	<!-- header -->
	
	<!-- nav -->
	<jsp:include page="/inc/navigation.jsp" ></jsp:include>
	<!-- nav -->
   <!-- onclick하면 ajax로 띄워주기 -->
<div id="container"> <!-- css layout요소 추가 -->
		<h1>클래스 수정</h1>
		<form action="ClassModifyPro.ad?class_num=<%=classBean.getClass_id() %>" method="post" enctype="multipart/form-data" name="modify_form">
			<div class="class_modify_container">
				클래스 이름: <input type="text" name="class_subject" value="<%=classBean.getClass_subject()%>"><br>
				날짜: <input type="text" id="date" name="date" value="<%=classBean.getClass_date()%>" readonly><br>
				<h1>장소</h1>
				<input type="text" name="place" value="<%=classBean.getClass_place() %>" readonly>
				<h3>시간추가</h3>
				<select name="timeList" id="timeList" multiple="multiple">
				<%
					for(Time time: selectableTimeList){
						%><option><%=time %></option><%
					}
				%>
				</select><br>
				클래스 설명: <textarea name="class_desc" rows="30" cols="100"><%=classBean.getClass_desc() %></textarea><br>
				비용: <input type="text" name="class_cost" value="<%=classBean.getClass_price()%>" readonly><br>
				정원: <input type="text" name="max_member" value="<%=classBean.getClass_max_member()%>"><br>
				메인 이미지: <input type="file" name="class_main_img" ><br>
				서브 이미지1: <input type="file" name="class_sub_img1" ><br>
				서브 이미지2: <input type="file" name="class_sub_img2" ><br>
				서브 이미지3: <input type="file" name="class_sub_img3" ><br>
				<input type="hidden" name="ori_main_img" value="<%=classBean.getClass_main_img()%>">
				<input type="hidden" name="ori_sub_img1" value="<%=classBean.getClass_sub_img1()%>">
				<input type="hidden" name="ori_sub_img2" value="<%=classBean.getClass_sub_img2()%>">
				<input type="hidden" name="ori_sub_img3" value="<%=classBean.getClass_sub_img3()%>">
				<input type="submit" value="수정">
			</div>
		</form>
	</div>
	<footer>
		<jsp:include page="/inc/footer.jsp"></jsp:include>
	</footer>

</html>