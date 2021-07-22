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
<link rel="stylesheet" href="admin_layout/css/admin.css">
<link rel="stylesheet" href="admin_layout/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<title>Insert title here</title>
<script>
	
</script>
</head> 
<body>
		<%
			if(request.getParameter("date") != ""){
			
		%>
	<div id="container"> <!-- css layout요소 추가 -->
		<input type="hidden" name="place" value=<%=request.getParameter("place") %>>
		
		<select name="timeList" id="timeList" multiple="multiple">
		<%
			
			for(int i = 0; i < timeList.size(); i++){
				%><option><%=timeList.get(i)%></option><%
			}
		%>
		</select>
		 
	</div>
		<%
			} 
		%>
</body>
</html>