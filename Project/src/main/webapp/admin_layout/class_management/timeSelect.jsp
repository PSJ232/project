<%@page import="java.sql.Time"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Time> timeList = (ArrayList<Time>)request.getAttribute("timeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	select {
		width: 200px;
		height: 250px;
		font-size: 15px;
	}
</style>
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<div id="container"> <!-- css layout요소 추가 -->
		<input type="hidden" name="place" value=<%=request.getParameter("place") %>>
		<select name="timeList" multiple="multiple">
		<%
			for(int i = 0; i < timeList.size(); i++){
				%><option><%=timeList.get(i)%></option><%
			}
		%>
		</select>
		<input type="submit" value="저장"> 
	</div>
</body>
</html>