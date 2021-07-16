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
<style>
	select {
		width: 200px;
		height: 250px;
		font-size: 15px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="place" value=<%=request.getParameter("place") %>>
	<select name="timeList" multiple="multiple">
	<%
		for(int i = 0; i < timeList.size(); i++){
			%><option><%=timeList.get(i)%></option><%
		}
	%>
	</select>
	<input type="submit" value="저장"> 

</body>
</html>