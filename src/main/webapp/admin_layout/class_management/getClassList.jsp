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
<link rel="stylesheet" href="./css/admin.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
	#img {
		width: 150px;
		height: 150px;
		border-radius: 5px;
		border: 1px solid #fff;
	}
	
	.class_content {
		margin-bottom: 10px;
		width: 700px ;
		height: 150px;
		border: 1px solid #ccc;
		border-radius: 5px;
		padding: 5px;
	}
	
	.class_content:nth-child(odd){
		background-color: #eee;
		border: 1px solid #eee;
	}
	
	#btn {
		width: 150px;
		height: 45px;
		border: 1px solid #fff;
		border-radius: 7px;
		background-color: #FFDF24;
		font-size: 20px;
		margin-left: 550px;
		margin-bottom: 20px;
	}
	#btn:hover {
		background-color: #FFCD12;
		cursor:pointer;
	}
	#class_subject:hover {
		color: #FFDF24;
	}
</style>
</head>
<body>
	<%
			for(ClassBean cb : classList){
				%>
				<table class="class_content">
				<tr>
				<td rowspan="4" width="5"><img id="img" src="<%="img_upload/"+cb.getClass_main_img() %>"/></td>
				<td width="500"><h2 ><a id="class_subject" href="ClassDetailView.ad?class_num=<%=cb.getClass_id()%>"><%=cb.getClass_subject() %></a></h2></td>
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
				<tr><td>정원: <%=cb.getClass_current_member() %> / <%=cb.getClass_max_member() %></td></tr>
				<tr><td> 클래스날짜: <%=cb.getClass_date() %></td></tr>
				</table>
				<%
			}
	%>
	<input type="button" value="클래스 등록" id="btn" onclick="location.href='ClassInsertForm.ad'">
</body>
</html>