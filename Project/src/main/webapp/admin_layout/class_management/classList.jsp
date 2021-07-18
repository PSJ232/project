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
		margin-left: 300px;
		
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
</head>
<body>
	<header>
		<jsp:include page="../partial/header.jsp"></jsp:include>
	</header>
	<jsp:include page="../partial/navi.jsp"></jsp:include>
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
			<td width="500"><%=cb.getClass_subject() %></td>
			</tr>
			<tr>
			<td>
			<%
		for(ClassDetailBean cdb: classDetailList){
			if(cb.getClass_id() == cdb.getClassNum()){
				date = cdb.getDate();
				%>
					<%=cdb.getTime() %>:00:00<br>
				<%
				}
			}
			%>
			</td>
			</tr>
			<tr><td>정원: <%=cb.getClass_max_member() %></td><td>현재인원: <%=cb.getClass_current_member() %></td></tr>
			<tr><td>등록날짜: <%=cb.getClass_create_date() %> </td><td> 클래스날짜: <%=date %></td></tr>
			</table>
			<%
		}
	%>
	<input type="button" value="클래스 등록" onclick="location.href='ClassInsertForm.ad'">
	<input type="button" value="클래스 삭제" onclick="location.href='ClassDeletePro.ad'">
	</div>
	<footer>
		<jsp:include page="../partial/footer.jsp"></jsp:include>
	</footer>
</body>
</html>