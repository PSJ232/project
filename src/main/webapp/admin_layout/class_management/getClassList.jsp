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
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

</head>
<body>
	<%
			String date = "";
			for(ClassBean cb : classList){
				%>
				<table class="class_content">
				<tr>
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
</body>
</html>