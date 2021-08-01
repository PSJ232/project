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
</head> 
<body>
		<%
			for(int i = 0; i < timeList.size(); i++){
				%><option><%=timeList.get(i)%></option><%
			}
		%>
</body>
</html>