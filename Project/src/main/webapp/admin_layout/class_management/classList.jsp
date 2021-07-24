<%@page import="vo.ClassDetailBean"%>
<%@page import="vo.ClassBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ClassBean> classList = (ArrayList<ClassBean>)request.getAttribute("classList");
	ArrayList<ClassDetailBean> classDetailList = (ArrayList<ClassDetailBean>)request.getAttribute("classDetailList");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.class_list_container {
		margin-left: 400px;
		margin-top: 100px;
	}
	.class_content {
		background-color: #ccc;
		margin-bottom: 10px;
		width: 70% ;
		height: 150px;
	}
	.class_content img {
		width: 70px;
		height: 70px;
	}
	#class_status {
		padding: 0;
	}	
	#class_status li {
		display: inline-block;
		background-color: #ccc;
	}
	

</style>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
	<header>
		<jsp:include page="../inc/adminHeader.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="../inc/navigation.jsp"></jsp:include>
	</nav>
	<div class="class_list_container">
	<h1>Class List</h1>
	<ul id="class_status">
			<li><a href="#">시작 전 클래스</a></li>
			<li><a href="#">진행 중 클래스</a></li>
			<li><a href="#">완료된 클래스</a></li>
	</ul>
	<%
		String date = "";
		for(ClassBean cb : classList){
			%>
			<table class="class_content">
			<tr>
			<td rowspan="4" width="20"><input type="radio" name="<%=cb.getClass_id()%>" value="<%=cb.getClass_id()%>"></td>
			<td rowspan="4" width="100"><img src="<%="img_upload/"+cb.getClass_main_img() %>"/></td>
			<td width="500"><a href="ClassDetailView.ad?class_num=<%=cb.getClass_id()%>"><%=cb.getClass_subject() %></a></td>
			</tr>
			<tr>
			<td>
			<h3><%=cb.getClass_place() %></h3>
			<%
		for(ClassDetailBean cdb: classDetailList){
			if(cb.getClass_id() == cdb.getClass_id()){
				%>
					<%=cdb.getTime() %>:00:00<br>
				<%
				} 
			}
			%>
			</td>
			</tr>
			<tr><td>정원: <%=cb.getClass_max_member() %></td><td>현재인원: <%=cb.getClass_current_member() %></td></tr>
			<tr><td>등록날짜: <%=cb.getClass_create_date() %> </td><td> 클래스날짜: <%=cb.getClass_date() %></td></tr>
			</table>
			<%
		}
	%>
	<input type="button" value="클래스 등록" onclick="location.href='ClassInsertForm.ad'">
	</div>
	<footer>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</footer>
</body>
</html>